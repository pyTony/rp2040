from intelhex import IntelHex


cond = "eq ne cs cc mi pl vs vc hi ls ge lt gt le".split() + [""]
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

def bytes_to_word(mem, addr, bigendian=True):
    """ joins four bytes to halfword, default bigendian """
    return (mem[addr]+mem[addr+1]*0x100+mem[addr+2]*0x10000+mem[addr+3]*0x1000000 if bigendian
            else 0x1000000*mem[addr] + 0x10000 *mem[addr+1] + 0x100 * mem[addr+2] + mem[addr+3])

def get_register_list(halfword, reg):
    """ interpret the low byte as list of registers """
    registers, register_list = halfword & 0xff, []
    for r in range(8):
        if registers & 1:
            register_list.append("r{}".format(r))
        registers >>= 1
        if registers == 0:
            break
    if halfword & (1 << 8):
        register_list.append(reg)
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
    """ b8..b6
    """
    return bits(8, 6, halfword)


def get_imm5(halfword):
    """ b10..b6
    """
    return bits(10, 6, halfword)


def get_imm5_ext(halfword, ext):
    """ ext b10..b6
    """
    return (ext << 5) + bits(10, 6, halfword)


def get_imm8(para):
    """ lowest byte of parameter """
    return para & 0xff


def get_opA_opB(halfword):
    """ return 7 highest bits of halfword as ops """
    return bits(15, 12, halfword), bits(11, 9, halfword)


def disassemble(processor, halfword):
    opc = get_opcode(halfword)
    if opc & 0b111000 == 0b111000:
        # 0x00 temporary, to catch e793, check later
        if opc >> 1 == 0b011100:
            imm11 = sign_extend(bits(10, 0, halfword) << 1, 12)
            return "b.n  {0:x}".format(processor.PC + imm11 + 4)
        elif bits(12, 11, halfword) != 0:
            return "(32-bit)"
        else:
            return "other {0:06b}".format(opc)
    elif halfword == 0xbf20:
        return "wfe"
    elif halfword == 0xbf30:
        return "wfi"
    elif (opc >> 1) == 0b11100:
        imm11=bits(10, 0, opc) << 1
        if imm11 & (1 << 11):
            imm11=(imm11 & 0x7ff) - 0x800  # signed two's complement
        pc = processor.PC + imm11 + 4
        processor.PC = pc
        return "b.n  {0:x}".format(pc + imm11 + 4)

    elif opc < 0b10000:
        opc=bits(13, 9, halfword)  # also bit 9

        if opc == 0b1100:
            # 114:	1840 0001100001000000     	adds	r0, r0, r1
            return "adds "+', '.join("r{}".format(s) for s in get_three_registers(halfword))
        elif opc == 0b1101:
            return "sub "+', '.join("r{}".format(s) for s in get_three_registers(halfword))
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
        elif opc == 0b001 :
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
            'ands eors lsl lsr ars adc sbc ror tst rsb cmp cmn orrs muls bics mvns'.split())
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
        if halfword >> 8 == 0b1000110:
            m=regs[(bits(7, 7, halfword) << 3) + bits(2, 0, halfword)]
            n=regs[bits(6, 3, halfword)]
            instr = "mov  {}, {}".format(m, n)
            instr = ("nop  ; (" + instr +")") if m == n else instr
            return instr
        elif opc >> 1 == 0:
            # 00xx    Add Registers          ADD (register) on page A6-102
            rdn, rm=get_two_registers(halfword)
            rdn += bits(7, 7, halfword) << 3
            if rdn == rm == 15:
                return "UNPREDICTABLE"
            else:
                return "adds r{}, r{}".format(rdn, rm)
        elif opc == 0b111:
            # 110x    Branch and Exchange    blx on page A6-114
            return "blx  r{}".format(bits(6, 3, halfword))
        elif bits(15, 7, halfword) == 0b010001110:
            # 00000134 4730 0100011100110000 010001 bx	r6 ; A6-115
            r = bits(6, 3, halfword)
            return "bx {}".format(regs[r])

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
            #568:	50bb      	str	r3, [r7, r2]
            #0101000010111011 010100
            return "str r{}, [r{}, r{}]".format(rt, rn, rm)
        elif ops == (0b0110, 0b001):
            imm=get_imm5(halfword) << 2
            return "str  {0} ; 0x{1:x} imm5".format('r%i, [r%i, #%i]' % (*get_two_registers(halfword), imm), imm)
        elif opA == 0b0110:
            imm=get_imm5(halfword) << 2
            # one in highest bit of ops2 means str
            instruction="ldr" if opB & 0b100 else "str"
            return instruction + "  {0} ; 0x{1:x}".format('r%i, [r%i, #%i]' % (*get_two_registers(halfword), imm), imm)
        instruction = ""
        if ops == (0b0101, 0b000):
            instruction = "str"
        elif ops == (0b0101, 0b001):
            instruction = "strh"
        elif ops == (0b0101, 0b010):
            instruction = "strb"
        elif ops == (0b0101, 0b011):
            instruction = "ldrsb"
        elif ops == (0b0101, 0b100):
            instruction = "ldr"
        elif ops == (0b0101, 0b101):
            instruction = "ldrh"
        elif ops == (0b0101, 0b110):
            instruction = "ldrb"
        elif ops == (0b0101, 0b111):
            instruction = "ldrsh"
        if instruction:
            return "{} r{}, [r{}, r{}]".format(instruction, rt, rn, rm)
        if opA == 0b0111:
            instr="strb" if opB & 1 else "ldrb"
            two_reg=get_two_registers(halfword)
            return (instr+" r{0}, [r{1}, #{2}]").format(*two_reg, get_imm5(halfword))
        elif opA == 0b1001 and opB in (0b000, 0b011):
            return "str r{}, [sp, #{}]".format(bits(10,8,halfword),get_imm8(halfword)<<2)
        elif (opA == 0b1000) and opB < 0b100: # in (0b000, 0b001, 0b010):
            return "strh r{}, [r{}, #{}]".format(rt, rn, get_imm5(halfword) << 1)
        elif ops == (0b1000, 0b101):
            return "ldrh r{}, [r{}, #{}]".format(rt, rn, get_imm5(halfword) << 1)
        elif ops == (0b1001, 0b001):
            rn = "sp" if rn == 0 else "r{}".format(rt)
            return "str r{}, [{}, #{}]".format(rt, rn, get_imm5(halfword))
        elif ops == (0b1000, 0b100):
            #This may be bug in disassembler of Pico cross compiler
            # 00000fce 884b 1000100001001011 100010 lsrs	r6, r1, #31
            # online http://shell-storm.org/online/Online-Assembler-and-Disassembler/?opcodes=884b&arch=arm-t&endianness=big&dis_with_addr=True&dis_with_raw=True&dis_with_ins=True#disassembly
            # 88 4B    ldrh r3, [r1, #2]
            imm5 = get_imm5(halfword)<<1
            return "ldrh r{0}, [r{1}, #{2}] ; 0x{2:x}".format(*get_two_registers(halfword), imm5)
        elif opA == 0b1001 and opB in (0b100, 0b101, 0b110):
            return "ldr r{}, [sp, #{}]".format(bits(10,8,halfword), get_imm8(halfword)<<2)
        elif ops == (0b1001, 0b010):
            return "str r{}, [sp, #{}]".format(bits(10,8,halfword), get_imm8(halfword)<<2)

        return "A5-82 {0:04b} {1:03b}".format(*ops)
    elif bits(5, 1, opc) == 0b10101:
        #page A6-102
        return "add r{0}, sp, #{1} ; #{1:0x}".format(get_one_register(halfword), get_imm8(halfword) << 2 )
    elif bits(5, 2, opc) == 0b1011:
        opc=bits(11, 5, halfword)
        if opc < 0b100:
            return "add r{0}, sp, #{1}".format(bits(10,8,halfword), get_imm8(halfword)<<2)
        elif opc < 0b1000:
            return "sub r{0}, sp, #{1}".format(bits(10,8,halfword), get_imm8(halfword)<<2)
        elif opc == 0b0110011:
            # b672      	cpsid	i
            return "cps" + ("id" if bits(4, 4, halfword) else "ie") + "  i"
        elif bits(11, 9, halfword) == 0b010:
            return "push {%s}" % ', '.join(get_register_list(halfword, 'lr'))
        elif bits(11, 9, halfword) == 0b110:
            return "pop {%s}" % ', '.join(get_register_list(halfword, 'pc'))
        else:
            opc >>= 1  # do not care anymore about the last bit
            # partial return, continue HERE
            codes={0b001000: "sxth", 0b001001: "sxtb",
                     0b001010: "uxth", 0b001011: "uxtb",
                     0b101000: "rev r{}, r{}".format(*get_two_registers(halfword)),
                     0b101001: "revsh r{}, r{}".format(*get_two_registers(halfword)),
                     0b111101: "sev",
                     0b111000: "bkpt 0x{:04x}".format(get_imm8(halfword)<<2)}
            try:
                return codes[opc]
            except KeyError:
                return "Hint instruction code {0:06b}".format(opc)
        return "A5-83"
    elif bits(5, 1, opc) == 0b11000:
        register_list = get_register_list(halfword, 'lr')
        return "stmia r%i!, {%s}" % (get_one_register(halfword), ', '.join(register_list))
    elif bits(5, 1, opc) == 0b11001:
        register_list = get_register_list(halfword, 'lr')
        excl = "!" if register_list[-1]=='lr' else ""
        return "ldmia r%i%s, {%s}" % (get_one_register(halfword), excl,  ', '.join(register_list))
    elif bits(5, 2, opc) == 0b1101:
        # B on page A6-110 case one
        imm8=(bits(10, 0, halfword) & 0xff) << 1
        # signed two's complement
        imm8=sign_extend(imm8, 8)
        addr = processor.PC + imm8 + 4
        return "b{0}.n {1:x} ; PC + {2}".format(cond[bits(11, 8, halfword)], addr, imm8 + 4)
    elif opc >> 1 == 0b10100:
        return "add {}, pc, #{}".format(regs[get_one_register(halfword)], get_imm8(halfword)<<2)
    else:
        return "Not recognized"


def get_32bit(self, ins1, ins2):
    pc = self.PC
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

def get_bootrom():
    HEXFILE = "./bootrom.hex"

    # specifying the regions of data, not instructions, partial list here use find with .word to extract from
    # disassebled file, this misses the text and halfword data for simplicity
    # (0x,0x),
    data = [(0,0x18), (0x50, 0xed), (0x190, 0x2a4), (0x2b2, 0x2d4), (0x3a6,0x448),
            (0x458,0x45b), (0x468, 0x46f), (0x492,0x497), (0x4f4, 0x4ff),
            (0x578, 0x57b), (0x594, 0x59b), (0x5f0, 0x5f3), (0x6e4, 0x6ef), 
            (0x740, 0x743), (0xa78, 0xaa7), (0xdcc, 0xdeb), (0xe50, 0xe57), (0xe8c, 0xe93),
            (0xec4, 0xecb), (0xeec, 0xef7), (0xf34, 0xf43), (0xf98, 0xfb3), (0x1028, 0x102f),
            (0x1188,0x11b7), (0x13d0, 0x1403), (0x146c,0x1473), (0x14a8,0x14af), (0x14fc, 0x14ff),
            (0x15fa4, 0x15c3), (0x15fc, 0x1607),(0x162c, 0x162f), (0x169c, 0x16af), (0x16f4, 0x170b),
            (0x1724, 0x1727), (0x1770, 0x1777),(0x17dc, 0x17df),
            (0x1864,0x1867), (0x1ae0,0x1b97), (0x1ba4,0x1ba7), (0x1c3c,0x1c47), (0x1db0,0x1dcc),
            (0x1df4,0x1e07), (0x20b4,0x20df),(0x2154,0x2167),(0x22c8,0x22fb),(0x2324,0x232f),(0x2378,0x237b),
            (0x23c0,0x23c3), (0x23f0,0x23f3), (0x2498,0x249f), (0x24c0,0x24c7), (0x24e4,0x24e7), (0x2598,0x25b3),
            (0x25cc,0x25d7), (0x2754,0x2757), (0x2adc,0x2b63), (0x2e40,0x2e53), (0x2fb8,0x2fbb), (0x3112,0x3117),
            (0x3402,0x3427), (0x3a38, 0x3b43), (0x3bd6, 0x3bdf), (0x3c94,0x3fff)]

    code = IntelHex(HEXFILE)
    return code, data

def disassemble_code(code, data,  output="disassembly.s"):
    class Processor():
        pass  # dummy before implementing processor

    processor = Processor()
    # for blink.hex + 0x000000ee # looked from bootrom.dis
    start = code.minaddr()
    # let's now do it all
    num_instructions = code.maxaddr() - code.minaddr() + 1

    #+ 0x1c  # offset to start in bootrom
    # for small programs + 0x370


    prev=""
    f=open(output, "w+")
    data_gen = iter(data)
    start_data, end_data = next(data_gen)
    has_data = True
    word = opcode = 0
    with f as out_file:
        for processor.PC in range(start, start + num_instructions, 2):  # code.maxaddr()
            try:
                if has_data:
                    if start_data <= processor.PC <= end_data:
                        if processor.PC % 4 == 0:
                            #loading the word at 4 byte boundary
                            word = bytes_to_word(code,processor.PC)
                        else:
                            print("{0:08x} .word {1:08x}".format(processor.PC >> 2 << 2, word), file=out_file)
                        continue
                    elif processor.PC > end_data:
                        start_data, end_data = next(data_gen)
                        print(file=out_file)
            except StopIteration:
                print("No more data areas from 0x{0:x}".format(processor.PC))
                has_data = False
                pass
            if prev == "(32-bit)":
                processor.PC+=2
                res=get_32bit(processor, opcode, bytes_to_halfword(code, processor.PC-2))+"\n"
                processor.PC-=2
                print("{0:08x} {1:04x} {1:016b} {2}".format(processor.PC,
                                                            bytes_to_halfword(code, processor.PC),
                                                            res),
                        file=out_file)

                prev=""
            else:
                opcode=bytes_to_halfword(code, processor.PC)
                prev=disassemble(processor, opcode)
                # mnemonic starts with b for branch or an nop (probable high byte of data)
                # add newline to clarify blocks
                if prev[0] == 'b' or prev.startswith('nop'):
                    prev += "\n"
                print("{0:08x} {1:04x} {1:016b} {2}".format(processor.PC,
                                                            opcode,
                                                            prev),
                    file= out_file)
    return code, start

if __name__ == "__main__":
    disassemble_code(*get_bootrom(), "my_bootrom.s")
