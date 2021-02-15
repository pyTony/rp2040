#import pytest # have to learn how to use pytest
import re

import rp2040

def re_to_match1(instr, op1):
    return r"{} *{} *".format(instr, op1)

def re_to_match2_ind(instr, op1, op2, ind):
    return r"{} *{}, *\[{}, \#{}\].*".format(instr, op1, op2, ind)

def re_to_match2_reglist(instr, op1, reglist):
    return r"{0} *{1}, *".format(instr, op1) + "\{" + reglist + "\} *"


def re_to_match3(instr, op1, op2, op3):
    return r"{} *{}, *{}, *{}.*".format(instr, op1, op2, op3)

class test():
    def disassemble(self, pc, opc, opc2=None):
        self.PC = pc
        return rp2040.get_32bit(self, opc, opc2) if opc2 else rp2040.disassemble(self, opc)
  
    def test_bn(self):       
        # 00000106 e793 1110011110010011 b.n	30
        result = self.disassemble(0x106, 0xe793)
        assert re.match(re_to_match1("b.n", "30"), result)

    def test_add_pc(self):       
        #326:	a325      	add	r3, pc, #148	; (adr r3, 3bc <clz6_table>)
        #1010001100100101 101000
        result = self.disassemble(0x326, 0xa325)
        assert re.match(re_to_match3("add", "r3", "pc", "#148"), result)
        
        
    def test_ldr1(self):    
        # fe:	680a  0110100000001010 011010 	ldr	r2, [r1, #0]
        result = self.disassemble(0xfe, 0x680a)
        assert re.match(re_to_match2_ind("ldr", "r2", "r1", "0"), result)
        
    def test_regs(self):    
        assert rp2040.regs[13:] == ['sp','lr', 'pc']

    def test_ldr_sp_imm1(self):
        #1c36:	9d01 1001110100000001      ldr	r5, [sp, #4] ; ops 1001 110
        result =  self.disassemble(0x1c36, 0x9d01)
        assert re.match(re_to_match2_ind("ldr", "r5", "sp", "4"), result)
        
    def test_ldr_sp_ldr2(self):       
        #ldr sp imm8
        #0000245e 9901 1001100100000001    ldr	r1, [sp, #4] ; ops 1001 100
        result =  self.disassemble(0x245e, 0x9901)
        assert re.match(re_to_match2_ind("ldr", "r1", "sp", "4"), result)

    def test_strh_imm1(self):    
        # 23fe:	803b    1000000000111011   strh	r3, [r7, #0]
        result =  self.disassemble(0x23fe, 0x803b)
        assert re.match(re_to_match2_ind("strh", "r3", "r7", "0"), result)
    
    def test_strh_imm2(self):
        #4bc:	8282    1000001010000010   strh	r2, [r0, #20] ; ops 1000 001
        result =  self.disassemble(0x4bc, 0x8282)
        assert re.match(re_to_match2_ind("strh", "r2", "r0", "20"), result)
        
    def test_strh_imm3(self):
        #960:   84a2    1000010010100010    strh	r2, [r4, #36]	; 0x24
        #A5-82 1000 010 -> unify with above case
        result =  self.disassemble(0x960, 0x84a2)
        assert re.match(re_to_match2_ind("strh", "r2", "r4", "36"), result)

    def test_strh_imm4(self):
        #1100:  85e6   1000011000100101   	strh	r6, [r4, #46]	; 0x2e ops 1000 011
        #first trying to unite with the case of line 960 above, success!
        result =  self.disassemble(0x1100, 0x85e6)
        assert re.match(re_to_match2_ind("strh", "r6", "r4", "46"), result)

    def test_strh_imm5(self):    
        # 23fe:	803b 1000000000111011   strh	r3, [r7, #0]
        result =  self.disassemble(0x23fe, 0x803b)
        assert re.match(re_to_match2_ind("strh", "r3", "r7", "0"), result)

    def test_str_imm1(self):
        #11a:	6038  0110000000111000 011000   str	r0, [r7, #0]
        result =  self.disassemble(0x11a, 0x6038)
        assert re.match(re_to_match2_ind("str", "r0", "r7", "0"), result)

    def test_str_sp_imm2(self):
        #d68: 9501   1001010100000001  str	r5, [sp, #4] ; ops 1001 010
        result =  self.disassemble(0xd68, 0x9501)
        assert re.match(re_to_match2_ind("str", "r5", "sp", "4"), result)

    def test_str_sp_imm2(self):
        #552: 9100 1001000100000000	str	r1, [sp, #0]; ops 1001 000
        result =  self.disassemble(0x552, 0x9100)
        assert re.match(re_to_match2_ind("str", "r1", "sp", "0"), result)
        
    def test_str_sp_imm3(self):
        #134a: 9702 1001011100000010 str	r7, [sp, #8] ; ops 1001 011
        # added the 011 to above d68: branch
        result =  self.disassemble(0x134a, 0x9702)
        assert re.match(re_to_match2_ind("str", "r7", "sp", "8"), result)
    
    def test_ldmia(self):
        #1662:	cc0a 1100110000001010 ldmia r4, {r1, r3}
        result = self.disassemble(0x1662, 0xcc0a)
        assert re.match(re_to_match2_reglist("ldmia", "r4", "r1, r3"), result)
        
    def test_mrs(self):
        #1664:	1111001111101111 1000010000010000 f3ef 8410 	mrs	r4, PRIMASK
        result = self.disassemble(0x1664, 0xf3ef)
        assert result=="(32-bit)"
        result = self.disassemble(0x1666, 0xf3ef, 0x8410)
        print(result)
            
    def run(self):
        for fn in dir(self):
            if fn.startswith('test_'):
                try:
                    eval("self.{}()".format(fn))
                    print("{:>20} passed".format(fn))
                except AssertionError as e:
                    print("\n----- {:>20} FAILED ----".format(fn))
                    print(e)

test().run()