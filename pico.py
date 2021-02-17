import rp2040

from enum import Enum, auto

class arm_m0():
    flag = {v:rn for rn,v in enumerate("NZCV")}

    def __init__(self, ram_size, ram_start, rom, rom_start=0):
        self.rom = rom
        self.rom_start = rom_start
        self.rom_range = rom_start, (rom_start + len(self.rom))
        self.ram = ram_size * [0]
        self.ram_start = ram_start
        self.ram_range = ram_start, (ram_start + ram_size)
        self.registers = [0 for r in range(0, 16)]
        self.flags = [False, False, False, False]
        print("processor state initialized")
    
    def __str__(self):
        registers = ''.join("r{0:<2} = {1:08x}{2}".format(a,b, ',\n' if a%4==3 else ", ") for (a, b) in enumerate(self.registers))
        return "rom: ({0:08x}, {1:08x}), ".format(*self.rom_range) + "ram ({0:08x},{1:08x}),\n".format(*self.ram_range) + registers

    __repr__ = __str__ # convenience, but should not be same

    def between(self, address, bounds):
        return bounds[0] <= address <= bounds[1]

    def is_ram(self, address):
        return self.between(address, self.ram_range)

    def is_rom(self, address):
        return self.between(address, self.rom_range)

    def memory(self, address):
        if self.is_rom(address):
            return self.rom[address - self.rom_start]
        elif self.is_ram(address):
            return self.ram[address - self.ram_start]
        else:
            return self.hook(address)

    def fetch_halfword(self, bigendian=True):
        """ joins two bytes to halfword, default bigendian """
        return (self.rom[self.PC-self.rom_start] + self.rom[self.PC+1-self.rom_start]*0x100) if bigendian else (
            0x100*self.rom[self.PC-self.rom_start] +
            self.rom[self.PC+1-self.rom_start])

    def mov(self, rm, rn):
        self.registers[rm]=self.registers[rn]

    def mov_imm(self, rn, imm):
        self.registers[rn] = imm

    def jump(self, address):
        self.PC = address

    def ldrb_ind(self, rm, rn, imm=0):
        self.registers[rm]=self.memory(self.registers[rn]+imm) & 0xf

    def ldr_ind(self, rm, rn, imm=0):
        self.registers[rm]=self.memory(self.registers[rn]+imm)

    @property
    def PC(self):
        return self.registers[15]

    @PC.setter
    def PC(self, value):
        self.registers[15] = value

    def do_op(self):
        instr = rp2040.disassemble(self, self.fetch_halfword())
        print("{0:x} {1}".format(self.PC, instr))
        return instr

    def execute(self,break_instr="bkpt"):
        decoded = ""
        while not (decoded.startswith(break_instr)):
            decoded = self.do_op()
            self.PC += 2
            assert self.is_rom(self.PC)
        return hex(self.PC)

if __name__ == '__main__':
    code, data = rp2040.get_bootrom()
    #break_instr = "mrs"
    print("disassembled, initializing rp2040")

    rp = arm_m0(265*1024*1024, 0x100000, code, code.minaddr())

    rp.jump(0x10)
    rp.execute()
