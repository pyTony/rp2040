import rp2040


class arm_m0():
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

    def fetch_halfword(self, bigendian=True):
        """ joins two bytes to halfword, default bigendian """
        return (self.rom[self.PC-self.rom_start] + self.rom[self.PC+1-self.rom_start]*0x100) if bigendian else (
            0x100*self.rom[self.PC-self.rom_start] +
            self.rom[self.PC+1-self.rom_start])

    def jump(self, address):
        self.PC = address

    @property
    def PC(self):
        return self.registers[15]

    @PC.setter
    def PC(self, value):
        self.registers[15] = value

    def do_op(self, opc):
        instr = rp2040.disassemble(self.PC, opc)
        print("{0:x} {1}".format(self.PC, instr))
        return instr.startswith('b')

    def execute(self):
        is_jump = False
        while not is_jump:
            is_jump = self.do_op(self.fetch_halfword())
            self.PC += 2
        return self.PC

if __name__ == '__main__':
    code, data = rp2040.get_bootrom()
    print("disassembled, initializing rp2040")
    rp = arm_m0(265*1024*1024, 0x100000, code, code.minaddr())

    rp.jump(0x10)
    rp.execute()
