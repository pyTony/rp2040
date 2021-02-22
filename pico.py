import rp2040

from enum import Enum, auto
trace = True

class arm_m0():
    regs = ["r{}".format(r) for r in range(12)] + 'ip lr sp pc'.split()
    register_names = {n:name for (n, name) in enumerate(regs)}
    flag = {v:rn for rn,v in enumerate("NZCV")}
    def hook(self, address):
        raise ValueError("Out of memory range.")

    def __init__(self, ram_size, ram_start, rom, rom_start=0):
        self.rom = rom
        self.rom_start = rom_start
        self.rom_range = rom_start, (rom_start + len(self.rom))
        self.ram = bytearray(ram_size)
        self.ram_start = ram_start
        self.ram_range = ram_start, (ram_start + ram_size)
        self.registers = [0 for r in range(0, 16)]
        self.flags = [False, False, False, False]
        print("processor state initialized")
    
    def __str__(self):
        registers = ''.join("{0:<3} = {1:08x}{2}".format(self.register_names[a],b, ',\n' if a%4==3 else ", ") for (a, b) in enumerate(self.registers))
        return "rom: ({0:08x}, {1:08x}), ".format(*self.rom_range) + "ram ({0:08x},{1:08x}),\n".format(*self.ram_range) + registers

    __repr__ = __str__ # convenience, but should not be same

    def between(self, address, bounds):
        return bounds[0] <= address < bounds[1]

    def is_ram(self, address):
        return self.between(address, self.ram_range)

    def is_rom(self, address):
        return self.between(address, self.rom_range)

    def eq(self):
        return self.flags[self.flag['Z']]
    
    def ne(self):
        return not self.eq()

    def cs(self):
        return self.flags[self.flag['C']]

    def cc(self):
        return not self.cs()

    hs = cs # HS (unsigned higher or same) is a synonym for CS.
    lo = cc # LO (unsigned lower) is a synonym for CC.

    def mi(self):
        return self.flags[self.flag['N']]

    def pl(self):
        return not self.mi()

    def vs(self):
        return self.flags[self.flag['V']]

    def vc(self):
        return not self.vs()
    
    def hi(self):
        return self.cs() and self.ne()

    def ls(self):
        return self.cc() and self.eq()

    def ge(self):
        return self.mi() == self.vs()

    def lt(self):
        return not self.ge()

    def gt(self):
        return self.ne() and self.ge()

    def le(self):
        return self.eq() and self.lt()

    def al(self): # allways, same as no condition, never coded in thumb instruction
        return True
 
    cond = {code:cond for (code, cond) in enumerate((eq, ne, cs, cc, mi, pl, vs, vc, hi, ls, ge, lt, gt, le, al))}

    def test(self, value1, value2):
        result = value1 & value2
        self.flags[self.flag['Z']] = result == 0
        self.flags[self.flag['N']] = (result >> 31) & 1 == 1
        return self.flags # for testing
    
    def __getitem__(self, address):
        if self.is_rom(address):
            return self.fetch_word(address - self.rom_start, self.rom)
        elif self.is_ram(address):
            return self.fetch_word(address - self.ram_start, self.ram)
        else:
            return self.hook(address)

    def fetch_halfword(self,  loc=None, memory=None, bigendian=True):
        """ joins two bytes to halfword, default bigendian """
        memory = memory or self.rom
        loc = loc or self.PC
        return (memory[loc] + (memory[loc+1]<<8)) if bigendian else (
                (memory[loc]<<8) + memory[loc+1])

    def fetch_word(self, loc=None, memory=None, bigendian=True):
        """ joins four bytes to word, default bigendian """
        memory = memory or self.rom
        loc = loc or self.PC
        return (memory[loc] + (memory[loc+1]<<8) + (memory[loc+2]<<16) + (memory[loc+3]<<24 )) if bigendian else (
                (memory[loc]<< 24) + (memory[loc+1]<<16) + (memory[loc+2]<<8) + memory[loc+3])

    def mov(self, rm, value):
        self.registers[rm] = value

    def b(self, address, condition=True):
        if condition:
            self.PC = address
    
    def adds(self, rn, value1, value2=None): #value given as immediate or taken from register, result to register
        if value2:
            self.registers[rn] = value1 + value2
            # set flags to be implemented
        else:
            self.registers[rn] += value1

    def adc(self, rn, value1, value2=None): #value given as immediate or taken from register, result to register
        if value2:
            self.registers[rn] = value1 + value2 + (1 if self.cs() else 0)
            # set flags to be implemented
        else:
            self.registers[rn] += value1 + (1 if self.cs() else 0)

    def subs(self, rn, value1, value2=None):
        if value2:
            self.registers[rn] = value1 - value2
            # set flags to be implemented
        else:
            self.registers[rn] -= value1

    def sbc(self,rn, value1, value2=None):
        if value2:
            self.registers[rn] = value1 - value2 - (1 if self.cs() else 0)
            # set flags to be implemented
        else:
            self.registers[rn] -= value1 - (1 if self.cs() else 0)

        
    def ldrb_ind(self, rm, rn, imm=0):
        self.registers[rm]=self.memory(self.registers[rn]+imm) & 0xff

    def ldrh_ind(self, rm, rn, imm=0):
        self.registers[rm]=self.memory(self.registers[rn]+imm) & 0xffff

    def ldr_ind(self, rm, rn, imm=0):
        self.registers[rm]=self.memory(self.registers[rn]+imm)

    @property
    def PC(self):
        return self.registers[15]

    @PC.setter
    def PC(self, value):
        self.registers[15] = value >> 1 << 1 # must be half word aligned

    def next(self):
        self.PC+=2

    def do_op(self, trace=trace):
        instr = rp2040.disassemble(self, self.fetch_halfword())
        if trace: print("{0:x} {1}".format(self.PC, instr))
        return instr

    def execute(self,break_instr="bkpt"):
        decoded = ""
        while not (decoded.startswith(break_instr)):
            decoded = self.do_op()
            self.next()
        return hex(self.PC)

if __name__ == '__main__':
    code, data = rp2040.get_bootrom()
    break_instr = "muls"
    print("ROM loaded, initializing rp2040")

    rp = arm_m0(265*1024*1024, 0x100000, code, code.minaddr())

    rp.b(0x1c)
    rp.execute(break_instr)
