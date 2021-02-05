# rp2040
Making first disassembler of  ARM v6m Thumb instructions and then turning it to simulator of Raspberry Pico RP2040 chip/board.

I am learning about Typescript from the similar project in that language and felt inspired to refresh my Python a bit and also knowledge of
new ARM chips as a former owner of original ARM computer Acorn Archimedes "A340" (A310 expanded to 4 MB by a technician) until it broke down at end of 80'ies.

Thank you to Wokwi! (https://www.youtube.com/channel/UCXjWweOkccNu1WeFPkXIBXw, https://hackaday.io/project/177082-raspberry-pi-pico-emulator)

(For my other Python work in past when I was daniweb moderator see https://www.daniweb.com/members/734700/trustytony)

UPDATE: Now working with Pico bootrom and found potential problem with disassembler:
            # 00000fce 884b 1000100001001011 100010 lsrs	r6, r1, #31
         This does not make sense to me
         
 online http://shell-storm.org/online/Online-Assembler-and-Disassembler/?opcodes=884b&arch=arm-t&endianness=big&dis_with_addr=True&dis_with_raw=True&dis_with_ins=True#disassembly

# 88 4B    ldrh r3, [r1, #2]

This looks correct! So I implemented this.
