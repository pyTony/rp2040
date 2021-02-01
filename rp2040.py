from intelhex import IntelHex


def get_opcode(instruction):
    return instruction >> 10

def bits(start, end, opcode):
    numbits = (start-end+1)
    opcode = opcode >> end
    return opcode & (2**(numbits)-1)

def sign_extend(opcode, bits):
    sign_bit = 1 << (bits - 1)
    return (opcode & (sign_bit - 1)) - (opcode & sign_bit)

def bytes_to_halfword(mem, addr, big_endian=True):
    #addr+=addr # 16 bit instruction address from byte address
    return  mem[addr]+mem[addr+1]*0x100 if big_endian else 0x100*mem[addr] + mem[addr+1]

def get_register_list(opc):
    registers, register_list = opcode & 0xff, []
    for reg in range(8):
        if registers &1:
    ##        print(reg)
            register_list.append(reg)
        registers >>= 1
        if  registers == 0:
            break                
    if opcode & 1<<8:
        register_list.append(14)
    return register_list

def get_registers(opc):
    opc &=0b111111
    return opc & 0b111, (opc >> 3) & 0b111

def get_one_register(opc):
    return opc >>8 & 0b111

def get_imm3(opc):
    return opc & 0b111 # not checked

def get_imm5(opc):
    return bits(10, 6, opc)

def get_imm8(opc):
    return opc & 0xff

def get_opA_opB(opc):
    opc >>= 9
    return opc>>3, opc & 0xf

def disassemble(pc, value):
    c = get_opcode(value)
    if c in (0b11101, 0b111100, 0b111111):
        return "(32-bit)"
    elif c < 0b10000:
        c = bits(13,9,value) # also bit 9
        
        if c == 0b1100:
            return "add reg A6-102"
        elif c == 0b1101:
            return "sub reg A6-165"
        elif c==0b01110:
            return "add imm3 A6-101"
        elif c==0b01111:
            return "sub imm3 A6-164"
        c >>= 2 # last bits do not matter for others
##        print("c>>2 = {0:08b}".format(c))
        if c==0:
            if bits(10,6,value) == 0:
                return "movs {}                 ;A6-140".format(', '.join('r%i' % n for n in get_registers(value)))
            else:
                return "lsls {0}, #{1}           ;A6-135".format(', '.join('r%i' % n for n in get_registers(value)), get_imm5(value))
        elif c==0b001:
            return "lsr  imm A6.137"
        elif c == 0b010:
            return "asr  imm A6-108"
        elif c==0b100:
            return "movs r{0}, #{1}               ;0x{1:02x} A6-139".format(get_one_register(value),get_imm8(value))
        elif c==0b101:
            return "cmp imm A6-117"
        elif c==0b110:
            return "add imm A6-101"
        elif c==0b111:
            return "sub imm A6-164"
        return "A5-79"
    elif c == 0b010000:
        return "A5-80"
    elif c ==0b010001:
        return "A5-81"
    elif bits(5,1,c) == 0b01001:
        return "A6-127"
    elif bits(5,3,c) in (0b011, 0b100) or bits(5,2,c)==0b0101:
        ops = get_opA_opB(value)
        if ops == (0b0101, 0b000):
            return "str unimplemented form"
##        elif ops == (0b0110, 0b001):
##            imm = get_imm5(value)<<2
##            return "str  {0} ; 0x{1:x} A6-158".format('r%i, [r%i, #%i]' % (*get_registers(value), imm), imm)
        elif ops[0] == 0b0110:
            imm = get_imm5(value)<<2
            return "str  {0} ; 0x{1:x} A6-158".format('r%i, [r%i, #%i]' % (*get_registers(value), imm), imm)
##        something wrong in imm8 form, check later, above seems to also apply when ops2==0 (61a5)
##        elif ops == (0b0110, 0b000):
##        elif ops[0] == 0b0110:
##            return "str  r{0}, #{1} ; 0x{1:x} A6-158".format(bits(10,8,value), get_imm8(value)<<2)
            
        return "A5-82 {0:04b} {1:03b}".format(*ops)
    elif bits(5,1,c) == 0b10100:
        return "A6-106"
    elif bits(5,1,c) == 0b10101:
        return "A6-104"
    elif bits(5,2,c) == 0b1011:
        opc=bits(11,5,opcode)
##        print("opc {0:07b}".format(opc))
        if opc < 0b100:
            return "add SP plus immediate"
        elif opc < 0b1000:
            return "sub SP plus immediate"
        elif opc == 0b0110011:
            return "cps"
        elif bits(11,9,opcode) == 0b010:
            register_list=get_register_list(opcode)
            return "push {%s}" % ', '.join(["r%i" % rn for rn in register_list])
        opc >>= 1 ## do not care anymore about the last bit
        ## partial return, continue HERE
        try:
            return {0b001000:"SXTH  A6-169", 0b001001:"SXTB  A6-168", 0b001010:"UXTH A6-173", 0b001011:"UXTB A6-172h",
                    0b101000:"REV A6-150", 0b101001:"REVSH  A6-152"}[opc]
        except:
            return "A5-83"
    elif bits(5,1,c) == 0b11000:
        return "A6-157"
    elif bits(5,1,c) == 0b11001:
        return "A6-125"
    elif bits(5,2,c) == 0b1101:
        return "A5-84"
    elif bits(5,2,c) == 0b1110:
        imm11 = bits(10,0, opcode) << 1
        if imm11 & (1 << 11):
            imm11 = (imm11 & 0x7ff) - 0x800 # signed two's complement
            
        pc += imm11 + 4
        return "b.n  {0:08x}".format(pc)
    else:
        return "Not recognized"

def get_bl(pc, ins1, ins2):
    op1, op2 = bits(10,4, ins1), bits(14,12, ins2)
    # A5-85
    if op2 & 0b101 == 0b101:
        # bl A6-113
        s = bits(10,10,ins1)
       
        j1, j2 = bits(13,13,ins2), bits(11,11,ins2)
        i1, i2 = j1, j2 #(j1^s)>0, (j2^s)>0
        imm10 = bits(9,0,ins1)
        imm11 = bits(10,0,ins2)
        addr = (imm10 <<12) + imm11 << 1
##        assert "{:010b}{:011b}0".format(imm10,imm11,addr) == "{:022b}".format(addr)
##        addr += (i1<<22)+(i2<21)
        if s:
            addr = -addr      
        return "bl   {:08x}".format(pc+addr)
    return "To be implemented"
        
assert get_opcode(0xff00) == 0b111111
assert bits(15, 10, 0xff00) == 0b111111
assert get_imm5(0x04ad) == 18
assert get_imm5(0x6265)<<2 == 36

code = IntelHex("/home/tony/p/rp2040js/src/blink.hex")

MEMSTART = code.start_addr['EIP']
prev = ""
for pc in range(code.minaddr(), code.maxaddr(), 2):
    if prev =="(32-bit)":
        bl = get_bl(pc+2, opcode, bytes_to_halfword(code, pc))
        print("{0:08x} {1:04x} {1:016b} {2:06b} {3}".format(pc,bytes_to_halfword(code, pc),get_opcode(opcode), bl))
        prev = ""
    else:
        opcode = bytes_to_halfword(code, pc)
        prev = disassemble(pc, opcode)
        print("{0:08x} {1:04x} {1:016b} {2:06b} {3}".format(pc, opcode, get_opcode(opcode), prev))
    
