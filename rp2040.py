from intelhex import IntelHex
HEXFILE = "./bootrom.hex"

code = IntelHex(HEXFILE)
# for blink.hex + 0x000000ee # looked from bootrom.dis
start = code.minaddr() + 0xee
num_instructions = 10000

cond = "eq ne cs cc mi pl vs vc hi ls ge lt gt le".split() + [""]
assert cond[-1] == ""
num_instructions = 10000
regs = ["r{}".format(r) for r in range(12)] + 'ip lr sp pc'.split()
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

# was APSR instead of PRIMASK, but changed for matching the disassembly
# POSSIBLY WRONG
# PRIMASK   Register to mask out configurable exceptions.cc.
#           Raises the current priority to 0 when set to 1.
#           This is a 1-bit register.               16 = 0b00010:000
sysR = "APSR IAPSR EAPSR XPSR NONE PSR EPSR IEPSR MSP PSP".split()


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

def get_register_list(halfword, r14=True):
    registers, register_list = halfword & 0xff, []
    for reg in range(8):
        if registers & 1:
            register_list.append(reg)
        registers >>= 1
        if registers == 0:
            break
    if r14 and halfword & (1 << 8):
        register_list.append(14)
    return register_list

assert get_register_list(0x1278)==get_register_list(0x3478)
assert get_register_list(0xc078, False)==get_register_list(0xc978, False)

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
        pc += 4
        return "b.n {:x}".format((bits(10, 0, halfword) << 1) + pc)
    else:
        op2 >>= 1
        if op2 == 0b011100:
            return "Move to special register on page B4-266"
        elif op2 == 0b011101:
            return "Miscellaneous control instructions on page A5-86"
        elif op2 == 0b011111:
            return "UDF  ; a6-171"
        else:
            return "UNRECOGNIZED INSTRUCTION ; {0:016b}".format(halfword)


def disassemble(pc, halfword):
    opc = get_opcode(halfword)
    if opc & 0b111000 == 0b111000:
        if bits(12, 11, halfword) in (0x0, 0x10):
            return get_branch(pc, halfword)
        else:
            return "(32-bit)"
    elif opc < 0b10000:
        c = bits(13, 9, halfword)  # also bit 9

        if c == 0b01110:
            return "adds r{0}, r{1}, #{2}   ;0x{2:x}".format(*get_two_registers(halfword), get_imm3(halfword))
        elif c == 0b01111:
            return "subs  r{0}, r{1}, #{2}   ;0x{2:x}".format(*get_two_registers(halfword), get_imm3(halfword))
        c >>= 2  # last bits do not matter for others
        two_reg = get_two_registers(halfword)
        if c == 0:
            if bits(10, 6, halfword) == 0:
                # A6-140
                start = "nop     ; " if two_reg[0] == two_reg[1] else ""
                return start + "movs {}".format(', '.join('r%i' % n for n in two_reg))
            else:
                # A6-135
                return "lsls  {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), get_imm5(halfword))
        elif c == 0b001:
           # A6-137
            lsrs = get_imm5(halfword)
            lsrs = lsrs or 32  # zero becomes 32
            return "lsrs  {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), lsrs)
        elif c == 0b010:
            # A6-108
            return "asr   {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), get_imm5_ext(halfword, 0b10))
        elif c == 0b100:
            # A6-139
            return "movs r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif c == 0b101:
            # A6-117
            return "cmp r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif c == 0b110:
            # 336:	0011000000011010 001100  301a    	adds	r0, #26
            return "adds r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif c == 0b111:
            return "subs r{0}, #{1}  ; 0x{1:02x}".format(get_one_register(halfword), get_imm8(halfword))
        elif halfword >> 9 == 0xc:
            return "adds r{0}, r{1}, r{2}".format(*get_three_registers(halfword))
        elif halfword >> 9 == 0xd:
            return "subs r{0}, r{1}, r{2}".format(*get_three_registers(halfword))
        return "Not recognized"
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
        opc = bits(9, 6, halfword)
        operation = (
            'and eors lsl lsr ars adc sbc ror tst rsb cmp cmn orr mul bic mvn'.split())
        # check the rest conform, two first ones checked
        return "{}  r{}, r{}".format(operation[opc], *get_two_registers(halfword))
    elif opc == 0b010001:
        """
        opcode: bits(9,6)
        00xx  lif opc < 0b10000:
        opc=bits(13, 9, halfword)  # also bit 9
        """
        if opc == 0b1100:
            # 114:	1840 0001100001000000     	adds	r0, r0, r1
            return "adds r{}, r{}, r{}".format(*get_three_registers(halfword))
        elif opc == 0b1101:
            return "sub reg A6-165"
        elif opc == 0b01110:
            return "adds r{0}, r{1}, #{2}   ;0x{2:x}".format(*get_two_registers(halfword), get_imm3(halfword))
        elif opc == 0b01111:
            return "subs  r{0}, r{1}, #{2}   ;0x{2:x}".format(*get_two_registers(halfword), get_imm3(halfword))
        opc >>= 2  # last bits do not matter
# print("c>>2 = {0:08b}".format(c))
        two_reg = get_two_registers(halfword)
        if opc == 0:
            if bits(10, 6, halfword) == 0:
                # A6-140
                start = "nop     ; " if two_reg[0] == two_reg[1] else ""
                return start + "movs {}".format(', '.join('r%i' % n for n in two_reg))
            else:
                # A6-135
                return "lsls  {0}, #{1}".format(', '.join('r%i' % n for n in two_reg), get_imm5(halfword))
        elif opc == 0b001:
            # A6-137
            lsrs = get_imm5(halfword)
            lsrs = lsrs or 32  # zero becomes 32
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
        opc = bits(9, 6, halfword)
        operation = (
            'ands eors lsl lsr ars adc sbc ror tst rsb cmp cmn orr muls bic mvn'.split())
        # check the rest conform, two first ones checked
        return "{}  r{}, r{}".format(operation[opc], *get_two_registers(halfword))
    elif bits(5, 2, opc) == 0b1111:
        """
        Add Registers          ADD (register) on page A6-102
        0100    UNPREDICTABLE          -
        0101    Compare Registers      CMP (register) on page A6-118
        011x
        10xx    Move Registers         MOV (register) on page A6-140
        110x    Branch and Exchange    BX on page A6-115
        111x    Branch with Link
                and Exchange           BLX (register) on page A6-114
        """
        opc = bits(9, 6, halfword)
        if opc == 0b0100:
            return "UNPREDICTABLE"
        elif opc == 0b0101:
            # 0101    Compare Registers      CMP (register) on page A6-118
            # Encoding T2, N = bit7 = 0
            N = bits(7, 7, halfword)
            assert N == 0
            m = bits(6, 3, halfword)
            n = bits(2, 0, halfword)
            return "cmp {}, {}".format(m, n)

        opc >>= 1  # discard last bit
        if halfword >> 8 == 0b1000110:
            # MOV with 4 bit m, bit 4 of n is set to bit7 value
            m = bits(6, 3, halfword)
            n = (bits(7, 7, halfword) << 3) + bits(2, 0, halfword)
            start = "NOP  ; " if m == n else ""
            return start+"mov  r{}, r{}".format(m, n)
        elif opc == 0b111:
            # 110x    Branch and Exchange   blx on page A6-114
            return "blx  r{}".format(bits(6, 3, halfword))
        elif bits(15, 7, halfword) == 0b010001110:
            # 00000134 4730 0100011100110000 010001 bx	r6 ; A6-115
            r = bits(6, 3, halfword)
            instr = "bx lr" if r == 14 else "bx r{}".format(r)
            return instr
        return "A5-81 {0:04b}".format(opc)
    elif bits(5, 1, opc) == 0b01001:
        # ee:	4873   0100100001110011 010010 	ldr	r0, [pc, #460]	; (2bc <async_task_worker_thunk+0x14>)
        # register, pc + 32 bit address
        return "ldr  r{0}, [pc,  # {1}] ; 0x{1:04x}.format(get_one_register(halfword), (halfword & 0xff) << 2)"
    elif bits(5, 3, opc) in (0b011, 0b100) or bits(5, 2, opc) == 0b0101:
        opA, opB = ops = get_opA_opB(halfword)
        rt = halfword & 0b111
        rn = (halfword >> 3) & 0b111
        rm = (halfword >> 6) & 0b111
        if ops == (0b0101, 0b000):
            return "str unimplemented form"
        elif ops == (0b0110, 0b001):
            imm = get_imm5(halfword) << 2
            return "str  {0} ; 0x{1:x} imm5".format('r%i, [r%i, #%i]' % (*get_two_registers(halfword), imm), imm)
        elif opA == 0b0110:
            imm = get_imm5(halfword) << 2
            # one in highest bit of ops2 means str
            instruction = "ldr" if ops[1] & 0b100 else "str"
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
            instr = "strb" if opB & 1 else "ldrb"
            two_reg = get_two_registers(halfword)
            return (instr+" r{0}, [r{1}, #{2}]").format(*two_reg, get_imm5(halfword))
        elif ops == (0b1000, 0b001):
            return "strh r{}, [r{}, #{}]".format(rt, rn, get_imm5(halfword) << 1)
        elif ops == (0b1000, 0b101):
            return "ldrh r{}, [r{}, #{}]".format(rt, rn, get_imm5(halfword) << 1)
        elif ops == (0b1001, 0b001):
            rn = "sp" if rn == 0 else "r{}".format(rt)
            return "str r{}, [{}, #{}]".format(rt, rn, get_imm5(halfword))
        elif ops == (0b1000, 0b100):
            # This mayby bug in disassembler of Pico cross compiler
            # 00000fce 884b 1000100001001011 100010 lsrs	r6, r1, #31
            # online http://shell-storm.org/online/Online-Assembler-and-Disassembler/?opcodes=884b&arch=arm-t&endianness=big&dis_with_addr=True&dis_with_raw=True&dis_with_ins=True#disassembly
            # 88 4B    ldrh r3, [r1, #2]
            imm5 = get_imm5(halfword) << 1
            return "lsrh r{0}, [r{1}, #{2}] ; 0x{2:x}".format(*get_two_registers(halfword), imm5)
        elif ops == (0b1001, 0b000):
            # bb4:	0552      	lsls	r2, r2, #21
            # 1001000100000000 100100 A5-82 1001 000
            imm5 = get_imm5(halfword) << 1
            return "lsls r{0}, [r{1}, #{2}] ; 0x{2:x}".format(*get_two_registers(halfword), imm5)
        # 126e:	9a02      	ldr	r2, [sp, #8] ; 1001101000000010 1001 101
        elif ops == (0b1001, 0b101):
            rn = "sp" if rn == 0 else "r{}".format(rt)
            return "ldr r{}, [{}, #{}]".format(rt, rn, get_imm5(halfword))
        # 34a:	9702      	str	r7, [sp, #8] ; 1001011100000010 1001 011

        return "A5-82 {0:04b} {1:03b}".format(*ops)
# c bit 5  = halfword bit 15 c is bit 15-10
    elif bits(5, 1, opc) == 0b10100:
        return "A6-106"
    elif bits(5, 1, opc) == 0b10101:
        return "A6-104"
    elif bits(5, 2, opc) == 0b1011:
        opc = bits(11, 5, opcode)
        register_list = ", ".join(regs[r] for r in get_register_list(opcode))
# print("opc {0:07b}".format(opc))
        if opc == 0b0110011:
            # b672      	cpsid	i
            return "cps" + ("id" if bits(4, 4, halfword) else "ie") + "  i"
        elif bits(11, 9, halfword) == 0b010:
            return "push {%s}" % register_list
        elif bits(11, 9, halfword) == 0b110:
            return "pop {%s}" % register_list
        else:
            opc >>= 1  # do not care anymore about the last bit
            # partial return, continue HERE,
            codes = {0b001000: "sxth ; a6-169", 0b001001: "sxtb ; a6-168",
                     0b001010: "uxth r{}, r{}".format(*get_two_registers(halfword)), 0b001011: "uxtb r{}, r{}".format(*get_two_registers(halfword)),
                     0b101000: "rev r{}, r{}".format(*get_two_registers(halfword)),
                     0b101001: "revsh r{}, r{}".format(*get_two_registers(halfword)),
                     0b111101: "sev ; a6-156", 0b111100: "wfe ; Wait For Event",
                     0b111000: "bkpt 0x{:04x}".format(get_imm8(halfword) << 2)}
            try:
                return codes[opc]
            except KeyError:
                return "Hint instruction code {0:06b}".format(opc)
        return "A5-83"
    elif bits(5, 1, opc) == 0b11000:
        # c078      	stmia	r0!, {r3, r4, r5, r6}
        register_list = get_register_list(halfword)
        if not register_list:
            return "INVALID"
        if register_list[-1]==14:
            excl = "!"
            register_list = register_list[:-1]
        else:
            excl = ""
        return "stmia r%i%s, {%s}" % (get_one_register(halfword), excl,  ', '.join('r%i' % n for n in register_list))
       # return "A6-157"
    elif bits(5, 1, opc) == 0b11001:
        #  1662:	cc0a      	ldmia	r4!, {r1, r3}
        register_list = get_register_list(halfword)
        excl = "!" if register_list[-1]==14 else ""
        register_list = register_list[:-1]
        return "ldmia r%i%s, {%s}" % (get_one_register(halfword), excl,  ', '.join('r%i' % n for n in register_list))
    elif bits(5, 2, opc) == 0b1111:
        # A5-84 hints
        halfword &= 0xf
        if halfword != 0:
            return "UNDEFINED"
        else:
            return "nop yield wfe wfi sev".split()[bits(7, 5, halfword)]+" ; HINT"
    elif bits(5, 2, opc) == 0b1101:
        # B on page A6-110 case one
        imm8 = (bits(10, 0, opcode) & 0xff) << 1
        # signed two's complement
        imm8 = sign_extend(imm8, 8)
        pc += imm8 + 4
        return "b{0}.n {1:8x} ; PC + {2}".format(cond[bits(11, 8, halfword)], pc, imm8 + 4)

    elif (opc >> 1) == 0b11100:
        imm11 = bits(10, 0, opcode) << 1
        if imm11 & (1 << 11):
            imm11 = (imm11 & 0x7ff) - 0x800  # signed two's complement

        pc += imm11 + 4
        return "b.n  {0:8x}".format(pc)
    else:
        return "Not recognized"


def get_bl(pc, ins1, ins2):
    op1, op2 = bits(10, 4, ins1), bits(14, 12, ins2)
    # A5-85
    if op2 & 0b101 == 0b101:
        # bl A6-113
        s = bits(10, 10, ins1)
        imm10 = bits(9, 0, ins1)
        imm12 = bits(10, 0, ins2) << 1
        addr = (s << 22) + (imm10 << 12) + imm12
        if s:
            addr = sign_extend(addr, 23)  # signed two's complement
        return "bl   {:x}".format(pc+addr)
    elif ins1 >> 4 == 0xf38:
        # Move to Special Register from ARM Register
        #
        # 11c:	1111001110000010  1000100000001000 f382 8808 	msr	MSP, r2
        # Binary value shown split into the fields used
        # in the instruction operation pseudocode,
        # SYSm<7:3>:SYSm<2:0>.
        # PRIMASK   Register to mask out configurable exceptions
        # .cc.      Raises the current priority to 0 when set to 1. This is a 1-bit register.16 = 0b00010:000
        # CONTROL   is a 1-bit register.16 = 0b00010:000
        # CONTROL   The CONTROL register, see The special-purpose CONTROL register on page B1-189.20 = 0b00010:100
        # -Reserved.Other values
        #
        # mistake to fix
        # 00000bfa 8810 1000100000010000 111100 msr ASPR, r5
        # should be      msr	PRIMA38SK, r5
        #
        ins2 &= 0xff
        if ins2 < 0x10:
            reg = sysR[ins2]
        elif ins2 == 16:
            reg = "PRIMASK"
        elif ins2 == 20:
            reg = "CONTROL"
        return "msr {}, r{}".format(reg, ins1 & 0b111)
    # 1664:	f3ef 8410 	mrs	r4, PRIMASK
    elif ins1 == 0xf3ef:
        r = bits(11, 8, ins2)
        ins2 &= 0xff
        if ins2 < 0x10:
            reg = sysR[ins2]
        elif ins2 == 16:
            reg = "PRIMASK"
        elif ins2 == 20:
            reg = "CONTROL"
        return "mrs r{}, {}".format(r, reg)
    # 1664:	f3ef 8410 	mrs	r4, PRIMASK
   # 2112:	f3bf 8f5f 	dmb	sy
    elif ins1 == 0xf3bf and ins2 >> 4 == 0x8f5f >> 4:
        return "dmb sy"
    return "To be implemented"


assert get_opcode(0xff00) == 0b111111
assert bits(15, 10, 0xff00) == 0b111111
assert get_imm5(0x04ad) == 0b10010
assert get_imm5_ext(0x04ad, 0b10) == 0b1010010
assert get_imm5(0x6265) << 2 == 36


prev = ""
f = open("my_dissassembly_start.s", "w+")
with f as out_file:
    for pc in range(start, start + num_instructions, 2):  # code.maxaddr()
        if prev == "(32-bit)":
            bl = get_bl(pc+2, opcode, bytes_to_halfword(code, pc))+"\n"
            print("{0:08x} {1:04x} {1:016b} {2:06b} {3}".format(pc,
                                                                bytes_to_halfword(
                                                                    code, pc),
                                                                get_opcode(
                                                                    opcode),
                                                                bl),
                  file=out_file)

            prev = ""
        else:
            opcode = bytes_to_halfword(code, pc)
            prev = disassemble(pc, opcode)
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
