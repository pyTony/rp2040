import pytest # have to learn how to use pytest
import re

import rp2040

def re_to_match1(instr, op1):
    return "{} *{} *".format(instr, op1)

def re_to_match2_ind(instr, op1, op2, ind):
    return "{} *{}, *\[{}, \#{}\].*".format(instr, op1, op2, ind)

def test_ldr1():    
    # fe:	680a  0110100000001010 011010 	ldr	r2, [r1, #0]
    result = rp2040.disassemble(0xfe, 0x680a)
    assert re.match(re_to_match2_ind("ldr", "r2", "r1", "0"), result)
    
def test_bn():       
    # 00000106 e793 1110011110010011 111001 e793 b.n	30 <_dead>
    result = rp2040.disassemble(0x106, 0xe793)
    assert re.match(re_to_match1("b.n", "30"), result)

def test_regs():    
    assert rp2040.regs[13:] == ['sp','lr', 'pc']

def test_ldr_sp_imm1():
    #1c36:	9d01      	ldr	r5, [sp, #4]
    #       1001110100000001 A5-82 1001 110
    result =  rp2040.disassemble(0x1c36, 0x9d01)
    assert re.match(re_to_match2_ind("ldr", "r5", "sp", "4"), result)
     
def test_ldr_sp_ldr2():       
    #ldr sp imm8
    #0000245e 9901 1001100100000001 100110 ldr	r1, [sp, #4] ; 1001 100
    result =  rp2040.disassemble(0x245e, 0x9901)
    assert re.match(re_to_match2_ind("ldr", "r1", "sp", "4"), result)

def test_strh_imm1():    
    # 23fe:	803b    1000000000111011   strh	r3, [r7, #0]
    result =  rp2040.disassemble(0x23fe, 0x803b)
    assert re.match(re_to_match2_ind("strh", "r3", "r7", "0"), result)
   
def test_strh_imm2():
    #4bc:	8282    1000001010000010   strh	r2, [r0, #20]
    #A5-82 1000 001
    result =  rp2040.disassemble(0x4bc, 0x8282)
    assert re.match(re_to_match2_ind("strh", "r2", "r0", "20"), result)
    
def test_strh_imm3():
    #960:   84a2    1000010010100010    strh	r2, [r4, #36]	; 0x24
    #A5-82 1000 010 -> unify with above case
    result =  rp2040.disassemble(0x960, 0x84a2)
    assert re.match(re_to_match2_ind("strh", "r2", "r4", "36"), result)

def test_strh_imm4():
    #1100:  85e6   1000011000100101   	strh	r6, [r4, #46]	; 0x2e ops 1000 011
    # first try to unite with the case of line 960 above, success!
    result =  rp2040.disassemble(0x1100, 0x85e6)
    assert re.match(re_to_match2_ind("strh", "r6", "r4", "46"), result)

def test_strh_imm5():    
    # 23fe:	803b 1000000000111011   strh	r3, [r7, #0]
    result =  rp2040.disassemble(0x23fe, 0x803b)
    assert re.match(re_to_match2_ind("strh", "r3", "r7", "0"), result)

def test_str_imm1():
    # 11a:	6038  0110000000111000 011000   str	r0, [r7, #0]
    result =  rp2040.disassemble(0x11a, 0x6038)
    assert re.match(re_to_match2_ind("str", "r0", "r7", "0"), result)

def test_str_sp_imm2():
    #d68: 9501   1001010100000001  str	r5, [sp, #4]
    #A5-82 1001 010
    result =  rp2040.disassemble(0xd68, 0x9501)
    assert re.match(re_to_match2_ind("str", "r5", "sp", "4"), result)

def test_str_sp_imm2():
    #552: 9100 1001000100000000	str	r1, [sp, #0]; ops 1001 000
    result =  rp2040.disassemble(0x552, 0x9100)
    assert re.match(re_to_match2_ind("str", "r1", "sp", "0"), result)
    
def test_str_sp_imm3():
    #0000134a 9702 1001011100000010 str	r7, [sp, #8] ; 1001 011
    # added the 011 to above d68: branch
    result =  rp2040.disassemble(0x134a, 0x9702)
    assert re.match(re_to_match2_ind("str", "r7", "sp", "8"), result)
