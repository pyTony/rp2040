from intelhex import IntelHex
HEXFILE = "./bootrom.hex"

code = IntelHex(HEXFILE)
# for blink.hex + 0x000000ee # looked from bootrom.dis
start = code.minaddr() + 0xee  # offset to start in bootrom
# for small programs + 0x370
num_instructions = 10000

cond = "eq ne cs cc mi pl vs vc hi ls ge lt gt le".split() + [""]

# APSR      The flags from previous instructions.   0 = 0b00000:000
# IAPSR     A composite of IPSR and APSR.           1 = 0b00000:001
# EAPSR     A composite of EPSR and APSR.           2 = 0b00000:010
# XPSR      A composite of all three PSR registers. 3 = 0b00000:011I
# PSR       The Interrupt status register.          5 = 0b00000:101
# EPSR      The execution status register.bb.
#           The EPSR bitfield exhibits RAZ behavior.6 = 0b00000:110
# IEPSR     A composite of IPSR and EPSR.           7 = 0b00000:111
# MSP       The Main Stack pointer.                 8 = 0b00001:000
# PSP       The Process Stack pointer.              9 = 0b00001:001

sysR = "ASPR IAPSR EAPSR XPSR NONE PSR EPSR IEPSR MSP PSP".split()

# assert cond[-1] == ""


def get_opcode(instruction):
    """ highest 6 bits 15...10
    """
    return instruction >> 10


def bits(start, end, binary_number):
    numbits = (start-end+1)
    binary_number = binary_number >> end
    return binary_number & ((1 << numbits)-1)

# googled function for sign_extend, not used now, using the


def sign_extend(opcode, bits):
    sign_bit = 1 << (bits - 1)
    return (opcode & (sign_bit - 1)) - (opcode & sign_bit)


def bytes_to_halfword(mem, addr, bigendian=True):
    """ joins two bytes to halfword, default bigendian """
    return mem[addr]+mem[addr+1]*0x100 if bigendian else 0x100*mem[addr] + mem[addr+1]


def get_register_list(halfword):
    """ interpret the low byte as list of registers """
    registers, register_list = halfword & 0xff, []
    for reg in range(8):
        if registers & 1:
            # print(reg)
            register_list.append("r{}".format(reg))
        registers >>= 1
        if registers == 0:
            break
    if halfword & 1 << 8:
        register_list.append('lr')
    return register_list


def get_three_registers(halfword):
    rd = halfword & 0b111
    rm = (halfword >> 3) & 0b111
    rn = (halfword >> 6) & 0b111
    return rd, rm, rn


assert get_three_registers(0x1840) == (0, 0, 1)


def get_two_registers(halfword):
    """
    return dn from last bits and m from 3 bits before
    """
    halfword &= 0b111111
    return halfword & 0b111, halfword >> 3


def get_one_register(halfword):
    return halfword >> 8 & 0b111


def get_imm3(halfword):
    return bits(8, 6, halfword)


def get_imm5(halfword):
    return bits(10, 6, halfword)


def get_imm5_ext(halfword, ext):
    """ ext b10..b6
    """
    return (ext << 5) + bits(10, 6, halfword)


def get_imm8(halfword):
    return halfword & 0xff


def get_opA_opB(halfword):
    """ return 7 highest bits as ops """
    return bits(15, 12, halfword), bits(11, 9, halfword)


def get_branch(pc, halfword):
    op1, op2 = bits(10, 4, halfword), bits(14, 12, halfword)
    if op2 > 2:
        return "Branch with link ; A5-85"
    else:
        op2 >>= 1
        if op2 == 0b011100:
            return "Move to special register on page B4-266"
        elif op2 == 0b011101:
            return "Miscellaneous control instructions on page A5-86"
        elif op2 == 0b011111:
            return "UDF"  # a6-171
        else:
            return "UNRECOGNIZED INSTRUCTION ; {0:016b}".format(halfword)


def disassemble(pc, halfword):
    opc = get_opcode(halfword)
    if opc & 0b111000 == 0b111000:
        # 0x00 temporary, to catch e793, check later
        if bits(12, 11, halfword) == 0x10:
            return get_branch(pc, halfword)
        elif bits(12, 11, halfword) != 0:
            # not 32 bit
            # e793 1110011110010011
            return "(32-bit)"
        elif opc >> 1 == 0b011100:
            # 00000106 e793 1110011110010011 111001 e793 b.n	30 <_dead>
            imm11 = bits(10, 0, halfword) << 1
            if imm11 & (1 << 11):
                imm11=(imm11 & 0x7ff) - 0x800  # signed two's complement
            pc += imm11 + 4
            return "b.n  {0:x}".format(pc)
        else:
            # 00000106 e793 1110011110010011 111001 e793 b.n	30 <_dead>
            return "other {0:06b}".format(opc)
    elif (opc >> 1) == 0b11100:
        imm11=bits(10, 0, opc) << 1
        if imm11 & (1 << 11):
            imm11=(imm11 & 0x7ff) - 0x800  # signed two's complement

        pc += imm11 + 4
        return "b.n  {0:x}".format(pc)

    elif opc < 0b10000:
        opc=bits(13, 9, halfword)  # also bit 9

        if opc == 0b1100:
            # 114:	1840 0001100001000000     	adds	r0, r0, r1
            return "adds r{}, r{}, r{}".format(*get_three_registers(halfword))
        elif opc == 0b1101:
            return "sub reg A6-165"
        elif opc == 0b01110:
            return "adds r{0}, r{1}, #{2}   ;0x{2:x}".format(*get_two_registers(halfword), get_imm3(halfword))
        elif opc == 0b01111:
            return "subs  r{0}, r{1}, #{2}   ;0x{2:x}".format(*get_two_registers(halfword), get_imm3(halfword))
        opc >>= 2  # last bits do not matter for others
# print("c>>2 = {0:08b}".format(c))
        two_reg=get_two_registers(halfword)
        if opc == 0:
            if bits(10, 6, halfword) == 0:
                # A6-140
                start="nop     ; " if two_reg[0] == two_reg[1] else ""
                return start + "movs {}".format(', '.join('r%i' % n for n in two_reg))
            else:
                # A6-135
                return "lsls  {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), get_imm5(halfword))
        elif opc == 0b001:
            ## NEED FIXING
            # does not get 142:	0849      	lsrs	r1, r1, #1
            # A6-137
            lsrs = get_imm5(halfword)
            lsrs = lsrs or 32 # zero becomes 32
            return "lsrs  {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), lsrs)
        elif opc == 0b010:
            # A6-108
            return "asr   {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), get_imm5_ext(halfword, 0b10))
        elif opc == 0b100:
            # A6-139
            return "movs r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif opc == 0b101:
            # A6-117
            return "cmp r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif opc == 0b110:
            # 336:	0011000000011010 001100  301a    	adds	r0, #26
            return "adds r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif opc == 0b111:
           return "subs r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        return "A5-79"
    elif opc == 0b010000:
        """
        opcode  Instruction                 See
        0000    Bitwise AND                 AND (register) on page A6-107
        0001    Exclusive OR                EOR (register) on page A6-123
        0010    Logical Shift Left          LSL (register) on page A6-136
        0011    Logical Shift Right         LSR (register) on page A6-138
        0100    Arithmetic Shift Right      ASR (register) on page A6-109
        0101    Add with Carry              ADC (register) on page A6-100
        0110    Subtract with Carry         SBC (register) on page A6-155
        0111    Rotate Right                ROR (register) on page A6-153
        1000    Set flags on bitwise AND    TST (register) on page A6-170
        1001    Reverse Subtract from 0     RSB (immediate) on page A6-154
        1010    Compare Registers           CMP (register) on page A6-118
        1011    Compare Negative            CMN (register) on page A6-116
        1100    Logical OR                  ORR (register) on page A6-147
        1101    Multiply Two Registers      MUL on page A6-143
        1110    Bit Clear                   BIC (register) on page A6-111
        1111    Bitwise NOT                 MVN (register) on page A6-144
        """
        opc=bits(9, 6, halfword)
        operation=(
            'ands eors lsl lsr ars adc sbc ror tst rsb cmp cmn orr muls bic mvn'.split())
        # check the rest conform, two first ones checked
        return "{}  r{}, r{}".format(operation[opc], *get_two_registers(halfword))
    elif bits(5, 2, opc) == 0b1111:
        # A5-84 hints
        halfword &= 0xf
        if halfword != 0:
            return "UNDEFINED"
        else:
            return "nop yield wfe wfi sev".split()[bits(7, 5, halfword)]+" ; HINT"

    elif opc == 0b010001:
        """
        opcode: bits(9,6)
        00xx    Add Registers          ADD (register) on page A6-102
        0100    UNPREDICTABLE          -
        0101    Compare Registers      CMP (register) on page A6-118
        011x
        10xx    Move Registers         MOV (register) on page A6-140
        110x    Branch and Exchange    BX on page A6-115
        111x    Branch with Link
                and Exchange           BLX (register) on page A6-114
        """
        opc=bits(9, 6, halfword)
        if opc == 0b0100:
            return "UNPREDICTABLE"
        elif opc == 0b0101:
            # 0101    Compare Registers      CMP (register) on page A6-118
            # Encoding T2, N = bit7 = 0
            N=bits(7, 7, halfword)
            assert N == 0
            m=bits(6, 3, halfword)
            n=bits(2, 0, halfword)
            return "cmp {}, {}".format(m, n)

        opc >>= 1  # discard last bit
        if halfword < 0b100000:
            # MOVS A5-140
            # setting flags, if simulating
            # not entered any time in bootrom
            setflag=True
            return "MOVS A5-140"
        elif halfword >> 8 == 0b1000110:
            # MOV with 4 bit m, bit 4 of n is set to bit7 value
            m=bits(6, 3, halfword)
            n=(bits(7, 7, halfword) << 3) + bits(2, 0, halfword)
            instr = "mov  r{}, r{}"
            instr = ("nop  ; (" + instr +")") if m == n else instr
            return instr.format(m, n)
        elif opc >> 1 == 0:
            # 00xx    Add Registers          ADD (register) on page A6-102
            rdn, rm=get_two_registers(halfword)
            rdn += bits(7, 7, halfword) << 3
            if rdn == 0b1011 or rm == 0b1011:
                return "SEE ADD (SP plus register)"
            else:
                # do not set flags
                if rdn == rm == 15:
                    return "UNPREDICTABLE"
                else:
                    return "adds r{}, r{}".format(rdn, rm)
                return "adds unrecognized"
        elif opc == 0b111:
            # 110x    Branch and Exchange    blx on page A6-114
            return "blx  r{}".format(bits(6, 3, halfword))
        elif bits(15, 7, halfword) == 0b010001110:
            # 00000134 4730 0100011100110000 010001 bx	r6 ; A6-115
            r = bits(6, 3, halfword)
            instr = "bx lr" if r == 14 else "bx r{}".format(r)
            return instr
        return "A5-81 {0:04b}".format(opc)
    elif bits(5, 1, opc) == 0b01001:
        # ee:	4873   0100100001110011 010010 	ldr	r0, [pc, #460]	; (2bc <async_task_worker_thunk+0x14>)
        # register, pc + 32 bit address A6-127
        return "ldr  r{0}, [pc, #{1}] ; 0x{1:04x}".format(
            get_one_register(halfword), (halfword & 0xff) << 2)
    elif bits(15, 10, halfword) == 0b010001:
        opA, opB=ops=get_opA_opB(halfword)
        # 00xx       Add Registers          ADD (register) on page A6-102
        # 0100       UNPREDICTABLE          -
        # 0101, 011x Compare Registers      CMP (register) on page A6-118
        # 10xx       Move Registers         MOV (register) on page A6-140
        # 110x       Branch and Exchange    BX on page A6-115
        # 111x       Branch with Link
        #            and Exchange           BLX (register) on page A6
        # 10000390 6993 0110100110010011 011010 A5-80 0110 opA: 0b110, opB: ob0100
        return "A5-81 opA: 0b{0:03b}, opB: ob{1:04b}".format(opA, opB)
    elif bits(5, 1, opc) == 0b01001:
        return "A6-127"
    elif bits(5, 3, opc) in (0b011, 0b100) or bits(5, 2, opc) == 0b0101:
        opA, opB=ops=get_opA_opB(halfword)
        rt=halfword & 0b111
        rn=(halfword >> 3) & 0b111
        rm=(halfword >> 6) & 0b111
        if ops == (0b0101, 0b000):
            return "str unimplemented form"
        elif ops == (0b0110, 0b001):
            imm=get_imm5(halfword) << 2
            return "str  {0} ; 0x{1:x} imm5".format('r%i, [r%i, #%i]' % (*get_two_registers(halfword), imm), imm)
        elif opA == 0b0110:
            imm=get_imm5(halfword) << 2
            # one in highest bit of ops2 means str
            instruction="ldr" if ops[1] & 0b100 else "str"
            # 11a:	6038  0110000000111000 011000   str	r0, [r7, #0]
            # fe:	680a  0110100000001010 011010 	ldr	r2, [r1, #0]
            return instruction + "  {0} ; 0x{1:x}".format('r%i, [r%i, #%i]' % (*get_two_registers(halfword), imm), imm)
        elif ops == (0b0101, 0b000):
            return "str r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b001):
            return "strh r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b010):
            return "strb r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b011):
            return "ldrsb r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b100):
            return "ldr r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b101):
            return "ldrh r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b110):
            return "ldrb r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0101, 0b111):
            return "ldrsh r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops[0] == 0b0111:
            instr="strb" if opB & 1 else "ldrb"
            two_reg=get_two_registers(halfword)
            return (instr+" r{0}, [r{1}, #{2}]").format(*two_reg, get_imm5(halfword))
        elif ops == (0b1000, 0b001):
            return "strh r{}, [r{}, #{}]".format(rt, rn, get_imm5(halfword) << 1)
        elif ops == (0b1000, 0b101):
            return "ldrh r{}, [r{}, #{}]".format(rt, rn, get_imm5(halfword) << 1)
        elif ops == (0b1001, 0b001):
            rn = "sp" if rn == 0 else "r{}".format(rt)
            return "str r{}, [{}, #{}]".format(rt, rn, get_imm5(halfword))
        return "A5-82 {0:04b} {1:03b}".format(*ops)
    # c bit 5  = halfword bit 15 c is bit 15-10
    elif bits(5, 1, opc) == 0b10100:
        return "add r{0}, pc, #{1} ; #{1:0x}".format(get_one_register(halfword), get_imm8(halfword) << 2 )
    elif bits(5, 1, opc) == 0b10101:
        return "A6-104"
    elif bits(5, 2, opc) == 0b1011:
        opc=bits(11, 5, halfword)
        register_list=get_register_list(halfword)
        if opc < 0b100:
            return "add SP plus immediate"
        elif opc < 0b1000:
            return "sub SP plus immediate"
        elif opc == 0b0110011:
            return "cps"
        elif bits(11, 9, halfword) == 0b010:
            return "push {%s}" % ', '.join(register_list)
        elif bits(11, 9, halfword) == 0b110:
            return "pop {%s}" % ', '.join(register_list)
        else:
            opc >>= 1  # do not care anymore about the last bit
            # partial return, continue HERE
            codes={0b001000: "sxth ; a6-169", 0b001001: "sxtb ; a6-168",
                     0b001010: "uxth ; a6-173", 0b001011: "uxtb ; a6-172",
                     0b101000: "rev r{}, r{}".format(*get_two_registers(halfword)),
                     0b101001: "revsh r{}, r{}".format(*get_two_registers(halfword)),
                     0b111101: "sev ; a6-156", 0b111100: "wfe ; Wait For Event",
                     0b111000: "bkpt 0x{:04x}".format(get_imm8(halfword)<<2)}
            try:
                return codes[opc]
            except KeyError:
                return "Hint instruction code {0:06b}".format(opc)
        return "A5-83"
    elif bits(5, 1, opc) == 0b11000:
        return "ASTM, STMIA, STME A6-157"
    elif bits(5, 1, opc) == 0b11001:
        register_list = get_register_list(halfword)
        excl = "!" if register_list[-1]=='lr' else ""
        register_list = register_list[:-1]
        return "ldmia r%i%s, {%s}" % (get_one_register(halfword), excl,  ', '.join(register_list))
    elif bits(5, 2, opc) == 0b1101:
        # B on page A6-110 case one
        imm8=(bits(10, 0, halfword) & 0xff) << 1
        # signed two's complement
        imm8=sign_extend(imm8, 8)
        pc += imm8 + 4
        return "b{0}.n {1:x} ; PC + {2}".format(cond[bits(11, 8, halfword)], pc, imm8 + 4)
    else:
        return "Not recognized"


def get_bl(pc, ins1, ins2):
    op1, op2=bits(10, 4, ins1), bits(14, 12, ins2)
    # A5-85
    if op2 & 0b101 == 0b101:
        # bl A6-113
        s=bits(10, 10, ins1)

        j1, j2=bits(13, 13, ins2), bits(11, 11, ins2)
        # i1, i2 = j1, j2 #(j1^s)>0, (j2^s)>0
        imm10=bits(9, 0, ins1)
        imm12=bits(10, 0, ins2) << 1
        addr=(s << 22) + (imm10 << 12) + imm12
# assert "{:010b}{:011b}0".format(imm10,imm11,addr) == "{:022b}".format(addr)
# addr += (i1<<22)+(i2<21)
        if s:
            addr=sign_extend(addr, 23)  # signed two's complement
        return "bl   {:x}".format(pc+addr)
    elif ins1 >> 4 == 0b111100111000:
        # Move to Special Register from ARM Register
        #
        # 11c:	1111001110000010  1000100000001000 f382 8808 	msr	MSP, r2
        #                                                   Binary value shown split into the fields used
        #                                                   in the instruction operation pseudocode,
        #                                                   SYSm<7:3>:SYSm<2:0>.
       # PRIMASK   Register to mask out configurable exceptions
        # .cc.      Raises the current priority to 0 when set to 1. This is a 1-bit register.16 = 0b00010:000
        # CONTROL   The CONTROL register, see The special-purpose CONTROL register on page B1-189.20 = 0b00010:100
        # -Reserved.Other values
        sysM=ins2 & 0xf
        return "msr {}, r{}".format(sysR[sysM], ins1 & 0b111)
    return "To be implemented"

assert get_opcode(0xff00) == 0b111111
assert bits(15, 10, 0xff00) == 0b111111
assert get_imm5(0x04ad) == 0b10010
assert get_imm5_ext(0x04ad, 0b10) == 0b1010010
assert get_imm5(0x6265) << 2 == 36

prev=""
f=open("my_bootrom_start.s", "w+")
with f as out_file:
    for pc in range(start, start + num_instructions, 2):  # code.maxaddr()
        if prev == "(32-bit)":
            bl=get_bl(pc+2, opcode, bytes_to_halfword(code, pc))+"\n"
            print("{0:08x} {1:04x} {1:016b} {2:06b} {3}".format(pc,
                                                                bytes_to_halfword(
                                                                    code, pc),
                                                                get_opcode(
                                                                    opcode),
                                                                bl),
                  file=out_file)

            prev=""
        else:
            opcode=bytes_to_halfword(code, pc)
            prev=disassemble(pc, opcode)
            # mnemonic starts with b for branch or an nop (probable high byte of data)
            # add newline to clarify blocks
            if prev[0] == 'b' or prev.startswith('nop'):
                prev += "\n"
            print("{0:08x} {1:04x} {1:016b} {2:06b} {3}".format(pc,
                                                                opcode,
                                                                get_opcode(
                                                                    opcode),
                                                                prev),
                  file=out_file)
