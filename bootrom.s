
bootrom.elf:     file format elf32-littlearm

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00004000  00000000  00000000  00010000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .bss          00000bec  50100400  50100400  00020400  2**2
                  ALLOC
  2 .ARM.attributes 0000002b  00000000  00000000  00014000  2**0
                  CONTENTS, READONLY
  3 .comment      00000059  00000000  00000000  0001402b  2**0
                  CONTENTS, READONLY
  4 .debug_line   000060a1  00000000  00000000  00014084  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  5 .debug_info   0000c736  00000000  00000000  0001a125  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  6 .debug_abbrev 00001875  00000000  00000000  0002685b  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  7 .debug_aranges 00000388  00000000  00000000  000280d0  2**3
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  8 .debug_str    00003360  00000000  00000000  00028458  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  9 .debug_loc    00004eea  00000000  00000000  0002b7b8  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 10 .debug_ranges 000012b0  00000000  00000000  000306a2  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
 11 .debug_frame  0000093c  00000000  00000000  00031954  2**2
                  CONTENTS, READONLY, DEBUGGING, OCTETS

bootrom.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__vectors>:
       0:	20041f00 	.word	0x20041f00
       4:	000000ef 	.word	0x000000ef
       8:	00000035 	.word	0x00000035
       c:	00000031 	.word	0x00000031

00000010 <_magic>:
      10:	0201754d 	.word	0x0201754d

00000014 <_well_known>:
      14:	00c8007a 	.word	0x00c8007a
      18:	0000001d 	.word	0x0000001d

0000001c <table_lookup>:
      1c:	2300      	movs	r3, #0
      1e:	8802      	ldrh	r2, [r0, #0]
      20:	429a      	cmp	r2, r3
      22:	d003      	beq.n	2c <table_lookup+0x10>
      24:	8843      	ldrh	r3, [r0, #2]
      26:	3004      	adds	r0, #4
      28:	4291      	cmp	r1, r2
      2a:	d1f7      	bne.n	1c <table_lookup>
      2c:	1c18      	adds	r0, r3, #0
      2e:	4770      	bx	lr

00000030 <_dead>:
      30:	bf30      	wfi
      32:	e7fd      	b.n	30 <_dead>

00000034 <_nmi>:
      34:	46f4      	mov	ip, lr
      36:	f000 f805 	bl	44 <enable_clocks>
      3a:	489e      	ldr	r0, [pc, #632]	; (2b4 <async_task_worker_thunk+0xc>)
      3c:	2100      	movs	r1, #0
      3e:	6001      	str	r1, [r0, #0]
      40:	6041      	str	r1, [r0, #4]
      42:	46e7      	mov	pc, ip

00000044 <enable_clocks>:
      44:	489c      	ldr	r0, [pc, #624]	; (2b8 <async_task_worker_thunk+0x10>)
      46:	2100      	movs	r1, #0
      48:	43c9      	mvns	r1, r1
      4a:	6001      	str	r1, [r0, #0]
      4c:	6041      	str	r1, [r0, #4]

0000004e <_noop>:
      4e:	4770      	bx	lr

00000050 <software_git_revision>:
      50:	00a4a191 	.word	0x00a4a191

00000054 <__irq5_vector>:
      54:	00001e09 	.word	0x00001e09

00000058 <copyright>:
      58:	20294328 	.word	0x20294328
      5c:	30323032 	.word	0x30323032
      60:	73615220 	.word	0x73615220
      64:	72656270 	.word	0x72656270
      68:	50207972 	.word	0x50207972
      6c:	72542069 	.word	0x72542069
      70:	6e696461 	.word	0x6e696461
      74:	744c2067 	.word	0x744c2067
      78:	0064      	.short	0x0064

0000007a <function_table>:
      7a:	3350      	.short	0x3350
      7c:	335202d9 	.word	0x335202d9
      80:	334c02fd 	.word	0x334c02fd
      84:	33540327 	.word	0x33540327
      88:	534d035f 	.word	0x534d035f
      8c:	345326dd 	.word	0x345326dd
      90:	434d26d1 	.word	0x434d26d1
      94:	34432641 	.word	0x34432641
      98:	42552629 	.word	0x42552629
      9c:	544425b5 	.word	0x544425b5
      a0:	45440185 	.word	0x45440185
      a4:	5657018b 	.word	0x5657018b
      a8:	46490137 	.word	0x46490137
      ac:	584524a1 	.word	0x584524a1
      b0:	455223f5 	.word	0x455223f5
      b4:	5052237d 	.word	0x5052237d
      b8:	434623c5 	.word	0x434623c5
      bc:	58432361 	.word	0x58432361
      c0:	43452331 	.word	0x43452331
      c4:	00000045 	.word	0x00000045

000000c8 <data_table>:
      c8:	00505247 	.word	0x00505247
      cc:	00585243 	.word	0x00585243
      d0:	01a84653 	.word	0x01a84653
      d4:	02284453 	.word	0x02284453
      d8:	01a65a46 	.word	0x01a65a46
      dc:	27585346 	.word	0x27585346
      e0:	2e4c4546 	.word	0x2e4c4546
      e4:	2e545344 	.word	0x2e545344
      e8:	3dac4544 	.word	0x3dac4544
	...

000000ee <_start>:
      ee:	4873      	ldr	r0, [pc, #460]	; (2bc <async_task_worker_thunk+0x14>)
      f0:	6801      	ldr	r1, [r0, #0]
      f2:	2900      	cmp	r1, #0
      f4:	d11f      	bne.n	136 <wait_for_vector>
      f6:	f7ff ff9d 	bl	34 <_nmi>

000000fa <check_rescue>:
      fa:	4971      	ldr	r1, [pc, #452]	; (2c0 <async_task_worker_thunk+0x18>)
      fc:	4b71      	ldr	r3, [pc, #452]	; (2c4 <async_task_worker_thunk+0x1c>)
      fe:	680a      	ldr	r2, [r1, #0]
     100:	421a      	tst	r2, r3
     102:	d001      	beq.n	108 <check_wdog>
     104:	600b      	str	r3, [r1, #0]
     106:	e793      	b.n	30 <_dead>

00000108 <check_wdog>:
     108:	4f6f      	ldr	r7, [pc, #444]	; (2c8 <async_task_worker_thunk+0x20>)
     10a:	4e70      	ldr	r6, [pc, #448]	; (2cc <async_task_worker_thunk+0x24>)
     10c:	cf0f      	ldmia	r7!, {r0, r1, r2, r3}
     10e:	42b0      	cmp	r0, r6
     110:	d107      	bne.n	122 <check_wdog+0x1a>
     112:	4059      	eors	r1, r3
     114:	1840      	adds	r0, r0, r1
     116:	d104      	bne.n	122 <check_wdog+0x1a>
     118:	3f10      	subs	r7, #16
     11a:	6038      	str	r0, [r7, #0]
     11c:	f382 8808 	msr	MSP, r2
     120:	4798      	blx	r3
     122:	f002 f9e1 	bl	24e8 <main>

00000126 <send_and_then_again>:
     126:	bf20      	wfe

00000128 <send_and_then>:
     128:	6d21      	ldr	r1, [r4, #80]	; 0x50
     12a:	0889      	lsrs	r1, r1, #2
     12c:	d3fb      	bcc.n	126 <send_and_then_again>
     12e:	6560      	str	r0, [r4, #84]	; 0x54
     130:	bf40      	sev
     132:	1c6e      	adds	r6, r5, #1
     134:	4730      	bx	r6

00000136 <wait_for_vector>:
     136:	4c61      	ldr	r4, [pc, #388]	; (2bc <async_task_worker_thunk+0x14>)
     138:	4f65      	ldr	r7, [pc, #404]	; (2d0 <async_task_worker_thunk+0x28>)
     13a:	2104      	movs	r1, #4
     13c:	6139      	str	r1, [r7, #16]
     13e:	6da1      	ldr	r1, [r4, #88]	; 0x58

00000140 <core_0_handshake_loop>:
     140:	6d21      	ldr	r1, [r4, #80]	; 0x50
     142:	0849      	lsrs	r1, r1, #1
     144:	d2fb      	bcs.n	13e <wait_for_vector+0x8>
     146:	a50b      	add	r5, pc, #44	; (adr r5, 174 <receive_and_check_zero>)
     148:	2000      	movs	r0, #0
     14a:	f7ff ffed 	bl	128 <send_and_then>
     14e:	2801      	cmp	r0, #1
     150:	d1f6      	bne.n	140 <core_0_handshake_loop>
     152:	f7ff ffe9 	bl	128 <send_and_then>
     156:	60b8      	str	r0, [r7, #8]
     158:	f7ff ffe6 	bl	128 <send_and_then>
     15c:	f380 8808 	msr	MSP, r0
     160:	f7ff ffe2 	bl	128 <send_and_then>
     164:	a501      	add	r5, pc, #4	; (adr r5, 16c <core1_launch>)
     166:	f7ff ffdf 	bl	128 <send_and_then>
     16a:	46c0      	nop			; (mov r8, r8)

0000016c <core1_launch>:
     16c:	2100      	movs	r1, #0
     16e:	6139      	str	r1, [r7, #16]
     170:	4780      	blx	r0
     172:	e75d      	b.n	30 <_dead>

00000174 <receive_and_check_zero>:
     174:	bf20      	wfe
     176:	6d20      	ldr	r0, [r4, #80]	; 0x50
     178:	0840      	lsrs	r0, r0, #1
     17a:	d3fb      	bcc.n	174 <receive_and_check_zero>
     17c:	6da0      	ldr	r0, [r4, #88]	; 0x58
     17e:	2800      	cmp	r0, #0
     180:	d0de      	beq.n	140 <core_0_handshake_loop>
     182:	4770      	bx	lr

00000184 <debug_trampoline>:
     184:	2601      	movs	r6, #1
     186:	4337      	orrs	r7, r6
     188:	47b8      	blx	r7

0000018a <debug_trampoline_end>:
     18a:	be00      	bkpt	0x0000
     18c:	e7fa      	b.n	184 <debug_trampoline>
     18e:	3811      	.short	0x3811
     190:	bd007ac0 	.word	0xbd007ac0
     194:	4042b500 	.word	0x4042b500
     198:	f0002a00 	.word	0xf0002a00
     19c:	d2f6f802 	.word	0xd2f6f802
     1a0:	4670468e 	.word	0x4670468e
     1a4:	4700      	.short	0x4700

000001a6 <soft_float_table_size>:
     1a6:	0020      	.short	0x0020

000001a8 <soft_float_table>:
     1a8:	00002b69 	.word	0x00002b69
     1ac:	00002b65 	.word	0x00002b65
     1b0:	00002c31 	.word	0x00002c31
     1b4:	00002cfd 	.word	0x00002cfd
     1b8:	00002827 	.word	0x00002827
     1bc:	00002827 	.word	0x00002827
     1c0:	00002db1 	.word	0x00002db1
     1c4:	0000284d 	.word	0x0000284d
     1c8:	0000284f 	.word	0x0000284f
     1cc:	00002881 	.word	0x00002881
     1d0:	00002883 	.word	0x00002883
     1d4:	000028d7 	.word	0x000028d7
     1d8:	000028d9 	.word	0x000028d9
     1dc:	000028e7 	.word	0x000028e7
     1e0:	000028e9 	.word	0x000028e9
     1e4:	000029bf 	.word	0x000029bf
     1e8:	00002975 	.word	0x00002975
     1ec:	000029dd 	.word	0x000029dd
     1f0:	00000031 	.word	0x00000031
     1f4:	000029e5 	.word	0x000029e5
     1f8:	00002a4f 	.word	0x00002a4f
     1fc:	0000280b 	.word	0x0000280b
     200:	00002a73 	.word	0x00002a73
     204:	000028af 	.word	0x000028af
     208:	000028b1 	.word	0x000028b1
     20c:	0000289d 	.word	0x0000289d
     210:	0000289f 	.word	0x0000289f
     214:	00003581 	.word	0x00003581
     218:	00003583 	.word	0x00003583
     21c:	0000358b 	.word	0x0000358b
     220:	0000358d 	.word	0x0000358d
     224:	0000363d 	.word	0x0000363d

00000228 <soft_double_table>:
     228:	00002e61 	.word	0x00002e61
     22c:	00002e55 	.word	0x00002e55
     230:	00002fbd 	.word	0x00002fbd
     234:	00003119 	.word	0x00003119
     238:	0000346b 	.word	0x0000346b
     23c:	0000346b 	.word	0x0000346b
     240:	000032dd 	.word	0x000032dd
     244:	00003565 	.word	0x00003565
     248:	00003567 	.word	0x00003567
     24c:	00003573 	.word	0x00003573
     250:	00003575 	.word	0x00003575
     254:	000036c3 	.word	0x000036c3
     258:	000036c5 	.word	0x000036c5
     25c:	000036bb 	.word	0x000036bb
     260:	000036bd 	.word	0x000036bd
     264:	00003831 	.word	0x00003831
     268:	00003841 	.word	0x00003841
     26c:	00003811 	.word	0x00003811
     270:	00000031 	.word	0x00000031
     274:	00003b45 	.word	0x00003b45
     278:	00003be1 	.word	0x00003be1
     27c:	0000346f 	.word	0x0000346f
     280:	00003931 	.word	0x00003931
     284:	000036d1 	.word	0x000036d1
     288:	000036d3 	.word	0x000036d3
     28c:	000036cb 	.word	0x000036cb
     290:	000036cd 	.word	0x000036cd
     294:	000035c1 	.word	0x000035c1
     298:	000035c3 	.word	0x000035c3
     29c:	000035db 	.word	0x000035db
     2a0:	000035dd 	.word	0x000035dd
     2a4:	00003663 	.word	0x00003663

000002a8 <async_task_worker_thunk>:
     2a8:	480a      	ldr	r0, [pc, #40]	; (2d4 <async_task_worker_thunk+0x2c>)
     2aa:	f380 8808 	msr	MSP, r0
     2ae:	f001 ff1b 	bl	20e8 <async_task_worker>
     2b2:	0000      	.short	0x0000
     2b4:	40004000 	.word	0x40004000
     2b8:	400080a0 	.word	0x400080a0
     2bc:	d0000000 	.word	0xd0000000
     2c0:	40064008 	.word	0x40064008
     2c4:	01000000 	.word	0x01000000
     2c8:	4005801c 	.word	0x4005801c
     2cc:	b007c0d3 	.word	0xb007c0d3
     2d0:	e000ed00 	.word	0xe000ed00
     2d4:	501008b0 	.word	0x501008b0

000002d8 <popcount32>:
     2d8:	4933      	ldr	r1, [pc, #204]	; (3a8 <rt0_literals+0x2>)
     2da:	0842      	lsrs	r2, r0, #1
     2dc:	400a      	ands	r2, r1
     2de:	0883      	lsrs	r3, r0, #2
     2e0:	400b      	ands	r3, r1
     2e2:	4008      	ands	r0, r1
     2e4:	1880      	adds	r0, r0, r2
     2e6:	18c0      	adds	r0, r0, r3
     2e8:	08c1      	lsrs	r1, r0, #3
     2ea:	1840      	adds	r0, r0, r1
     2ec:	492f      	ldr	r1, [pc, #188]	; (3ac <rt0_literals+0x6>)
     2ee:	4008      	ands	r0, r1
     2f0:	0981      	lsrs	r1, r0, #6
     2f2:	1840      	adds	r0, r0, r1
     2f4:	492e      	ldr	r1, [pc, #184]	; (3b0 <rt0_literals+0xa>)
     2f6:	4348      	muls	r0, r1
     2f8:	0e80      	lsrs	r0, r0, #26
     2fa:	4770      	bx	lr

000002fc <reverse32>:
     2fc:	4a2d      	ldr	r2, [pc, #180]	; (3b4 <rt0_literals+0xe>)
     2fe:	0851      	lsrs	r1, r2, #1
     300:	4051      	eors	r1, r2
     302:	0043      	lsls	r3, r0, #1
     304:	400b      	ands	r3, r1
     306:	4008      	ands	r0, r1
     308:	0840      	lsrs	r0, r0, #1
     30a:	4318      	orrs	r0, r3
     30c:	0083      	lsls	r3, r0, #2
     30e:	4013      	ands	r3, r2
     310:	4010      	ands	r0, r2
     312:	0880      	lsrs	r0, r0, #2
     314:	4303      	orrs	r3, r0
     316:	4a28      	ldr	r2, [pc, #160]	; (3b8 <rt0_literals+0x12>)
     318:	0118      	lsls	r0, r3, #4
     31a:	4010      	ands	r0, r2
     31c:	4013      	ands	r3, r2
     31e:	091b      	lsrs	r3, r3, #4
     320:	4318      	orrs	r0, r3
     322:	ba00      	rev	r0, r0
     324:	4770      	bx	lr

00000326 <clz32>:
     326:	a325      	add	r3, pc, #148	; (adr r3, 3bc <clz6_table>)
     328:	0c01      	lsrs	r1, r0, #16
     32a:	d10c      	bne.n	346 <clz32_0_15_n>
     32c:	0a81      	lsrs	r1, r0, #10
     32e:	d104      	bne.n	33a <clz32_16_21_l>
     330:	0901      	lsrs	r1, r0, #4
     332:	d105      	bne.n	340 <clz32_22_27_l>
     334:	5c18      	ldrb	r0, [r3, r0]
     336:	301a      	adds	r0, #26
     338:	4770      	bx	lr

0000033a <clz32_16_21_l>:
     33a:	5c58      	ldrb	r0, [r3, r1]
     33c:	3010      	adds	r0, #16
     33e:	4770      	bx	lr

00000340 <clz32_22_27_l>:
     340:	5c58      	ldrb	r0, [r3, r1]
     342:	3016      	adds	r0, #22
     344:	4770      	bx	lr

00000346 <clz32_0_15_n>:
     346:	0a88      	lsrs	r0, r1, #10
     348:	d104      	bne.n	354 <clz32_0_5_l>
     34a:	0908      	lsrs	r0, r1, #4
     34c:	d104      	bne.n	358 <clz32_6_11_l>
     34e:	5c58      	ldrb	r0, [r3, r1]
     350:	300a      	adds	r0, #10
     352:	4770      	bx	lr

00000354 <clz32_0_5_l>:
     354:	5c18      	ldrb	r0, [r3, r0]
     356:	4770      	bx	lr

00000358 <clz32_6_11_l>:
     358:	5c18      	ldrb	r0, [r3, r0]
     35a:	3006      	adds	r0, #6
     35c:	4770      	bx	lr

0000035e <ctz32>:
     35e:	a327      	add	r3, pc, #156	; (adr r3, 3fc <ctz6_table>)
     360:	0401      	lsls	r1, r0, #16
     362:	d00f      	beq.n	384 <ctz32_16_31_n>

00000364 <ctz32_0_15_n>:
     364:	0188      	lsls	r0, r1, #6
     366:	d005      	beq.n	374 <ctz32_10_15_l>
     368:	0181      	lsls	r1, r0, #6
     36a:	d007      	beq.n	37c <ctz32_4_9_l>
     36c:	0f09      	lsrs	r1, r1, #28
     36e:	3110      	adds	r1, #16
     370:	5c58      	ldrb	r0, [r3, r1]
     372:	4770      	bx	lr

00000374 <ctz32_10_15_l>:
     374:	0e89      	lsrs	r1, r1, #26
     376:	5c58      	ldrb	r0, [r3, r1]
     378:	300a      	adds	r0, #10
     37a:	4770      	bx	lr

0000037c <ctz32_4_9_l>:
     37c:	0e80      	lsrs	r0, r0, #26
     37e:	5c18      	ldrb	r0, [r3, r0]
     380:	3004      	adds	r0, #4
     382:	4770      	bx	lr

00000384 <ctz32_16_31_n>:
     384:	0181      	lsls	r1, r0, #6
     386:	d006      	beq.n	396 <ctz32_26_31_l>
     388:	0188      	lsls	r0, r1, #6
     38a:	d008      	beq.n	39e <ctz32_20_25_l>
     38c:	0f00      	lsrs	r0, r0, #28
     38e:	3010      	adds	r0, #16
     390:	5c18      	ldrb	r0, [r3, r0]
     392:	3010      	adds	r0, #16
     394:	4770      	bx	lr

00000396 <ctz32_26_31_l>:
     396:	0e80      	lsrs	r0, r0, #26
     398:	5c18      	ldrb	r0, [r3, r0]
     39a:	301a      	adds	r0, #26
     39c:	4770      	bx	lr

0000039e <ctz32_20_25_l>:
     39e:	0e89      	lsrs	r1, r1, #26
     3a0:	5c58      	ldrb	r0, [r3, r1]
     3a2:	3014      	adds	r0, #20
     3a4:	4770      	bx	lr

000003a6 <rt0_literals>:
     3a6:	0000      	.short	0x0000
     3a8:	49249249 	.word	0x49249249
     3ac:	c71c71c7 	.word	0xc71c71c7
     3b0:	04004004 	.word	0x04004004
     3b4:	cccccccc 	.word	0xcccccccc
     3b8:	f0f0f0f0 	.word	0xf0f0f0f0

000003bc <clz6_table>:
     3bc:	04040506 	.word	0x04040506
     3c0:	03030303 	.word	0x03030303
     3c4:	02020202 	.word	0x02020202
     3c8:	02020202 	.word	0x02020202
     3cc:	01010101 	.word	0x01010101
     3d0:	01010101 	.word	0x01010101
     3d4:	01010101 	.word	0x01010101
     3d8:	01010101 	.word	0x01010101
	...

000003fc <ctz6_table>:
     3fc:	00010006 	.word	0x00010006
     400:	00010002 	.word	0x00010002
     404:	00010003 	.word	0x00010003
     408:	00010002 	.word	0x00010002
     40c:	00010004 	.word	0x00010004
     410:	00010002 	.word	0x00010002
     414:	00010003 	.word	0x00010003
     418:	00010002 	.word	0x00010002
     41c:	00010005 	.word	0x00010005
     420:	00010002 	.word	0x00010002
     424:	00010003 	.word	0x00010003
     428:	00010002 	.word	0x00010002
     42c:	00010004 	.word	0x00010004
     430:	00010002 	.word	0x00010002
     434:	00010003 	.word	0x00010003
     438:	00010002 	.word	0x00010002

0000043c <_rom_functions>:
     43c:	20e10031 	.word	0x20e10031
     440:	1c492169 	.word	0x1c492169
     444:	1dcd1ba9 	.word	0x1dcd1ba9
     448:	be0022fd 	.word	0xbe0022fd

0000044c <_msc_on_sector_stream_packet_complete>:
     44c:	4a02      	ldr	r2, [pc, #8]	; (458 <_msc_on_sector_stream_packet_complete+0xc>)
     44e:	6893      	ldr	r3, [r2, #8]
     450:	3b40      	subs	r3, #64	; 0x40
     452:	6093      	str	r3, [r2, #8]
     454:	4770      	bx	lr
     456:	46c0      	nop			; (mov r8, r8)
     458:	50100a7c 	.word	0x50100a7c

0000045c <_tf_set_address>:
     45c:	4a02      	ldr	r2, [pc, #8]	; (468 <_tf_set_address+0xc>)
     45e:	7d93      	ldrb	r3, [r2, #22]
     460:	7513      	strb	r3, [r2, #20]
     462:	4a02      	ldr	r2, [pc, #8]	; (46c <_tf_set_address+0x10>)
     464:	6013      	str	r3, [r2, #0]
     466:	4770      	bx	lr
     468:	501009ec 	.word	0x501009ec
     46c:	50110000 	.word	0x50110000

00000470 <usb_reset_transfer>:
     470:	2300      	movs	r3, #0
     472:	6001      	str	r1, [r0, #0]
     474:	6103      	str	r3, [r0, #16]
     476:	6042      	str	r2, [r0, #4]
     478:	784b      	ldrb	r3, [r1, #1]
     47a:	60c3      	str	r3, [r0, #12]
     47c:	6083      	str	r3, [r0, #8]
     47e:	4770      	bx	lr

00000480 <_usb_call_on_packet>:
     480:	4904      	ldr	r1, [pc, #16]	; (494 <_usb_call_on_packet+0x14>)
     482:	6883      	ldr	r3, [r0, #8]
     484:	2201      	movs	r2, #1
     486:	741a      	strb	r2, [r3, #16]
     488:	681b      	ldr	r3, [r3, #0]
     48a:	781b      	ldrb	r3, [r3, #0]
     48c:	5acb      	ldrh	r3, [r1, r3]
     48e:	4313      	orrs	r3, r2
     490:	4718      	bx	r3
     492:	0000      	.short	0x0000
     494:	0000043c 	.word	0x0000043c

00000498 <_usb_endpoint_hw_init>:
     498:	6803      	ldr	r3, [r0, #0]
     49a:	b570      	push	{r4, r5, r6, lr}
     49c:	1e19      	subs	r1, r3, #0
     49e:	d002      	beq.n	4a6 <_usb_endpoint_hw_init+0xe>
     4a0:	7899      	ldrb	r1, [r3, #2]
     4a2:	230f      	movs	r3, #15
     4a4:	4019      	ands	r1, r3
     4a6:	2400      	movs	r4, #0
     4a8:	2500      	movs	r5, #0
     4aa:	4a12      	ldr	r2, [pc, #72]	; (4f4 <_usb_endpoint_hw_init+0x5c>)
     4ac:	00cb      	lsls	r3, r1, #3
     4ae:	189a      	adds	r2, r3, r2
     4b0:	6014      	str	r4, [r2, #0]
     4b2:	6055      	str	r5, [r2, #4]
     4b4:	0004      	movs	r4, r0
     4b6:	4e10      	ldr	r6, [pc, #64]	; (4f8 <_usb_endpoint_hw_init+0x60>)
     4b8:	3428      	adds	r4, #40	; 0x28
     4ba:	8b32      	ldrh	r2, [r6, #24]
     4bc:	8282      	strh	r2, [r0, #20]
     4be:	7825      	ldrb	r5, [r4, #0]
     4c0:	2440      	movs	r4, #64	; 0x40
     4c2:	2d00      	cmp	r5, #0
     4c4:	d000      	beq.n	4c8 <_usb_endpoint_hw_init+0x30>
     4c6:	1924      	adds	r4, r4, r4
     4c8:	1914      	adds	r4, r2, r4
     4ca:	8334      	strh	r4, [r6, #24]
     4cc:	2900      	cmp	r1, #0
     4ce:	d00e      	beq.n	4ee <_usb_endpoint_hw_init+0x56>
     4d0:	2154      	movs	r1, #84	; 0x54
     4d2:	2d00      	cmp	r5, #0
     4d4:	d000      	beq.n	4d8 <_usb_endpoint_hw_init+0x40>
     4d6:	3120      	adds	r1, #32
     4d8:	0649      	lsls	r1, r1, #25
     4da:	3029      	adds	r0, #41	; 0x29
     4dc:	1852      	adds	r2, r2, r1
     4de:	7801      	ldrb	r1, [r0, #0]
     4e0:	4806      	ldr	r0, [pc, #24]	; (4fc <_usb_endpoint_hw_init+0x64>)
     4e2:	181b      	adds	r3, r3, r0
     4e4:	2900      	cmp	r1, #0
     4e6:	d003      	beq.n	4f0 <_usb_endpoint_hw_init+0x58>
     4e8:	601a      	str	r2, [r3, #0]
     4ea:	2200      	movs	r2, #0
     4ec:	605a      	str	r2, [r3, #4]
     4ee:	bd70      	pop	{r4, r5, r6, pc}
     4f0:	6019      	str	r1, [r3, #0]
     4f2:	e7fb      	b.n	4ec <_usb_endpoint_hw_init+0x54>
     4f4:	50100080 	.word	0x50100080
     4f8:	501009ec 	.word	0x501009ec
     4fc:	50100000 	.word	0x50100000

00000500 <_usb_endpoint_init_internal>:
     500:	b530      	push	{r4, r5, lr}
     502:	1c45      	adds	r5, r0, #1
     504:	b2c9      	uxtb	r1, r1
     506:	77e9      	strb	r1, [r5, #31]
     508:	3528      	adds	r5, #40	; 0x28
     50a:	702a      	strb	r2, [r5, #0]
     50c:	82c3      	strh	r3, [r0, #22]
     50e:	0003      	movs	r3, r0
     510:	ac03      	add	r4, sp, #12
     512:	7824      	ldrb	r4, [r4, #0]
     514:	3328      	adds	r3, #40	; 0x28
     516:	701c      	strb	r4, [r3, #0]
     518:	2301      	movs	r3, #1
     51a:	0049      	lsls	r1, r1, #1
     51c:	405a      	eors	r2, r3
     51e:	1889      	adds	r1, r1, r2
     520:	1cc3      	adds	r3, r0, #3
     522:	77d9      	strb	r1, [r3, #31]
     524:	bd30      	pop	{r4, r5, pc}
     526:	be00      	bkpt	0x0000

00000528 <usb_interface_init.constprop.0>:
     528:	0013      	movs	r3, r2
     52a:	b5f0      	push	{r4, r5, r6, r7, lr}
     52c:	0006      	movs	r6, r0
     52e:	000c      	movs	r4, r1
     530:	0015      	movs	r5, r2
     532:	b085      	sub	sp, #20
     534:	3308      	adds	r3, #8
     536:	6001      	str	r1, [r0, #0]
     538:	9303      	str	r3, [sp, #12]
     53a:	7823      	ldrb	r3, [r4, #0]
     53c:	18e4      	adds	r4, r4, r3
     53e:	7863      	ldrb	r3, [r4, #1]
     540:	2b05      	cmp	r3, #5
     542:	d1fa      	bne.n	53a <usb_interface_init.constprop.0+0x12>
     544:	7963      	ldrb	r3, [r4, #5]
     546:	7921      	ldrb	r1, [r4, #4]
     548:	021b      	lsls	r3, r3, #8
     54a:	430b      	orrs	r3, r1
     54c:	270f      	movs	r7, #15
     54e:	2101      	movs	r1, #1
     550:	78a2      	ldrb	r2, [r4, #2]
     552:	9100      	str	r1, [sp, #0]
     554:	4017      	ands	r7, r2
     556:	0039      	movs	r1, r7
     558:	6828      	ldr	r0, [r5, #0]
     55a:	09d2      	lsrs	r2, r2, #7
     55c:	f7ff ffd0 	bl	500 <_usb_endpoint_init_internal>
     560:	cd08      	ldmia	r5!, {r3}
     562:	4a05      	ldr	r2, [pc, #20]	; (578 <usb_interface_init.constprop.0+0x50>)
     564:	00bf      	lsls	r7, r7, #2
     566:	601c      	str	r4, [r3, #0]
     568:	50bb      	str	r3, [r7, r2]
     56a:	9b03      	ldr	r3, [sp, #12]
     56c:	42ab      	cmp	r3, r5
     56e:	d1e4      	bne.n	53a <usb_interface_init.constprop.0+0x12>
     570:	0030      	movs	r0, r6
     572:	b005      	add	sp, #20
     574:	bdf0      	pop	{r4, r5, r6, r7, pc}
     576:	46c0      	nop			; (mov r8, r8)
     578:	50100a08 	.word	0x50100a08

0000057c <_usb_buf_ctrl_wide>:
     57c:	1c43      	adds	r3, r0, #1
     57e:	7fdb      	ldrb	r3, [r3, #31]
     580:	3029      	adds	r0, #41	; 0x29
     582:	7802      	ldrb	r2, [r0, #0]
     584:	4903      	ldr	r1, [pc, #12]	; (594 <_usb_buf_ctrl_wide+0x18>)
     586:	00db      	lsls	r3, r3, #3
     588:	1858      	adds	r0, r3, r1
     58a:	2a00      	cmp	r2, #0
     58c:	d001      	beq.n	592 <_usb_buf_ctrl_wide+0x16>
     58e:	4a02      	ldr	r2, [pc, #8]	; (598 <_usb_buf_ctrl_wide+0x1c>)
     590:	1898      	adds	r0, r3, r2
     592:	4770      	bx	lr
     594:	50100084 	.word	0x50100084
     598:	50100080 	.word	0x50100080

0000059c <usb_current_packet_buffer>:
     59c:	b570      	push	{r4, r5, r6, lr}
     59e:	0006      	movs	r6, r0
     5a0:	7f83      	ldrb	r3, [r0, #30]
     5a2:	0004      	movs	r4, r0
     5a4:	3618      	adds	r6, #24
     5a6:	2b00      	cmp	r3, #0
     5a8:	d11f      	bne.n	5ea <usb_current_packet_buffer+0x4e>
     5aa:	8ac3      	ldrh	r3, [r0, #22]
     5ac:	7743      	strb	r3, [r0, #29]
     5ae:	0003      	movs	r3, r0
     5b0:	3329      	adds	r3, #41	; 0x29
     5b2:	7819      	ldrb	r1, [r3, #0]
     5b4:	1d43      	adds	r3, r0, #5
     5b6:	2900      	cmp	r1, #0
     5b8:	d100      	bne.n	5bc <usb_current_packet_buffer+0x20>
     5ba:	1d83      	adds	r3, r0, #6
     5bc:	7fdd      	ldrb	r5, [r3, #31]
     5be:	8aa3      	ldrh	r3, [r4, #20]
     5c0:	002a      	movs	r2, r5
     5c2:	1e50      	subs	r0, r2, #1
     5c4:	4182      	sbcs	r2, r0
     5c6:	480a      	ldr	r0, [pc, #40]	; (5f0 <usb_current_packet_buffer+0x54>)
     5c8:	0192      	lsls	r2, r2, #6
     5ca:	181b      	adds	r3, r3, r0
     5cc:	189b      	adds	r3, r3, r2
     5ce:	61a3      	str	r3, [r4, #24]
     5d0:	2300      	movs	r3, #0
     5d2:	4299      	cmp	r1, r3
     5d4:	d106      	bne.n	5e4 <usb_current_packet_buffer+0x48>
     5d6:	0020      	movs	r0, r4
     5d8:	f7ff ffd0 	bl	57c <_usb_buf_ctrl_wide>
     5dc:	006d      	lsls	r5, r5, #1
     5de:	1945      	adds	r5, r0, r5
     5e0:	882b      	ldrh	r3, [r5, #0]
     5e2:	b2db      	uxtb	r3, r3
     5e4:	7723      	strb	r3, [r4, #28]
     5e6:	2301      	movs	r3, #1
     5e8:	77a3      	strb	r3, [r4, #30]
     5ea:	0030      	movs	r0, r6
     5ec:	bd70      	pop	{r4, r5, r6, pc}
     5ee:	46c0      	nop			; (mov r8, r8)
     5f0:	50100000 	.word	0x50100000

000005f4 <_usb_give_buffer>:
     5f4:	2200      	movs	r2, #0
     5f6:	b570      	push	{r4, r5, r6, lr}
     5f8:	1dc3      	adds	r3, r0, #7
     5fa:	77da      	strb	r2, [r3, #31]
     5fc:	3301      	adds	r3, #1
     5fe:	0004      	movs	r4, r0
     600:	7fd8      	ldrb	r0, [r3, #31]
     602:	4290      	cmp	r0, r2
     604:	d12f      	bne.n	666 <_usb_give_buffer+0x72>
     606:	2380      	movs	r3, #128	; 0x80
     608:	00db      	lsls	r3, r3, #3
     60a:	4319      	orrs	r1, r3
     60c:	0023      	movs	r3, r4
     60e:	3329      	adds	r3, #41	; 0x29
     610:	781b      	ldrb	r3, [r3, #0]
     612:	2b00      	cmp	r3, #0
     614:	d002      	beq.n	61c <_usb_give_buffer+0x28>
     616:	2380      	movs	r3, #128	; 0x80
     618:	021b      	lsls	r3, r3, #8
     61a:	4319      	orrs	r1, r3
     61c:	1ca2      	adds	r2, r4, #2
     61e:	7fd3      	ldrb	r3, [r2, #31]
     620:	2601      	movs	r6, #1
     622:	001d      	movs	r5, r3
     624:	1e68      	subs	r0, r5, #1
     626:	4185      	sbcs	r5, r0
     628:	4073      	eors	r3, r6
     62a:	77d3      	strb	r3, [r2, #31]
     62c:	0020      	movs	r0, r4
     62e:	036d      	lsls	r5, r5, #13
     630:	430d      	orrs	r5, r1
     632:	f7ff ffa3 	bl	57c <_usb_buf_ctrl_wide>
     636:	1d63      	adds	r3, r4, #5
     638:	7fda      	ldrb	r2, [r3, #31]
     63a:	b2ad      	uxth	r5, r5
     63c:	40b2      	lsls	r2, r6
     63e:	1880      	adds	r0, r0, r2
     640:	2200      	movs	r2, #0
     642:	8005      	strh	r5, [r0, #0]
     644:	1d21      	adds	r1, r4, #4
     646:	77a2      	strb	r2, [r4, #30]
     648:	7fca      	ldrb	r2, [r1, #31]
     64a:	3a01      	subs	r2, #1
     64c:	77ca      	strb	r2, [r1, #31]
     64e:	68a1      	ldr	r1, [r4, #8]
     650:	3428      	adds	r4, #40	; 0x28
     652:	688a      	ldr	r2, [r1, #8]
     654:	3a01      	subs	r2, #1
     656:	608a      	str	r2, [r1, #8]
     658:	7822      	ldrb	r2, [r4, #0]
     65a:	2a00      	cmp	r2, #0
     65c:	d002      	beq.n	664 <_usb_give_buffer+0x70>
     65e:	7fda      	ldrb	r2, [r3, #31]
     660:	4056      	eors	r6, r2
     662:	77de      	strb	r6, [r3, #31]
     664:	bd70      	pop	{r4, r5, r6, pc}
     666:	20a0      	movs	r0, #160	; 0xa0
     668:	0140      	lsls	r0, r0, #5
     66a:	4301      	orrs	r1, r0
     66c:	77da      	strb	r2, [r3, #31]
     66e:	e7cd      	b.n	60c <_usb_give_buffer+0x18>

00000670 <_usb_give_as_many_buffers_as_possible>:
     670:	b570      	push	{r4, r5, r6, lr}
     672:	0004      	movs	r4, r0
     674:	68a3      	ldr	r3, [r4, #8]
     676:	2b00      	cmp	r3, #0
     678:	d015      	beq.n	6a6 <_usb_give_as_many_buffers_as_possible+0x36>
     67a:	689b      	ldr	r3, [r3, #8]
     67c:	2b00      	cmp	r3, #0
     67e:	d012      	beq.n	6a6 <_usb_give_as_many_buffers_as_possible+0x36>
     680:	1d26      	adds	r6, r4, #4
     682:	7ff5      	ldrb	r5, [r6, #31]
     684:	2d00      	cmp	r5, #0
     686:	d00e      	beq.n	6a6 <_usb_give_as_many_buffers_as_possible+0x36>
     688:	1de3      	adds	r3, r4, #7
     68a:	7fdb      	ldrb	r3, [r3, #31]
     68c:	2b00      	cmp	r3, #0
     68e:	d10a      	bne.n	6a6 <_usb_give_as_many_buffers_as_possible+0x36>
     690:	0023      	movs	r3, r4
     692:	3329      	adds	r3, #41	; 0x29
     694:	781b      	ldrb	r3, [r3, #0]
     696:	2b00      	cmp	r3, #0
     698:	d006      	beq.n	6a8 <_usb_give_as_many_buffers_as_possible+0x38>
     69a:	0020      	movs	r0, r4
     69c:	f7ff fef0 	bl	480 <_usb_call_on_packet>
     6a0:	7ff3      	ldrb	r3, [r6, #31]
     6a2:	42ab      	cmp	r3, r5
     6a4:	d1e6      	bne.n	674 <_usb_give_as_many_buffers_as_possible+0x4>
     6a6:	bd70      	pop	{r4, r5, r6, pc}
     6a8:	0020      	movs	r0, r4
     6aa:	8ae1      	ldrh	r1, [r4, #22]
     6ac:	f7ff ffa2 	bl	5f4 <_usb_give_buffer>
     6b0:	e7e0      	b.n	674 <_usb_give_as_many_buffers_as_possible+0x4>

000006b2 <usb_reset_and_start_transfer>:
     6b2:	b570      	push	{r4, r5, r6, lr}
     6b4:	000d      	movs	r5, r1
     6b6:	0004      	movs	r4, r0
     6b8:	0011      	movs	r1, r2
     6ba:	0028      	movs	r0, r5
     6bc:	001a      	movs	r2, r3
     6be:	f7ff fed7 	bl	470 <usb_reset_transfer>
     6c2:	2300      	movs	r3, #0
     6c4:	60e3      	str	r3, [r4, #12]
     6c6:	3301      	adds	r3, #1
     6c8:	60a5      	str	r5, [r4, #8]
     6ca:	0020      	movs	r0, r4
     6cc:	74ab      	strb	r3, [r5, #18]
     6ce:	f7ff ffcf 	bl	670 <_usb_give_as_many_buffers_as_possible>
     6d2:	bd70      	pop	{r4, r5, r6, pc}

000006d4 <_msc_reset_and_start_cmd_response_transfer>:
     6d4:	b510      	push	{r4, lr}
     6d6:	0003      	movs	r3, r0
     6d8:	4a02      	ldr	r2, [pc, #8]	; (6e4 <_msc_reset_and_start_cmd_response_transfer+0x10>)
     6da:	4903      	ldr	r1, [pc, #12]	; (6e8 <_msc_reset_and_start_cmd_response_transfer+0x14>)
     6dc:	4803      	ldr	r0, [pc, #12]	; (6ec <_msc_reset_and_start_cmd_response_transfer+0x18>)
     6de:	f7ff ffe8 	bl	6b2 <usb_reset_and_start_transfer>
     6e2:	bd10      	pop	{r4, pc}
     6e4:	00003f59 	.word	0x00003f59
     6e8:	50100a24 	.word	0x50100a24
     6ec:	50100dc0 	.word	0x50100dc0

000006f0 <usb_start_default_transfer_if_not_already_running_or_halted.part.0>:
     6f0:	6841      	ldr	r1, [r0, #4]
     6f2:	6883      	ldr	r3, [r0, #8]
     6f4:	b510      	push	{r4, lr}
     6f6:	428b      	cmp	r3, r1
     6f8:	d003      	beq.n	702 <usb_start_default_transfer_if_not_already_running_or_halted.part.0+0x12>
     6fa:	2300      	movs	r3, #0
     6fc:	680a      	ldr	r2, [r1, #0]
     6fe:	f7ff ffd8 	bl	6b2 <usb_reset_and_start_transfer>
     702:	bd10      	pop	{r4, pc}

00000704 <_tf_wait_command>:
     704:	0003      	movs	r3, r0
     706:	b510      	push	{r4, lr}
     708:	3333      	adds	r3, #51	; 0x33
     70a:	7fdb      	ldrb	r3, [r3, #31]
     70c:	302c      	adds	r0, #44	; 0x2c
     70e:	2b00      	cmp	r3, #0
     710:	d101      	bne.n	716 <_tf_wait_command+0x12>
     712:	f7ff ffed 	bl	6f0 <usb_start_default_transfer_if_not_already_running_or_halted.part.0>
     716:	bd10      	pop	{r4, pc}

00000718 <usb_start_empty_transfer>:
     718:	0003      	movs	r3, r0
     71a:	b570      	push	{r4, r5, r6, lr}
     71c:	3329      	adds	r3, #41	; 0x29
     71e:	781b      	ldrb	r3, [r3, #0]
     720:	0004      	movs	r4, r0
     722:	000d      	movs	r5, r1
     724:	0016      	movs	r6, r2
     726:	2b00      	cmp	r3, #0
     728:	d003      	beq.n	732 <usb_start_empty_transfer+0x1a>
     72a:	f7ff ff37 	bl	59c <usb_current_packet_buffer>
     72e:	2300      	movs	r3, #0
     730:	7103      	strb	r3, [r0, #4]
     732:	0033      	movs	r3, r6
     734:	0029      	movs	r1, r5
     736:	0020      	movs	r0, r4
     738:	4a01      	ldr	r2, [pc, #4]	; (740 <usb_start_empty_transfer+0x28>)
     73a:	f7ff ffba 	bl	6b2 <usb_reset_and_start_transfer>
     73e:	bd70      	pop	{r4, r5, r6, pc}
     740:	00003f59 	.word	0x00003f59

00000744 <usb_start_empty_control_in_transfer_null_completion>:
     744:	b510      	push	{r4, lr}
     746:	2200      	movs	r2, #0
     748:	4902      	ldr	r1, [pc, #8]	; (754 <usb_start_empty_control_in_transfer_null_completion+0x10>)
     74a:	4803      	ldr	r0, [pc, #12]	; (758 <usb_start_empty_control_in_transfer_null_completion+0x14>)
     74c:	f7ff ffe4 	bl	718 <usb_start_empty_transfer>
     750:	bd10      	pop	{r4, pc}
     752:	46c0      	nop			; (mov r8, r8)
     754:	501009c4 	.word	0x501009c4
     758:	50100f68 	.word	0x50100f68

0000075c <_tf_send_control_in_ack>:
     75c:	b510      	push	{r4, lr}
     75e:	2200      	movs	r2, #0
     760:	4902      	ldr	r1, [pc, #8]	; (76c <_tf_send_control_in_ack+0x10>)
     762:	4803      	ldr	r0, [pc, #12]	; (770 <_tf_send_control_in_ack+0x14>)
     764:	f7ff ffd8 	bl	718 <usb_start_empty_transfer>
     768:	bd10      	pop	{r4, pc}
     76a:	46c0      	nop			; (mov r8, r8)
     76c:	501009d8 	.word	0x501009d8
     770:	50100f94 	.word	0x50100f94

00000774 <usb_start_single_buffer_control_in_transfer>:
     774:	b510      	push	{r4, lr}
     776:	4b03      	ldr	r3, [pc, #12]	; (784 <usb_start_single_buffer_control_in_transfer+0x10>)
     778:	4a03      	ldr	r2, [pc, #12]	; (788 <usb_start_single_buffer_control_in_transfer+0x14>)
     77a:	4904      	ldr	r1, [pc, #16]	; (78c <usb_start_single_buffer_control_in_transfer+0x18>)
     77c:	4804      	ldr	r0, [pc, #16]	; (790 <usb_start_single_buffer_control_in_transfer+0x1c>)
     77e:	f7ff ff98 	bl	6b2 <usb_reset_and_start_transfer>
     782:	bd10      	pop	{r4, pc}
     784:	0000075d 	.word	0x0000075d
     788:	00003f59 	.word	0x00003f59
     78c:	501009c4 	.word	0x501009c4
     790:	50100f68 	.word	0x50100f68

00000794 <_usb_check_for_transfer_completion>:
     794:	b510      	push	{r4, lr}
     796:	1dc3      	adds	r3, r0, #7
     798:	7fda      	ldrb	r2, [r3, #31]
     79a:	6881      	ldr	r1, [r0, #8]
     79c:	2a00      	cmp	r2, #0
     79e:	d105      	bne.n	7ac <_usb_check_for_transfer_completion+0x18>
     7a0:	68cb      	ldr	r3, [r1, #12]
     7a2:	2b00      	cmp	r3, #0
     7a4:	d10a      	bne.n	7bc <_usb_check_for_transfer_completion+0x28>
     7a6:	7c0b      	ldrb	r3, [r1, #16]
     7a8:	2b00      	cmp	r3, #0
     7aa:	d107      	bne.n	7bc <_usb_check_for_transfer_completion+0x28>
     7ac:	2401      	movs	r4, #1
     7ae:	2300      	movs	r3, #0
     7b0:	74cc      	strb	r4, [r1, #19]
     7b2:	6083      	str	r3, [r0, #8]
     7b4:	429a      	cmp	r2, r3
     7b6:	d002      	beq.n	7be <_usb_check_for_transfer_completion+0x2a>
     7b8:	60cb      	str	r3, [r1, #12]
     7ba:	608b      	str	r3, [r1, #8]
     7bc:	bd10      	pop	{r4, pc}
     7be:	684b      	ldr	r3, [r1, #4]
     7c0:	2b00      	cmp	r3, #0
     7c2:	d001      	beq.n	7c8 <_usb_check_for_transfer_completion+0x34>
     7c4:	4798      	blx	r3
     7c6:	e7f9      	b.n	7bc <_usb_check_for_transfer_completion+0x28>
     7c8:	68c3      	ldr	r3, [r0, #12]
     7ca:	2b00      	cmp	r3, #0
     7cc:	d0f6      	beq.n	7bc <_usb_check_for_transfer_completion+0x28>
     7ce:	6083      	str	r3, [r0, #8]
     7d0:	60c2      	str	r2, [r0, #12]
     7d2:	749c      	strb	r4, [r3, #18]
     7d4:	f7ff ff4c 	bl	670 <_usb_give_as_many_buffers_as_possible>
     7d8:	e7f0      	b.n	7bc <_usb_check_for_transfer_completion+0x28>
     7da:	be00      	bkpt	0x0000

000007dc <_usb_stall_endpoint>:
     7dc:	b570      	push	{r4, r5, r6, lr}
     7de:	1dc6      	adds	r6, r0, #7
     7e0:	7ff3      	ldrb	r3, [r6, #31]
     7e2:	0004      	movs	r4, r0
     7e4:	000d      	movs	r5, r1
     7e6:	2b00      	cmp	r3, #0
     7e8:	d11a      	bne.n	820 <_usb_stall_endpoint+0x44>
     7ea:	1c43      	adds	r3, r0, #1
     7ec:	7fdb      	ldrb	r3, [r3, #31]
     7ee:	2b00      	cmp	r3, #0
     7f0:	d107      	bne.n	802 <_usb_stall_endpoint+0x26>
     7f2:	0003      	movs	r3, r0
     7f4:	3329      	adds	r3, #41	; 0x29
     7f6:	781b      	ldrb	r3, [r3, #0]
     7f8:	425a      	negs	r2, r3
     7fa:	4153      	adcs	r3, r2
     7fc:	4a0a      	ldr	r2, [pc, #40]	; (828 <_usb_stall_endpoint+0x4c>)
     7fe:	3301      	adds	r3, #1
     800:	6693      	str	r3, [r2, #104]	; 0x68
     802:	0020      	movs	r0, r4
     804:	f7ff feba 	bl	57c <_usb_buf_ctrl_wide>
     808:	2380      	movs	r3, #128	; 0x80
     80a:	6802      	ldr	r2, [r0, #0]
     80c:	011b      	lsls	r3, r3, #4
     80e:	4313      	orrs	r3, r2
     810:	6003      	str	r3, [r0, #0]
     812:	77f5      	strb	r5, [r6, #31]
     814:	6923      	ldr	r3, [r4, #16]
     816:	2b00      	cmp	r3, #0
     818:	d001      	beq.n	81e <_usb_stall_endpoint+0x42>
     81a:	0020      	movs	r0, r4
     81c:	4798      	blx	r3
     81e:	bd70      	pop	{r4, r5, r6, pc}
     820:	428b      	cmp	r3, r1
     822:	d2fc      	bcs.n	81e <_usb_stall_endpoint+0x42>
     824:	77f1      	strb	r1, [r6, #31]
     826:	e7fa      	b.n	81e <_usb_stall_endpoint+0x42>
     828:	50112000 	.word	0x50112000

0000082c <_usb_handle_transfer>:
     82c:	b570      	push	{r4, r5, r6, lr}
     82e:	2800      	cmp	r0, #0
     830:	d00e      	beq.n	850 <_usb_handle_transfer+0x24>
     832:	4b18      	ldr	r3, [pc, #96]	; (894 <_usb_handle_transfer+0x68>)
     834:	0080      	lsls	r0, r0, #2
     836:	58c4      	ldr	r4, [r0, r3]
     838:	1d21      	adds	r1, r4, #4
     83a:	7fcb      	ldrb	r3, [r1, #31]
     83c:	3301      	adds	r3, #1
     83e:	77cb      	strb	r3, [r1, #31]
     840:	68a5      	ldr	r5, [r4, #8]
     842:	2d00      	cmp	r5, #0
     844:	d109      	bne.n	85a <_usb_handle_transfer+0x2e>
     846:	2102      	movs	r1, #2
     848:	0020      	movs	r0, r4
     84a:	f7ff ffc7 	bl	7dc <_usb_stall_endpoint>
     84e:	bd70      	pop	{r4, r5, r6, pc}
     850:	4c11      	ldr	r4, [pc, #68]	; (898 <_usb_handle_transfer+0x6c>)
     852:	2900      	cmp	r1, #0
     854:	d1f0      	bne.n	838 <_usb_handle_transfer+0xc>
     856:	4c11      	ldr	r4, [pc, #68]	; (89c <_usb_handle_transfer+0x70>)
     858:	e7ee      	b.n	838 <_usb_handle_transfer+0xc>
     85a:	7c2b      	ldrb	r3, [r5, #16]
     85c:	2b00      	cmp	r3, #0
     85e:	d002      	beq.n	866 <_usb_handle_transfer+0x3a>
     860:	2301      	movs	r3, #1
     862:	746b      	strb	r3, [r5, #17]
     864:	e7f3      	b.n	84e <_usb_handle_transfer+0x22>
     866:	1da3      	adds	r3, r4, #6
     868:	77da      	strb	r2, [r3, #31]
     86a:	3323      	adds	r3, #35	; 0x23
     86c:	781b      	ldrb	r3, [r3, #0]
     86e:	2b00      	cmp	r3, #0
     870:	d002      	beq.n	878 <_usb_handle_transfer+0x4c>
     872:	68ab      	ldr	r3, [r5, #8]
     874:	2b00      	cmp	r3, #0
     876:	d002      	beq.n	87e <_usb_handle_transfer+0x52>
     878:	0020      	movs	r0, r4
     87a:	f7ff fe01 	bl	480 <_usb_call_on_packet>
     87e:	7ceb      	ldrb	r3, [r5, #19]
     880:	2b00      	cmp	r3, #0
     882:	d1e4      	bne.n	84e <_usb_handle_transfer+0x22>
     884:	68eb      	ldr	r3, [r5, #12]
     886:	0020      	movs	r0, r4
     888:	3b01      	subs	r3, #1
     88a:	60eb      	str	r3, [r5, #12]
     88c:	f7ff ff82 	bl	794 <_usb_check_for_transfer_completion>
     890:	e7dd      	b.n	84e <_usb_handle_transfer+0x22>
     892:	46c0      	nop			; (mov r8, r8)
     894:	50100a08 	.word	0x50100a08
     898:	50100f68 	.word	0x50100f68
     89c:	50100f94 	.word	0x50100f94

000008a0 <usb_packet_done>:
     8a0:	2300      	movs	r3, #0
     8a2:	b570      	push	{r4, r5, r6, lr}
     8a4:	6885      	ldr	r5, [r0, #8]
     8a6:	0004      	movs	r4, r0
     8a8:	742b      	strb	r3, [r5, #16]
     8aa:	f7ff ff73 	bl	794 <_usb_check_for_transfer_completion>
     8ae:	7ceb      	ldrb	r3, [r5, #19]
     8b0:	2b00      	cmp	r3, #0
     8b2:	d11b      	bne.n	8ec <usb_packet_done+0x4c>
     8b4:	0026      	movs	r6, r4
     8b6:	3629      	adds	r6, #41	; 0x29
     8b8:	7833      	ldrb	r3, [r6, #0]
     8ba:	2b00      	cmp	r3, #0
     8bc:	d003      	beq.n	8c6 <usb_packet_done+0x26>
     8be:	0020      	movs	r0, r4
     8c0:	7f21      	ldrb	r1, [r4, #28]
     8c2:	f7ff fe97 	bl	5f4 <_usb_give_buffer>
     8c6:	2300      	movs	r3, #0
     8c8:	77a3      	strb	r3, [r4, #30]
     8ca:	7c6a      	ldrb	r2, [r5, #17]
     8cc:	429a      	cmp	r2, r3
     8ce:	d00e      	beq.n	8ee <usb_packet_done+0x4e>
     8d0:	746b      	strb	r3, [r5, #17]
     8d2:	1d22      	adds	r2, r4, #4
     8d4:	7fd3      	ldrb	r3, [r2, #31]
     8d6:	3b01      	subs	r3, #1
     8d8:	77d3      	strb	r3, [r2, #31]
     8da:	2201      	movs	r2, #1
     8dc:	1da3      	adds	r3, r4, #6
     8de:	7fdb      	ldrb	r3, [r3, #31]
     8e0:	3401      	adds	r4, #1
     8e2:	7831      	ldrb	r1, [r6, #0]
     8e4:	7fe0      	ldrb	r0, [r4, #31]
     8e6:	405a      	eors	r2, r3
     8e8:	f7ff ffa0 	bl	82c <_usb_handle_transfer>
     8ec:	bd70      	pop	{r4, r5, r6, pc}
     8ee:	0020      	movs	r0, r4
     8f0:	f7ff febe 	bl	670 <_usb_give_as_many_buffers_as_possible>
     8f4:	e7fa      	b.n	8ec <usb_packet_done+0x4c>
     8f6:	be00      	bkpt	0x0000

000008f8 <_usb_reset_buffers>:
     8f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     8fa:	0004      	movs	r4, r0
     8fc:	f7ff fe3e 	bl	57c <_usb_buf_ctrl_wide>
     900:	0025      	movs	r5, r4
     902:	6802      	ldr	r2, [r0, #0]
     904:	4b19      	ldr	r3, [pc, #100]	; (96c <_usb_reset_buffers+0x74>)
     906:	3528      	adds	r5, #40	; 0x28
     908:	421a      	tst	r2, r3
     90a:	d01d      	beq.n	948 <_usb_reset_buffers+0x50>
     90c:	782b      	ldrb	r3, [r5, #0]
     90e:	2b00      	cmp	r3, #0
     910:	d003      	beq.n	91a <_usb_reset_buffers+0x22>
     912:	1d23      	adds	r3, r4, #4
     914:	7fdb      	ldrb	r3, [r3, #31]
     916:	2b01      	cmp	r3, #1
     918:	d104      	bne.n	924 <_usb_reset_buffers+0x2c>
     91a:	2301      	movs	r3, #1
     91c:	1ca2      	adds	r2, r4, #2
     91e:	7fd1      	ldrb	r1, [r2, #31]
     920:	404b      	eors	r3, r1
     922:	77d3      	strb	r3, [r2, #31]
     924:	1ce3      	adds	r3, r4, #3
     926:	7fda      	ldrb	r2, [r3, #31]
     928:	2301      	movs	r3, #1
     92a:	4093      	lsls	r3, r2
     92c:	4910      	ldr	r1, [pc, #64]	; (970 <_usb_reset_buffers+0x78>)
     92e:	4a11      	ldr	r2, [pc, #68]	; (974 <_usb_reset_buffers+0x7c>)
     930:	4811      	ldr	r0, [pc, #68]	; (978 <_usb_reset_buffers+0x80>)
     932:	4e12      	ldr	r6, [pc, #72]	; (97c <_usb_reset_buffers+0x84>)
     934:	6653      	str	r3, [r2, #100]	; 0x64
     936:	660b      	str	r3, [r1, #96]	; 0x60
     938:	6e77      	ldr	r7, [r6, #100]	; 0x64
     93a:	423b      	tst	r3, r7
     93c:	d102      	bne.n	944 <_usb_reset_buffers+0x4c>
     93e:	3801      	subs	r0, #1
     940:	2800      	cmp	r0, #0
     942:	d111      	bne.n	968 <_usb_reset_buffers+0x70>
     944:	6613      	str	r3, [r2, #96]	; 0x60
     946:	6653      	str	r3, [r2, #100]	; 0x64
     948:	0020      	movs	r0, r4
     94a:	f7ff fe17 	bl	57c <_usb_buf_ctrl_wide>
     94e:	782b      	ldrb	r3, [r5, #0]
     950:	2200      	movs	r2, #0
     952:	1e59      	subs	r1, r3, #1
     954:	418b      	sbcs	r3, r1
     956:	1d21      	adds	r1, r4, #4
     958:	3301      	adds	r3, #1
     95a:	6002      	str	r2, [r0, #0]
     95c:	77cb      	strb	r3, [r1, #31]
     95e:	2301      	movs	r3, #1
     960:	84a2      	strh	r2, [r4, #36]	; 0x24
     962:	3408      	adds	r4, #8
     964:	77e3      	strb	r3, [r4, #31]
     966:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     968:	660b      	str	r3, [r1, #96]	; 0x60
     96a:	e7e5      	b.n	938 <_usb_reset_buffers+0x40>
     96c:	04000400 	.word	0x04000400
     970:	50112000 	.word	0x50112000
     974:	50113000 	.word	0x50113000
     978:	000186a0 	.word	0x000186a0
     97c:	50110000 	.word	0x50110000

00000980 <usb_stall_control_pipe.constprop.0>:
     980:	b570      	push	{r4, r5, r6, lr}
     982:	4d08      	ldr	r5, [pc, #32]	; (9a4 <usb_stall_control_pipe.constprop.0+0x24>)
     984:	0028      	movs	r0, r5
     986:	f7ff ffb7 	bl	8f8 <_usb_reset_buffers>
     98a:	4c07      	ldr	r4, [pc, #28]	; (9a8 <usb_stall_control_pipe.constprop.0+0x28>)
     98c:	0020      	movs	r0, r4
     98e:	f7ff ffb3 	bl	8f8 <_usb_reset_buffers>
     992:	0028      	movs	r0, r5
     994:	2101      	movs	r1, #1
     996:	f7ff ff21 	bl	7dc <_usb_stall_endpoint>
     99a:	2101      	movs	r1, #1
     99c:	0020      	movs	r0, r4
     99e:	f7ff ff1d 	bl	7dc <_usb_stall_endpoint>
     9a2:	bd70      	pop	{r4, r5, r6, pc}
     9a4:	50100f68 	.word	0x50100f68
     9a8:	50100f94 	.word	0x50100f94

000009ac <_usb_reset_endpoint>:
     9ac:	b570      	push	{r4, r5, r6, lr}
     9ae:	2500      	movs	r5, #0
     9b0:	6085      	str	r5, [r0, #8]
     9b2:	000e      	movs	r6, r1
     9b4:	0004      	movs	r4, r0
     9b6:	f7ff ff9f 	bl	8f8 <_usb_reset_buffers>
     9ba:	42ae      	cmp	r6, r5
     9bc:	d001      	beq.n	9c2 <_usb_reset_endpoint+0x16>
     9be:	1ca2      	adds	r2, r4, #2
     9c0:	77d5      	strb	r5, [r2, #31]
     9c2:	77a5      	strb	r5, [r4, #30]
     9c4:	1de2      	adds	r2, r4, #7
     9c6:	7fd1      	ldrb	r1, [r2, #31]
     9c8:	2900      	cmp	r1, #0
     9ca:	d005      	beq.n	9d8 <_usb_reset_endpoint+0x2c>
     9cc:	77d5      	strb	r5, [r2, #31]
     9ce:	6923      	ldr	r3, [r4, #16]
     9d0:	2b00      	cmp	r3, #0
     9d2:	d001      	beq.n	9d8 <_usb_reset_endpoint+0x2c>
     9d4:	0020      	movs	r0, r4
     9d6:	4798      	blx	r3
     9d8:	4b07      	ldr	r3, [pc, #28]	; (9f8 <_usb_reset_endpoint+0x4c>)
     9da:	7d5b      	ldrb	r3, [r3, #21]
     9dc:	2b00      	cmp	r3, #0
     9de:	d009      	beq.n	9f4 <_usb_reset_endpoint+0x48>
     9e0:	6861      	ldr	r1, [r4, #4]
     9e2:	2900      	cmp	r1, #0
     9e4:	d006      	beq.n	9f4 <_usb_reset_endpoint+0x48>
     9e6:	68a3      	ldr	r3, [r4, #8]
     9e8:	2b00      	cmp	r3, #0
     9ea:	d103      	bne.n	9f4 <_usb_reset_endpoint+0x48>
     9ec:	0020      	movs	r0, r4
     9ee:	680a      	ldr	r2, [r1, #0]
     9f0:	f7ff fe5f 	bl	6b2 <usb_reset_and_start_transfer>
     9f4:	bd70      	pop	{r4, r5, r6, pc}
     9f6:	46c0      	nop			; (mov r8, r8)
     9f8:	501009ec 	.word	0x501009ec

000009fc <watchdog_reboot>:
     9fc:	b510      	push	{r4, lr}
     9fe:	4b1e      	ldr	r3, [pc, #120]	; (a78 <watchdog_reboot+0x7c>)
     a00:	4c1e      	ldr	r4, [pc, #120]	; (a7c <watchdog_reboot+0x80>)
     a02:	601c      	str	r4, [r3, #0]
     a04:	2480      	movs	r4, #128	; 0x80
     a06:	4b1e      	ldr	r3, [pc, #120]	; (a80 <watchdog_reboot+0x84>)
     a08:	05e4      	lsls	r4, r4, #23
     a0a:	601c      	str	r4, [r3, #0]
     a0c:	24e0      	movs	r4, #224	; 0xe0
     a0e:	04e4      	lsls	r4, r4, #19
     a10:	601c      	str	r4, [r3, #0]
     a12:	4b1c      	ldr	r3, [pc, #112]	; (a84 <watchdog_reboot+0x88>)
     a14:	2800      	cmp	r0, #0
     a16:	d02c      	beq.n	a72 <watchdog_reboot+0x76>
     a18:	2401      	movs	r4, #1
     a1a:	4320      	orrs	r0, r4
     a1c:	4c1a      	ldr	r4, [pc, #104]	; (a88 <watchdog_reboot+0x8c>)
     a1e:	61dc      	str	r4, [r3, #28]
     a20:	69dc      	ldr	r4, [r3, #28]
     a22:	4264      	negs	r4, r4
     a24:	4044      	eors	r4, r0
     a26:	621c      	str	r4, [r3, #32]
     a28:	6259      	str	r1, [r3, #36]	; 0x24
     a2a:	6298      	str	r0, [r3, #40]	; 0x28
     a2c:	21fa      	movs	r1, #250	; 0xfa
     a2e:	0089      	lsls	r1, r1, #2
     a30:	434a      	muls	r2, r1
     a32:	605a      	str	r2, [r3, #4]
     a34:	4a15      	ldr	r2, [pc, #84]	; (a8c <watchdog_reboot+0x90>)
     a36:	6811      	ldr	r1, [r2, #0]
     a38:	2202      	movs	r2, #2
     a3a:	4211      	tst	r1, r2
     a3c:	d10b      	bne.n	a56 <watchdog_reboot+0x5a>
     a3e:	4914      	ldr	r1, [pc, #80]	; (a90 <watchdog_reboot+0x94>)
     a40:	4814      	ldr	r0, [pc, #80]	; (a94 <watchdog_reboot+0x98>)
     a42:	6809      	ldr	r1, [r1, #0]
     a44:	404a      	eors	r2, r1
     a46:	2103      	movs	r1, #3
     a48:	400a      	ands	r2, r1
     a4a:	4913      	ldr	r1, [pc, #76]	; (a98 <watchdog_reboot+0x9c>)
     a4c:	600a      	str	r2, [r1, #0]
     a4e:	2204      	movs	r2, #4
     a50:	6b81      	ldr	r1, [r0, #56]	; 0x38
     a52:	4211      	tst	r1, r2
     a54:	d0fc      	beq.n	a50 <watchdog_reboot+0x54>
     a56:	220c      	movs	r2, #12
     a58:	62da      	str	r2, [r3, #44]	; 0x2c
     a5a:	4b10      	ldr	r3, [pc, #64]	; (a9c <watchdog_reboot+0xa0>)
     a5c:	32f5      	adds	r2, #245	; 0xf5
     a5e:	32ff      	adds	r2, #255	; 0xff
     a60:	601a      	str	r2, [r3, #0]
     a62:	2280      	movs	r2, #128	; 0x80
     a64:	4b0e      	ldr	r3, [pc, #56]	; (aa0 <watchdog_reboot+0xa4>)
     a66:	05d2      	lsls	r2, r2, #23
     a68:	601a      	str	r2, [r3, #0]
     a6a:	2201      	movs	r2, #1
     a6c:	4b0d      	ldr	r3, [pc, #52]	; (aa4 <watchdog_reboot+0xa8>)
     a6e:	701a      	strb	r2, [r3, #0]
     a70:	bd10      	pop	{r4, pc}
     a72:	61d8      	str	r0, [r3, #28]
     a74:	e7da      	b.n	a2c <watchdog_reboot+0x30>
     a76:	46c0      	nop			; (mov r8, r8)
     a78:	40010008 	.word	0x40010008
     a7c:	0001fffc 	.word	0x0001fffc
     a80:	4005b000 	.word	0x4005b000
     a84:	40058000 	.word	0x40058000
     a88:	b007c0d3 	.word	0xb007c0d3
     a8c:	4006c000 	.word	0x4006c000
     a90:	40008030 	.word	0x40008030
     a94:	40008000 	.word	0x40008000
     a98:	40009030 	.word	0x40009030
     a9c:	4005a02c 	.word	0x4005a02c
     aa0:	4005a000 	.word	0x4005a000
     aa4:	50100eb4 	.word	0x50100eb4

00000aa8 <_do_flash_erase_range>:
     aa8:	b570      	push	{r4, r5, r6, lr}
     aaa:	0004      	movs	r4, r0
     aac:	1845      	adds	r5, r0, r1
     aae:	2000      	movs	r0, #0
     ab0:	42ac      	cmp	r4, r5
     ab2:	d201      	bcs.n	ab8 <_do_flash_erase_range+0x10>
     ab4:	2800      	cmp	r0, #0
     ab6:	d000      	beq.n	aba <_do_flash_erase_range+0x12>
     ab8:	bd70      	pop	{r4, r5, r6, pc}
     aba:	4b04      	ldr	r3, [pc, #16]	; (acc <_do_flash_erase_range+0x24>)
     abc:	0020      	movs	r0, r4
     abe:	681b      	ldr	r3, [r3, #0]
     ac0:	68db      	ldr	r3, [r3, #12]
     ac2:	4798      	blx	r3
     ac4:	2380      	movs	r3, #128	; 0x80
     ac6:	015b      	lsls	r3, r3, #5
     ac8:	18e4      	adds	r4, r4, r3
     aca:	e7f1      	b.n	ab0 <_do_flash_erase_range+0x8>
     acc:	50100dbc 	.word	0x50100dbc

00000ad0 <is_address_ram.lto_priv.0>:
     ad0:	22e0      	movs	r2, #224	; 0xe0
     ad2:	0612      	lsls	r2, r2, #24
     ad4:	1881      	adds	r1, r0, r2
     ad6:	2284      	movs	r2, #132	; 0x84
     ad8:	0003      	movs	r3, r0
     ada:	02d2      	lsls	r2, r2, #11
     adc:	2001      	movs	r0, #1
     ade:	4291      	cmp	r1, r2
     ae0:	d907      	bls.n	af2 <is_address_ram.lto_priv.0+0x22>
     ae2:	22eb      	movs	r2, #235	; 0xeb
     ae4:	0612      	lsls	r2, r2, #24
     ae6:	189b      	adds	r3, r3, r2
     ae8:	2280      	movs	r2, #128	; 0x80
     aea:	2000      	movs	r0, #0
     aec:	01d2      	lsls	r2, r2, #7
     aee:	429a      	cmp	r2, r3
     af0:	4140      	adcs	r0, r0
     af2:	4770      	bx	lr

00000af4 <_write_six_msb_hex_chars>:
     af4:	b530      	push	{r4, r5, lr}
     af6:	1d85      	adds	r5, r0, #6
     af8:	0f0c      	lsrs	r4, r1, #28
     afa:	b2e2      	uxtb	r2, r4
     afc:	0013      	movs	r3, r2
     afe:	3337      	adds	r3, #55	; 0x37
     b00:	2c09      	cmp	r4, #9
     b02:	d800      	bhi.n	b06 <_write_six_msb_hex_chars+0x12>
     b04:	3b07      	subs	r3, #7
     b06:	7003      	strb	r3, [r0, #0]
     b08:	3001      	adds	r0, #1
     b0a:	0109      	lsls	r1, r1, #4
     b0c:	42a8      	cmp	r0, r5
     b0e:	d1f3      	bne.n	af8 <_write_six_msb_hex_chars+0x4>
     b10:	bd30      	pop	{r4, r5, pc}
     b12:	be00      	bkpt	0x0000

00000b14 <_picoboot_ack>:
     b14:	2200      	movs	r2, #0
     b16:	b510      	push	{r4, lr}
     b18:	4b05      	ldr	r3, [pc, #20]	; (b30 <_picoboot_ack+0x1c>)
     b1a:	4806      	ldr	r0, [pc, #24]	; (b34 <_picoboot_ack+0x20>)
     b1c:	725a      	strb	r2, [r3, #9]
     b1e:	7a1b      	ldrb	r3, [r3, #8]
     b20:	2b7f      	cmp	r3, #127	; 0x7f
     b22:	d800      	bhi.n	b26 <_picoboot_ack+0x12>
     b24:	4804      	ldr	r0, [pc, #16]	; (b38 <_picoboot_ack+0x24>)
     b26:	4a05      	ldr	r2, [pc, #20]	; (b3c <_picoboot_ack+0x28>)
     b28:	4905      	ldr	r1, [pc, #20]	; (b40 <_picoboot_ack+0x2c>)
     b2a:	f7ff fdf5 	bl	718 <usb_start_empty_transfer>
     b2e:	bd10      	pop	{r4, pc}
     b30:	50100ab8 	.word	0x50100ab8
     b34:	50100e58 	.word	0x50100e58
     b38:	50100e24 	.word	0x50100e24
     b3c:	00000b5d 	.word	0x00000b5d
     b40:	501008b0 	.word	0x501008b0

00000b44 <_atc_ack>:
     b44:	4b04      	ldr	r3, [pc, #16]	; (b58 <_atc_ack+0x14>)
     b46:	6a02      	ldr	r2, [r0, #32]
     b48:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
     b4a:	b510      	push	{r4, lr}
     b4c:	429a      	cmp	r2, r3
     b4e:	d101      	bne.n	b54 <_atc_ack+0x10>
     b50:	f7ff ffe0 	bl	b14 <_picoboot_ack>
     b54:	bd10      	pop	{r4, pc}
     b56:	46c0      	nop			; (mov r8, r8)
     b58:	50100ac8 	.word	0x50100ac8

00000b5c <_tf_picoboot_wait_command>:
     b5c:	b510      	push	{r4, lr}
     b5e:	4804      	ldr	r0, [pc, #16]	; (b70 <_tf_picoboot_wait_command+0x14>)
     b60:	1dc3      	adds	r3, r0, #7
     b62:	7fdb      	ldrb	r3, [r3, #31]
     b64:	2b00      	cmp	r3, #0
     b66:	d101      	bne.n	b6c <_tf_picoboot_wait_command+0x10>
     b68:	f7ff fdc2 	bl	6f0 <usb_start_default_transfer_if_not_already_running_or_halted.part.0>
     b6c:	bd10      	pop	{r4, pc}
     b6e:	46c0      	nop			; (mov r8, r8)
     b70:	50100e58 	.word	0x50100e58

00000b74 <_get_descriptor_string>:
     b74:	0003      	movs	r3, r0
     b76:	4804      	ldr	r0, [pc, #16]	; (b88 <_get_descriptor_string+0x14>)
     b78:	2b03      	cmp	r3, #3
     b7a:	d803      	bhi.n	b84 <_get_descriptor_string+0x10>
     b7c:	4a03      	ldr	r2, [pc, #12]	; (b8c <_get_descriptor_string+0x18>)
     b7e:	3b01      	subs	r3, #1
     b80:	009b      	lsls	r3, r3, #2
     b82:	5898      	ldr	r0, [r3, r2]
     b84:	4770      	bx	lr
     b86:	46c0      	nop			; (mov r8, r8)
     b88:	00003db7 	.word	0x00003db7
     b8c:	00003ee8 	.word	0x00003ee8

00000b90 <flash_cs_force>:
     b90:	4b02      	ldr	r3, [pc, #8]	; (b9c <flash_cs_force+0xc>)
     b92:	0200      	lsls	r0, r0, #8
     b94:	6018      	str	r0, [r3, #0]
     b96:	681b      	ldr	r3, [r3, #0]
     b98:	4770      	bx	lr
     b9a:	46c0      	nop			; (mov r8, r8)
     b9c:	4001800c 	.word	0x4001800c

00000ba0 <flash_put_cmd_addr>:
     ba0:	b570      	push	{r4, r5, r6, lr}
     ba2:	0004      	movs	r4, r0
     ba4:	2002      	movs	r0, #2
     ba6:	000d      	movs	r5, r1
     ba8:	f7ff fff2 	bl	b90 <flash_cs_force>
     bac:	22c0      	movs	r2, #192	; 0xc0
     bae:	2304      	movs	r3, #4
     bb0:	0621      	lsls	r1, r4, #24
     bb2:	4329      	orrs	r1, r5
     bb4:	0552      	lsls	r2, r2, #21
     bb6:	0e08      	lsrs	r0, r1, #24
     bb8:	3b01      	subs	r3, #1
     bba:	6610      	str	r0, [r2, #96]	; 0x60
     bbc:	0209      	lsls	r1, r1, #8
     bbe:	2b00      	cmp	r3, #0
     bc0:	d1f9      	bne.n	bb6 <flash_put_cmd_addr+0x16>
     bc2:	bd70      	pop	{r4, r5, r6, pc}

00000bc4 <unreset_block_wait.lto_priv.0>:
     bc4:	4b03      	ldr	r3, [pc, #12]	; (bd4 <unreset_block_wait.lto_priv.0+0x10>)
     bc6:	4a04      	ldr	r2, [pc, #16]	; (bd8 <unreset_block_wait.lto_priv.0+0x14>)
     bc8:	6018      	str	r0, [r3, #0]
     bca:	0001      	movs	r1, r0
     bcc:	6893      	ldr	r3, [r2, #8]
     bce:	4399      	bics	r1, r3
     bd0:	d1fb      	bne.n	bca <unreset_block_wait.lto_priv.0+0x6>
     bd2:	4770      	bx	lr
     bd4:	4000f000 	.word	0x4000f000
     bd8:	4000c000 	.word	0x4000c000

00000bdc <execute_task.constprop.0>:
     bdc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
     bde:	3029      	adds	r0, #41	; 0x29
     be0:	7803      	ldrb	r3, [r0, #0]
     be2:	4c7a      	ldr	r4, [pc, #488]	; (dcc <execute_task.constprop.0+0x1f0>)
     be4:	2b00      	cmp	r3, #0
     be6:	d00a      	beq.n	bfe <execute_task.constprop.0+0x22>
     be8:	2301      	movs	r3, #1
     bea:	6063      	str	r3, [r4, #4]
     bec:	f3ef 8510 	mrs	r5, PRIMASK
     bf0:	b672      	cpsid	i
     bf2:	0020      	movs	r0, r4
     bf4:	68a3      	ldr	r3, [r4, #8]
     bf6:	4798      	blx	r3
     bf8:	f385 8810 	msr	PRIMASK, r5
     bfc:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
     bfe:	4b74      	ldr	r3, [pc, #464]	; (dd0 <execute_task.constprop.0+0x1f4>)
     c00:	2007      	movs	r0, #7
     c02:	781b      	ldrb	r3, [r3, #0]
     c04:	2b00      	cmp	r3, #0
     c06:	d109      	bne.n	c1c <execute_task.constprop.0+0x40>
     c08:	1d63      	adds	r3, r4, #5
     c0a:	7fde      	ldrb	r6, [r3, #31]
     c0c:	7fdb      	ldrb	r3, [r3, #31]
     c0e:	b25b      	sxtb	r3, r3
     c10:	2b00      	cmp	r3, #0
     c12:	da25      	bge.n	c60 <execute_task.constprop.0+0x84>
     c14:	68e5      	ldr	r5, [r4, #12]
     c16:	07eb      	lsls	r3, r5, #31
     c18:	d502      	bpl.n	c20 <execute_task.constprop.0+0x44>
     c1a:	2005      	movs	r0, #5
     c1c:	6060      	str	r0, [r4, #4]
     c1e:	e7e5      	b.n	bec <execute_task.constprop.0+0x10>
     c20:	0028      	movs	r0, r5
     c22:	f7ff ff55 	bl	ad0 <is_address_ram.lto_priv.0>
     c26:	2800      	cmp	r0, #0
     c28:	d101      	bne.n	c2e <execute_task.constprop.0+0x52>
     c2a:	2004      	movs	r0, #4
     c2c:	e7f6      	b.n	c1c <execute_task.constprop.0+0x40>
     c2e:	23eb      	movs	r3, #235	; 0xeb
     c30:	2780      	movs	r7, #128	; 0x80
     c32:	061b      	lsls	r3, r3, #24
     c34:	18eb      	adds	r3, r5, r3
     c36:	01ff      	lsls	r7, r7, #7
     c38:	42bb      	cmp	r3, r7
     c3a:	d9f6      	bls.n	c2a <execute_task.constprop.0+0x4e>
     c3c:	0028      	movs	r0, r5
     c3e:	301c      	adds	r0, #28
     c40:	f7ff ff46 	bl	ad0 <is_address_ram.lto_priv.0>
     c44:	2800      	cmp	r0, #0
     c46:	d0f0      	beq.n	c2a <execute_task.constprop.0+0x4e>
     c48:	4b62      	ldr	r3, [pc, #392]	; (dd4 <execute_task.constprop.0+0x1f8>)
     c4a:	18eb      	adds	r3, r5, r3
     c4c:	42bb      	cmp	r3, r7
     c4e:	d9ec      	bls.n	c2a <execute_task.constprop.0+0x4e>
     c50:	221c      	movs	r2, #28
     c52:	0028      	movs	r0, r5
     c54:	4960      	ldr	r1, [pc, #384]	; (dd8 <execute_task.constprop.0+0x1fc>)
     c56:	f001 fcf3 	bl	2640 <__memcpy>
     c5a:	4b60      	ldr	r3, [pc, #384]	; (ddc <execute_task.constprop.0+0x200>)
     c5c:	68e2      	ldr	r2, [r4, #12]
     c5e:	601a      	str	r2, [r3, #0]
     c60:	06f3      	lsls	r3, r6, #27
     c62:	d50e      	bpl.n	c82 <execute_task.constprop.0+0xa6>
     c64:	1da3      	adds	r3, r4, #6
     c66:	7fd9      	ldrb	r1, [r3, #31]
     c68:	000a      	movs	r2, r1
     c6a:	1e53      	subs	r3, r2, #1
     c6c:	419a      	sbcs	r2, r3
     c6e:	4b5c      	ldr	r3, [pc, #368]	; (de0 <execute_task.constprop.0+0x204>)
     c70:	b2d2      	uxtb	r2, r2
     c72:	3329      	adds	r3, #41	; 0x29
     c74:	701a      	strb	r2, [r3, #0]
     c76:	2902      	cmp	r1, #2
     c78:	d103      	bne.n	c82 <execute_task.constprop.0+0xa6>
     c7a:	2201      	movs	r2, #1
     c7c:	4b59      	ldr	r3, [pc, #356]	; (de4 <execute_task.constprop.0+0x208>)
     c7e:	3307      	adds	r3, #7
     c80:	77da      	strb	r2, [r3, #31]
     c82:	07f3      	lsls	r3, r6, #31
     c84:	d418      	bmi.n	cb8 <execute_task.constprop.0+0xdc>
     c86:	0673      	lsls	r3, r6, #25
     c88:	d41d      	bmi.n	cc6 <execute_task.constprop.0+0xea>
     c8a:	230a      	movs	r3, #10
     c8c:	421e      	tst	r6, r3
     c8e:	d00c      	beq.n	caa <execute_task.constprop.0+0xce>
     c90:	1de3      	adds	r3, r4, #7
     c92:	7fda      	ldrb	r2, [r3, #31]
     c94:	0023      	movs	r3, r4
     c96:	3308      	adds	r3, #8
     c98:	7fd9      	ldrb	r1, [r3, #31]
     c9a:	4b53      	ldr	r3, [pc, #332]	; (de8 <execute_task.constprop.0+0x20c>)
     c9c:	2900      	cmp	r1, #0
     c9e:	d003      	beq.n	ca8 <execute_task.constprop.0+0xcc>
     ca0:	7819      	ldrb	r1, [r3, #0]
     ca2:	2006      	movs	r0, #6
     ca4:	4291      	cmp	r1, r2
     ca6:	d1b9      	bne.n	c1c <execute_task.constprop.0+0x40>
     ca8:	701a      	strb	r2, [r3, #0]
     caa:	07b3      	lsls	r3, r6, #30
     cac:	d410      	bmi.n	cd0 <execute_task.constprop.0+0xf4>
     cae:	230c      	movs	r3, #12
     cb0:	421e      	tst	r6, r3
     cb2:	d125      	bne.n	d00 <execute_task.constprop.0+0x124>
     cb4:	2000      	movs	r0, #0
     cb6:	e7b1      	b.n	c1c <execute_task.constprop.0+0x40>
     cb8:	4b48      	ldr	r3, [pc, #288]	; (ddc <execute_task.constprop.0+0x200>)
     cba:	681b      	ldr	r3, [r3, #0]
     cbc:	689b      	ldr	r3, [r3, #8]
     cbe:	4798      	blx	r3
     cc0:	2800      	cmp	r0, #0
     cc2:	d0e0      	beq.n	c86 <execute_task.constprop.0+0xaa>
     cc4:	e7aa      	b.n	c1c <execute_task.constprop.0+0x40>
     cc6:	2301      	movs	r3, #1
     cc8:	68e2      	ldr	r2, [r4, #12]
     cca:	4313      	orrs	r3, r2
     ccc:	4798      	blx	r3
     cce:	e7dc      	b.n	c8a <execute_task.constprop.0+0xae>
     cd0:	6920      	ldr	r0, [r4, #16]
     cd2:	0503      	lsls	r3, r0, #20
     cd4:	d1a1      	bne.n	c1a <execute_task.constprop.0+0x3e>
     cd6:	6961      	ldr	r1, [r4, #20]
     cd8:	050b      	lsls	r3, r1, #20
     cda:	d19e      	bne.n	c1a <execute_task.constprop.0+0x3e>
     cdc:	25f0      	movs	r5, #240	; 0xf0
     cde:	2280      	movs	r2, #128	; 0x80
     ce0:	062d      	lsls	r5, r5, #24
     ce2:	1943      	adds	r3, r0, r5
     ce4:	0552      	lsls	r2, r2, #21
     ce6:	4293      	cmp	r3, r2
     ce8:	d89f      	bhi.n	c2a <execute_task.constprop.0+0x4e>
     cea:	1843      	adds	r3, r0, r1
     cec:	195b      	adds	r3, r3, r5
     cee:	4293      	cmp	r3, r2
     cf0:	d89b      	bhi.n	c2a <execute_task.constprop.0+0x4e>
     cf2:	4b3a      	ldr	r3, [pc, #232]	; (ddc <execute_task.constprop.0+0x200>)
     cf4:	681b      	ldr	r3, [r3, #0]
     cf6:	691b      	ldr	r3, [r3, #16]
     cf8:	4798      	blx	r3
     cfa:	2800      	cmp	r0, #0
     cfc:	d0d7      	beq.n	cae <execute_task.constprop.0+0xd2>
     cfe:	e78d      	b.n	c1c <execute_task.constprop.0+0x40>
     d00:	68e5      	ldr	r5, [r4, #12]
     d02:	0028      	movs	r0, r5
     d04:	f7ff fee4 	bl	ad0 <is_address_ram.lto_priv.0>
     d08:	2800      	cmp	r0, #0
     d0a:	d005      	beq.n	d18 <execute_task.constprop.0+0x13c>
     d0c:	69e3      	ldr	r3, [r4, #28]
     d0e:	18e8      	adds	r0, r5, r3
     d10:	f7ff fede 	bl	ad0 <is_address_ram.lto_priv.0>
     d14:	1e07      	subs	r7, r0, #0
     d16:	d11e      	bne.n	d56 <execute_task.constprop.0+0x17a>
     d18:	0733      	lsls	r3, r6, #28
     d1a:	d40a      	bmi.n	d32 <execute_task.constprop.0+0x156>
     d1c:	2280      	movs	r2, #128	; 0x80
     d1e:	0192      	lsls	r2, r2, #6
     d20:	4295      	cmp	r5, r2
     d22:	d206      	bcs.n	d32 <execute_task.constprop.0+0x156>
     d24:	69e3      	ldr	r3, [r4, #28]
     d26:	18eb      	adds	r3, r5, r3
     d28:	4293      	cmp	r3, r2
     d2a:	d300      	bcc.n	d2e <execute_task.constprop.0+0x152>
     d2c:	e77d      	b.n	c2a <execute_task.constprop.0+0x4e>
     d2e:	2701      	movs	r7, #1
     d30:	e011      	b.n	d56 <execute_task.constprop.0+0x17a>
     d32:	21f0      	movs	r1, #240	; 0xf0
     d34:	2280      	movs	r2, #128	; 0x80
     d36:	0609      	lsls	r1, r1, #24
     d38:	186b      	adds	r3, r5, r1
     d3a:	0552      	lsls	r2, r2, #21
     d3c:	4293      	cmp	r3, r2
     d3e:	d900      	bls.n	d42 <execute_task.constprop.0+0x166>
     d40:	e773      	b.n	c2a <execute_task.constprop.0+0x4e>
     d42:	69e3      	ldr	r3, [r4, #28]
     d44:	18eb      	adds	r3, r5, r3
     d46:	185b      	adds	r3, r3, r1
     d48:	4293      	cmp	r3, r2
     d4a:	d900      	bls.n	d4e <execute_task.constprop.0+0x172>
     d4c:	e76d      	b.n	c2a <execute_task.constprop.0+0x4e>
     d4e:	b2ef      	uxtb	r7, r5
     d50:	2f00      	cmp	r7, #0
     d52:	d000      	beq.n	d56 <execute_task.constprop.0+0x17a>
     d54:	e761      	b.n	c1a <execute_task.constprop.0+0x3e>
     d56:	0733      	lsls	r3, r6, #28
     d58:	d518      	bpl.n	d8c <execute_task.constprop.0+0x1b0>
     d5a:	4b20      	ldr	r3, [pc, #128]	; (ddc <execute_task.constprop.0+0x200>)
     d5c:	69a1      	ldr	r1, [r4, #24]
     d5e:	469c      	mov	ip, r3
     d60:	681b      	ldr	r3, [r3, #0]
     d62:	2f00      	cmp	r7, #0
     d64:	d023      	beq.n	dae <execute_task.constprop.0+0x1d2>
     d66:	69e2      	ldr	r2, [r4, #28]
     d68:	9501      	str	r5, [sp, #4]
     d6a:	42ab      	cmp	r3, r5
     d6c:	d900      	bls.n	d70 <execute_task.constprop.0+0x194>
     d6e:	9301      	str	r3, [sp, #4]
     d70:	331c      	adds	r3, #28
     d72:	18a8      	adds	r0, r5, r2
     d74:	4283      	cmp	r3, r0
     d76:	d200      	bcs.n	d7a <execute_task.constprop.0+0x19e>
     d78:	0018      	movs	r0, r3
     d7a:	9b01      	ldr	r3, [sp, #4]
     d7c:	4283      	cmp	r3, r0
     d7e:	d202      	bcs.n	d86 <execute_task.constprop.0+0x1aa>
     d80:	4660      	mov	r0, ip
     d82:	4b15      	ldr	r3, [pc, #84]	; (dd8 <execute_task.constprop.0+0x1fc>)
     d84:	6003      	str	r3, [r0, #0]
     d86:	0028      	movs	r0, r5
     d88:	f001 fc5a 	bl	2640 <__memcpy>
     d8c:	0773      	lsls	r3, r6, #29
     d8e:	d507      	bpl.n	da0 <execute_task.constprop.0+0x1c4>
     d90:	68e3      	ldr	r3, [r4, #12]
     d92:	69a0      	ldr	r0, [r4, #24]
     d94:	2f00      	cmp	r7, #0
     d96:	d010      	beq.n	dba <execute_task.constprop.0+0x1de>
     d98:	0019      	movs	r1, r3
     d9a:	69e2      	ldr	r2, [r4, #28]
     d9c:	f001 fc50 	bl	2640 <__memcpy>
     da0:	06b3      	lsls	r3, r6, #26
     da2:	d587      	bpl.n	cb4 <execute_task.constprop.0+0xd8>
     da4:	4b0d      	ldr	r3, [pc, #52]	; (ddc <execute_task.constprop.0+0x200>)
     da6:	681b      	ldr	r3, [r3, #0]
     da8:	685b      	ldr	r3, [r3, #4]
     daa:	4798      	blx	r3
     dac:	e736      	b.n	c1c <execute_task.constprop.0+0x40>
     dae:	0028      	movs	r0, r5
     db0:	695b      	ldr	r3, [r3, #20]
     db2:	4798      	blx	r3
     db4:	2800      	cmp	r0, #0
     db6:	d0e9      	beq.n	d8c <execute_task.constprop.0+0x1b0>
     db8:	e730      	b.n	c1c <execute_task.constprop.0+0x40>
     dba:	4a08      	ldr	r2, [pc, #32]	; (ddc <execute_task.constprop.0+0x200>)
     dbc:	0001      	movs	r1, r0
     dbe:	6812      	ldr	r2, [r2, #0]
     dc0:	0018      	movs	r0, r3
     dc2:	6992      	ldr	r2, [r2, #24]
     dc4:	4790      	blx	r2
     dc6:	2800      	cmp	r0, #0
     dc8:	d0ea      	beq.n	da0 <execute_task.constprop.0+0x1c4>
     dca:	e727      	b.n	c1c <execute_task.constprop.0+0x40>
     dcc:	50100d8c 	.word	0x50100d8c
     dd0:	50100eb4 	.word	0x50100eb4
     dd4:	eb00001c 	.word	0xeb00001c
     dd8:	00003ecc 	.word	0x00003ecc
     ddc:	50100dbc 	.word	0x50100dbc
     de0:	50100fc0 	.word	0x50100fc0
     de4:	50100a7c 	.word	0x50100a7c
     de8:	50100a1c 	.word	0x50100a1c

00000dec <usb_stream_packet_handler_complete>:
     dec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     dee:	6a46      	ldr	r6, [r0, #36]	; 0x24
     df0:	0004      	movs	r4, r0
     df2:	0033      	movs	r3, r6
     df4:	3329      	adds	r3, #41	; 0x29
     df6:	781b      	ldrb	r3, [r3, #0]
     df8:	0030      	movs	r0, r6
     dfa:	2b00      	cmp	r3, #0
     dfc:	d023      	beq.n	e46 <usb_stream_packet_handler_complete+0x5a>
     dfe:	f7ff fbcd 	bl	59c <usb_current_packet_buffer>
     e02:	6963      	ldr	r3, [r4, #20]
     e04:	69e2      	ldr	r2, [r4, #28]
     e06:	001f      	movs	r7, r3
     e08:	0005      	movs	r5, r0
     e0a:	69a0      	ldr	r0, [r4, #24]
     e0c:	1e51      	subs	r1, r2, #1
     e0e:	3740      	adds	r7, #64	; 0x40
     e10:	2240      	movs	r2, #64	; 0x40
     e12:	4019      	ands	r1, r3
     e14:	4287      	cmp	r7, r0
     e16:	d900      	bls.n	e1a <usb_stream_packet_handler_complete+0x2e>
     e18:	1ac2      	subs	r2, r0, r3
     e1a:	712a      	strb	r2, [r5, #4]
     e1c:	6a23      	ldr	r3, [r4, #32]
     e1e:	6828      	ldr	r0, [r5, #0]
     e20:	1859      	adds	r1, r3, r1
     e22:	f001 fc0d 	bl	2640 <__memcpy>
     e26:	792b      	ldrb	r3, [r5, #4]
     e28:	6962      	ldr	r2, [r4, #20]
     e2a:	0020      	movs	r0, r4
     e2c:	18d3      	adds	r3, r2, r3
     e2e:	6163      	str	r3, [r4, #20]
     e30:	6aa3      	ldr	r3, [r4, #40]	; 0x28
     e32:	681b      	ldr	r3, [r3, #0]
     e34:	4798      	blx	r3
     e36:	4b06      	ldr	r3, [pc, #24]	; (e50 <usb_stream_packet_handler_complete+0x64>)
     e38:	0030      	movs	r0, r6
     e3a:	681a      	ldr	r2, [r3, #0]
     e3c:	4b05      	ldr	r3, [pc, #20]	; (e54 <usb_stream_packet_handler_complete+0x68>)
     e3e:	601a      	str	r2, [r3, #0]
     e40:	f7ff fd2e 	bl	8a0 <usb_packet_done>
     e44:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     e46:	f7ff fba9 	bl	59c <usb_current_packet_buffer>
     e4a:	0005      	movs	r5, r0
     e4c:	e7eb      	b.n	e26 <usb_stream_packet_handler_complete+0x3a>
     e4e:	46c0      	nop			; (mov r8, r8)
     e50:	50100f64 	.word	0x50100f64
     e54:	d0000018 	.word	0xd0000018

00000e58 <_atc_chunk_task_done>:
     e58:	b570      	push	{r4, r5, r6, lr}
     e5a:	4c0c      	ldr	r4, [pc, #48]	; (e8c <_atc_chunk_task_done+0x34>)
     e5c:	6a03      	ldr	r3, [r0, #32]
     e5e:	6ce2      	ldr	r2, [r4, #76]	; 0x4c
     e60:	0005      	movs	r5, r0
     e62:	4293      	cmp	r3, r2
     e64:	d111      	bne.n	e8a <_atc_chunk_task_done+0x32>
     e66:	6843      	ldr	r3, [r0, #4]
     e68:	4e09      	ldr	r6, [pc, #36]	; (e90 <_atc_chunk_task_done+0x38>)
     e6a:	6073      	str	r3, [r6, #4]
     e6c:	2b00      	cmp	r3, #0
     e6e:	d005      	beq.n	e7c <_atc_chunk_task_done+0x24>
     e70:	2102      	movs	r1, #2
     e72:	6a60      	ldr	r0, [r4, #36]	; 0x24
     e74:	f7ff fcb2 	bl	7dc <_usb_stall_endpoint>
     e78:	2300      	movs	r3, #0
     e7a:	7273      	strb	r3, [r6, #9]
     e7c:	69eb      	ldr	r3, [r5, #28]
     e7e:	6ba2      	ldr	r2, [r4, #56]	; 0x38
     e80:	0020      	movs	r0, r4
     e82:	18d3      	adds	r3, r2, r3
     e84:	63a3      	str	r3, [r4, #56]	; 0x38
     e86:	f7ff ffb1 	bl	dec <usb_stream_packet_handler_complete>
     e8a:	bd70      	pop	{r4, r5, r6, pc}
     e8c:	50100ac8 	.word	0x50100ac8
     e90:	50100ab8 	.word	0x50100ab8

00000e94 <_usb_handle_set_config>:
     e94:	b570      	push	{r4, r5, r6, lr}
     e96:	0004      	movs	r4, r0
     e98:	2601      	movs	r6, #1
     e9a:	4d0a      	ldr	r5, [pc, #40]	; (ec4 <_usb_handle_set_config+0x30>)
     e9c:	7568      	strb	r0, [r5, #21]
     e9e:	4b0a      	ldr	r3, [pc, #40]	; (ec8 <_usb_handle_set_config+0x34>)
     ea0:	00b2      	lsls	r2, r6, #2
     ea2:	58d0      	ldr	r0, [r2, r3]
     ea4:	2800      	cmp	r0, #0
     ea6:	d002      	beq.n	eae <_usb_handle_set_config+0x1a>
     ea8:	2101      	movs	r1, #1
     eaa:	f7ff fd7f 	bl	9ac <_usb_reset_endpoint>
     eae:	3601      	adds	r6, #1
     eb0:	2e05      	cmp	r6, #5
     eb2:	d1f4      	bne.n	e9e <_usb_handle_set_config+0xa>
     eb4:	1e60      	subs	r0, r4, #1
     eb6:	4184      	sbcs	r4, r0
     eb8:	686b      	ldr	r3, [r5, #4]
     eba:	0028      	movs	r0, r5
     ebc:	b2e1      	uxtb	r1, r4
     ebe:	4798      	blx	r3
     ec0:	bd70      	pop	{r4, r5, r6, pc}
     ec2:	46c0      	nop			; (mov r8, r8)
     ec4:	501009ec 	.word	0x501009ec
     ec8:	50100a08 	.word	0x50100a08

00000ecc <_usb_handle_bus_reset>:
     ecc:	b510      	push	{r4, lr}
     ece:	2000      	movs	r0, #0
     ed0:	f7ff ffe0 	bl	e94 <_usb_handle_set_config>
     ed4:	2300      	movs	r3, #0
     ed6:	4a05      	ldr	r2, [pc, #20]	; (eec <_usb_handle_bus_reset+0x20>)
     ed8:	7513      	strb	r3, [r2, #20]
     eda:	4a05      	ldr	r2, [pc, #20]	; (ef0 <_usb_handle_bus_reset+0x24>)
     edc:	6013      	str	r3, [r2, #0]
     ede:	2201      	movs	r2, #1
     ee0:	4b04      	ldr	r3, [pc, #16]	; (ef4 <_usb_handle_bus_reset+0x28>)
     ee2:	4252      	negs	r2, r2
     ee4:	659a      	str	r2, [r3, #88]	; 0x58
     ee6:	651a      	str	r2, [r3, #80]	; 0x50
     ee8:	bd10      	pop	{r4, pc}
     eea:	46c0      	nop			; (mov r8, r8)
     eec:	501009ec 	.word	0x501009ec
     ef0:	50110000 	.word	0x50110000
     ef4:	50113000 	.word	0x50113000

00000ef8 <gpio_setup.part.0>:
     ef8:	2220      	movs	r2, #32
     efa:	4b0e      	ldr	r3, [pc, #56]	; (f34 <gpio_setup.part.0+0x3c>)
     efc:	b510      	push	{r4, lr}
     efe:	601a      	str	r2, [r3, #0]
     f00:	4b0d      	ldr	r3, [pc, #52]	; (f38 <gpio_setup.part.0+0x40>)
     f02:	6818      	ldr	r0, [r3, #0]
     f04:	23d0      	movs	r3, #208	; 0xd0
     f06:	061b      	lsls	r3, r3, #24
     f08:	6158      	str	r0, [r3, #20]
     f0a:	6258      	str	r0, [r3, #36]	; 0x24
     f0c:	f7ff fa27 	bl	35e <ctz32>
     f10:	2240      	movs	r2, #64	; 0x40
     f12:	4b0a      	ldr	r3, [pc, #40]	; (f3c <gpio_setup.part.0+0x44>)
     f14:	18c3      	adds	r3, r0, r3
     f16:	009b      	lsls	r3, r3, #2
     f18:	6819      	ldr	r1, [r3, #0]
     f1a:	430a      	orrs	r2, r1
     f1c:	2180      	movs	r1, #128	; 0x80
     f1e:	601a      	str	r2, [r3, #0]
     f20:	681a      	ldr	r2, [r3, #0]
     f22:	438a      	bics	r2, r1
     f24:	601a      	str	r2, [r3, #0]
     f26:	4b06      	ldr	r3, [pc, #24]	; (f40 <gpio_setup.part.0+0x48>)
     f28:	18c0      	adds	r0, r0, r3
     f2a:	2305      	movs	r3, #5
     f2c:	00c0      	lsls	r0, r0, #3
     f2e:	6043      	str	r3, [r0, #4]
     f30:	bd10      	pop	{r4, pc}
     f32:	46c0      	nop			; (mov r8, r8)
     f34:	4000f000 	.word	0x4000f000
     f38:	50100f64 	.word	0x50100f64
     f3c:	10007001 	.word	0x10007001
     f40:	08002800 	.word	0x08002800

00000f44 <memset0>:
     f44:	b510      	push	{r4, lr}
     f46:	000a      	movs	r2, r1
     f48:	2100      	movs	r1, #0
     f4a:	f001 fbc7 	bl	26dc <__memset>
     f4e:	bd10      	pop	{r4, pc}

00000f50 <_msc_reset>:
     f50:	4b11      	ldr	r3, [pc, #68]	; (f98 <_msc_reset+0x48>)
     f52:	b570      	push	{r4, r5, r6, lr}
     f54:	781a      	ldrb	r2, [r3, #0]
     f56:	4c11      	ldr	r4, [pc, #68]	; (f9c <_msc_reset+0x4c>)
     f58:	2a00      	cmp	r2, #0
     f5a:	d107      	bne.n	f6c <_msc_reset+0x1c>
     f5c:	4a10      	ldr	r2, [pc, #64]	; (fa0 <_msc_reset+0x50>)
     f5e:	4911      	ldr	r1, [pc, #68]	; (fa4 <_msc_reset+0x54>)
     f60:	6322      	str	r2, [r4, #48]	; 0x30
     f62:	6011      	str	r1, [r2, #0]
     f64:	4a10      	ldr	r2, [pc, #64]	; (fa8 <_msc_reset+0x58>)
     f66:	6122      	str	r2, [r4, #16]
     f68:	2201      	movs	r2, #1
     f6a:	701a      	strb	r2, [r3, #0]
     f6c:	4d0f      	ldr	r5, [pc, #60]	; (fac <_msc_reset+0x5c>)
     f6e:	2128      	movs	r1, #40	; 0x28
     f70:	0028      	movs	r0, r5
     f72:	f7ff ffe7 	bl	f44 <memset0>
     f76:	2370      	movs	r3, #112	; 0x70
     f78:	736b      	strb	r3, [r5, #13]
     f7a:	3b66      	subs	r3, #102	; 0x66
     f7c:	752b      	strb	r3, [r5, #20]
     f7e:	2500      	movs	r5, #0
     f80:	4b0b      	ldr	r3, [pc, #44]	; (fb0 <_msc_reset+0x60>)
     f82:	0029      	movs	r1, r5
     f84:	0020      	movs	r0, r4
     f86:	611d      	str	r5, [r3, #16]
     f88:	f7ff fd10 	bl	9ac <_usb_reset_endpoint>
     f8c:	0020      	movs	r0, r4
     f8e:	0029      	movs	r1, r5
     f90:	302c      	adds	r0, #44	; 0x2c
     f92:	f7ff fd0b 	bl	9ac <_usb_reset_endpoint>
     f96:	bd70      	pop	{r4, r5, r6, pc}
     f98:	50100e20 	.word	0x50100e20
     f9c:	50100dc0 	.word	0x50100dc0
     fa0:	50100a38 	.word	0x50100a38
     fa4:	00003dda 	.word	0x00003dda
     fa8:	0000144d 	.word	0x0000144d
     fac:	50100a7c 	.word	0x50100a7c
     fb0:	50100d3c 	.word	0x50100d3c

00000fb4 <msc_setup_request_handler>:
     fb4:	2260      	movs	r2, #96	; 0x60
     fb6:	780b      	ldrb	r3, [r1, #0]
     fb8:	b510      	push	{r4, lr}
     fba:	401a      	ands	r2, r3
     fbc:	2400      	movs	r4, #0
     fbe:	2a20      	cmp	r2, #32
     fc0:	d114      	bne.n	fec <msc_setup_request_handler+0x38>
     fc2:	b25b      	sxtb	r3, r3
     fc4:	784a      	ldrb	r2, [r1, #1]
     fc6:	42a3      	cmp	r3, r4
     fc8:	da12      	bge.n	ff0 <msc_setup_request_handler+0x3c>
     fca:	2afe      	cmp	r2, #254	; 0xfe
     fcc:	d10e      	bne.n	fec <msc_setup_request_handler+0x38>
     fce:	884b      	ldrh	r3, [r1, #2]
     fd0:	42a3      	cmp	r3, r4
     fd2:	d10b      	bne.n	fec <msc_setup_request_handler+0x38>
     fd4:	88cb      	ldrh	r3, [r1, #6]
     fd6:	42a3      	cmp	r3, r4
     fd8:	d008      	beq.n	fec <msc_setup_request_handler+0x38>
     fda:	4813      	ldr	r0, [pc, #76]	; (1028 <msc_setup_request_handler+0x74>)
     fdc:	f7ff fade 	bl	59c <usb_current_packet_buffer>
     fe0:	6803      	ldr	r3, [r0, #0]
     fe2:	701c      	strb	r4, [r3, #0]
     fe4:	3401      	adds	r4, #1
     fe6:	7104      	strb	r4, [r0, #4]
     fe8:	f7ff fbc4 	bl	774 <usb_start_single_buffer_control_in_transfer>
     fec:	0020      	movs	r0, r4
     fee:	bd10      	pop	{r4, pc}
     ff0:	2aff      	cmp	r2, #255	; 0xff
     ff2:	d1fb      	bne.n	fec <msc_setup_request_handler+0x38>
     ff4:	884b      	ldrh	r3, [r1, #2]
     ff6:	2b00      	cmp	r3, #0
     ff8:	d1f8      	bne.n	fec <msc_setup_request_handler+0x38>
     ffa:	88ca      	ldrh	r2, [r1, #6]
     ffc:	001c      	movs	r4, r3
     ffe:	2a00      	cmp	r2, #0
    1000:	d1f4      	bne.n	fec <msc_setup_request_handler+0x38>
    1002:	4b0a      	ldr	r3, [pc, #40]	; (102c <msc_setup_request_handler+0x78>)
    1004:	1dda      	adds	r2, r3, #7
    1006:	7fd1      	ldrb	r1, [r2, #31]
    1008:	2903      	cmp	r1, #3
    100a:	d101      	bne.n	1010 <msc_setup_request_handler+0x5c>
    100c:	3901      	subs	r1, #1
    100e:	77d1      	strb	r1, [r2, #31]
    1010:	3352      	adds	r3, #82	; 0x52
    1012:	781a      	ldrb	r2, [r3, #0]
    1014:	2a03      	cmp	r2, #3
    1016:	d101      	bne.n	101c <msc_setup_request_handler+0x68>
    1018:	3a01      	subs	r2, #1
    101a:	701a      	strb	r2, [r3, #0]
    101c:	f7ff ff98 	bl	f50 <_msc_reset>
    1020:	2401      	movs	r4, #1
    1022:	f7ff fb8f 	bl	744 <usb_start_empty_control_in_transfer_null_completion>
    1026:	e7e1      	b.n	fec <msc_setup_request_handler+0x38>
    1028:	50100f68 	.word	0x50100f68
    102c:	50100dc0 	.word	0x50100dc0

00001030 <vd_read_block>:
    1030:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    1032:	000d      	movs	r5, r1
    1034:	2180      	movs	r1, #128	; 0x80
    1036:	0010      	movs	r0, r2
    1038:	0089      	lsls	r1, r1, #2
    103a:	0014      	movs	r4, r2
    103c:	f7ff ff82 	bl	f44 <memset0>
    1040:	2d00      	cmp	r5, #0
    1042:	d120      	bne.n	1086 <vd_read_block+0x56>
    1044:	0020      	movs	r0, r4
    1046:	30c3      	adds	r0, #195	; 0xc3
    1048:	220b      	movs	r2, #11
    104a:	494f      	ldr	r1, [pc, #316]	; (1188 <vd_read_block+0x158>)
    104c:	30ff      	adds	r0, #255	; 0xff
    104e:	f001 faf7 	bl	2640 <__memcpy>
    1052:	23ff      	movs	r3, #255	; 0xff
    1054:	2255      	movs	r2, #85	; 0x55
    1056:	005b      	lsls	r3, r3, #1
    1058:	54e2      	strb	r2, [r4, r3]
    105a:	4b4c      	ldr	r3, [pc, #304]	; (118c <vd_read_block+0x15c>)
    105c:	1892      	adds	r2, r2, r2
    105e:	54e2      	strb	r2, [r4, r3]
    1060:	4b4b      	ldr	r3, [pc, #300]	; (1190 <vd_read_block+0x160>)
    1062:	791a      	ldrb	r2, [r3, #4]
    1064:	2a00      	cmp	r2, #0
    1066:	d104      	bne.n	1072 <vd_read_block+0x42>
    1068:	4a4a      	ldr	r2, [pc, #296]	; (1194 <vd_read_block+0x164>)
    106a:	6a92      	ldr	r2, [r2, #40]	; 0x28
    106c:	601a      	str	r2, [r3, #0]
    106e:	2201      	movs	r2, #1
    1070:	711a      	strb	r2, [r3, #4]
    1072:	0020      	movs	r0, r4
    1074:	681b      	ldr	r3, [r3, #0]
    1076:	30b9      	adds	r0, #185	; 0xb9
    1078:	9301      	str	r3, [sp, #4]
    107a:	30ff      	adds	r0, #255	; 0xff
    107c:	2204      	movs	r2, #4
    107e:	a901      	add	r1, sp, #4
    1080:	f001 fade 	bl	2640 <__memcpy>
    1084:	e023      	b.n	10ce <vd_read_block+0x9e>
    1086:	2d01      	cmp	r5, #1
    1088:	d111      	bne.n	10ae <vd_read_block+0x7e>
    108a:	4b41      	ldr	r3, [pc, #260]	; (1190 <vd_read_block+0x160>)
    108c:	791a      	ldrb	r2, [r3, #4]
    108e:	2a00      	cmp	r2, #0
    1090:	d103      	bne.n	109a <vd_read_block+0x6a>
    1092:	4a40      	ldr	r2, [pc, #256]	; (1194 <vd_read_block+0x164>)
    1094:	6a92      	ldr	r2, [r2, #40]	; 0x28
    1096:	711d      	strb	r5, [r3, #4]
    1098:	601a      	str	r2, [r3, #0]
    109a:	681b      	ldr	r3, [r3, #0]
    109c:	2240      	movs	r2, #64	; 0x40
    109e:	0020      	movs	r0, r4
    10a0:	493d      	ldr	r1, [pc, #244]	; (1198 <vd_read_block+0x168>)
    10a2:	9301      	str	r3, [sp, #4]
    10a4:	f001 facc 	bl	2640 <__memcpy>
    10a8:	0020      	movs	r0, r4
    10aa:	3027      	adds	r0, #39	; 0x27
    10ac:	e7e6      	b.n	107c <vd_read_block+0x4c>
    10ae:	2281      	movs	r2, #129	; 0x81
    10b0:	1eab      	subs	r3, r5, #2
    10b2:	0052      	lsls	r2, r2, #1
    10b4:	4293      	cmp	r3, r2
    10b6:	d20c      	bcs.n	10d2 <vd_read_block+0xa2>
    10b8:	2b80      	cmp	r3, #128	; 0x80
    10ba:	d900      	bls.n	10be <vd_read_block+0x8e>
    10bc:	3b81      	subs	r3, #129	; 0x81
    10be:	2b00      	cmp	r3, #0
    10c0:	d105      	bne.n	10ce <vd_read_block+0x9e>
    10c2:	3b08      	subs	r3, #8
    10c4:	8023      	strh	r3, [r4, #0]
    10c6:	3307      	adds	r3, #7
    10c8:	8063      	strh	r3, [r4, #2]
    10ca:	80a3      	strh	r3, [r4, #4]
    10cc:	80e3      	strh	r3, [r4, #6]
    10ce:	2000      	movs	r0, #0
    10d0:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
    10d2:	1f6b      	subs	r3, r5, #5
    10d4:	3bff      	subs	r3, #255	; 0xff
    10d6:	2b1f      	cmp	r3, #31
    10d8:	d839      	bhi.n	114e <vd_read_block+0x11e>
    10da:	2b00      	cmp	r3, #0
    10dc:	d1f7      	bne.n	10ce <vd_read_block+0x9e>
    10de:	492e      	ldr	r1, [pc, #184]	; (1198 <vd_read_block+0x168>)
    10e0:	220b      	movs	r2, #11
    10e2:	312b      	adds	r1, #43	; 0x2b
    10e4:	0020      	movs	r0, r4
    10e6:	f001 faab 	bl	2640 <__memcpy>
    10ea:	2328      	movs	r3, #40	; 0x28
    10ec:	72e3      	strb	r3, [r4, #11]
    10ee:	0023      	movs	r3, r4
    10f0:	2264      	movs	r2, #100	; 0x64
    10f2:	0020      	movs	r0, r4
    10f4:	4e29      	ldr	r6, [pc, #164]	; (119c <vd_read_block+0x16c>)
    10f6:	4d2a      	ldr	r5, [pc, #168]	; (11a0 <vd_read_block+0x170>)
    10f8:	332d      	adds	r3, #45	; 0x2d
    10fa:	701a      	strb	r2, [r3, #0]
    10fc:	4929      	ldr	r1, [pc, #164]	; (11a4 <vd_read_block+0x174>)
    10fe:	3a59      	subs	r2, #89	; 0x59
    1100:	85e6      	strh	r6, [r4, #46]	; 0x2e
    1102:	8625      	strh	r5, [r4, #48]	; 0x30
    1104:	86e6      	strh	r6, [r4, #54]	; 0x36
    1106:	8725      	strh	r5, [r4, #56]	; 0x38
    1108:	3020      	adds	r0, #32
    110a:	f001 fa99 	bl	2640 <__memcpy>
    110e:	0023      	movs	r3, r4
    1110:	2121      	movs	r1, #33	; 0x21
    1112:	332b      	adds	r3, #43	; 0x2b
    1114:	7019      	strb	r1, [r3, #0]
    1116:	2302      	movs	r3, #2
    1118:	8763      	strh	r3, [r4, #58]	; 0x3a
    111a:	33ef      	adds	r3, #239	; 0xef
    111c:	63e3      	str	r3, [r4, #60]	; 0x3c
    111e:	0027      	movs	r7, r4
    1120:	0023      	movs	r3, r4
    1122:	2264      	movs	r2, #100	; 0x64
    1124:	334e      	adds	r3, #78	; 0x4e
    1126:	3740      	adds	r7, #64	; 0x40
    1128:	737a      	strb	r2, [r7, #13]
    112a:	491f      	ldr	r1, [pc, #124]	; (11a8 <vd_read_block+0x178>)
    112c:	801e      	strh	r6, [r3, #0]
    112e:	805d      	strh	r5, [r3, #2]
    1130:	811e      	strh	r6, [r3, #8]
    1132:	815d      	strh	r5, [r3, #10]
    1134:	3a59      	subs	r2, #89	; 0x59
    1136:	0038      	movs	r0, r7
    1138:	f001 fa82 	bl	2640 <__memcpy>
    113c:	0023      	movs	r3, r4
    113e:	2121      	movs	r1, #33	; 0x21
    1140:	2203      	movs	r2, #3
    1142:	335a      	adds	r3, #90	; 0x5a
    1144:	72f9      	strb	r1, [r7, #11]
    1146:	801a      	strh	r2, [r3, #0]
    1148:	233e      	movs	r3, #62	; 0x3e
    114a:	65e3      	str	r3, [r4, #92]	; 0x5c
    114c:	e7bf      	b.n	10ce <vd_read_block+0x9e>
    114e:	3d25      	subs	r5, #37	; 0x25
    1150:	3dff      	subs	r5, #255	; 0xff
    1152:	076b      	lsls	r3, r5, #29
    1154:	d1bb      	bne.n	10ce <vd_read_block+0x9e>
    1156:	08ed      	lsrs	r5, r5, #3
    1158:	d110      	bne.n	117c <vd_read_block+0x14c>
    115a:	0022      	movs	r2, r4
    115c:	219f      	movs	r1, #159	; 0x9f
    115e:	4813      	ldr	r0, [pc, #76]	; (11ac <vd_read_block+0x17c>)
    1160:	f001 fa4f 	bl	2602 <poor_mans_text_decompress>
    1164:	0020      	movs	r0, r4
    1166:	4d12      	ldr	r5, [pc, #72]	; (11b0 <vd_read_block+0x180>)
    1168:	220c      	movs	r2, #12
    116a:	0029      	movs	r1, r5
    116c:	3062      	adds	r0, #98	; 0x62
    116e:	f001 fa67 	bl	2640 <__memcpy>
    1172:	0020      	movs	r0, r4
    1174:	220c      	movs	r2, #12
    1176:	0029      	movs	r1, r5
    1178:	30c2      	adds	r0, #194	; 0xc2
    117a:	e781      	b.n	1080 <vd_read_block+0x50>
    117c:	2d01      	cmp	r5, #1
    117e:	d1a6      	bne.n	10ce <vd_read_block+0x9e>
    1180:	223e      	movs	r2, #62	; 0x3e
    1182:	0020      	movs	r0, r4
    1184:	490b      	ldr	r1, [pc, #44]	; (11b4 <vd_read_block+0x184>)
    1186:	e77b      	b.n	1080 <vd_read_block+0x50>
    1188:	00003df8 	.word	0x00003df8
    118c:	000001ff 	.word	0x000001ff
    1190:	50100db4 	.word	0x50100db4
    1194:	40054000 	.word	0x40054000
    1198:	00003e6c 	.word	0x00003e6c
    119c:	ffff8299 	.word	0xffff8299
    11a0:	00003925 	.word	0x00003925
    11a4:	00003dac 	.word	0x00003dac
    11a8:	00003db8 	.word	0x00003db8
    11ac:	00003ffa 	.word	0x00003ffa
    11b0:	50100eb5 	.word	0x50100eb5
    11b4:	00003ef4 	.word	0x00003ef4

000011b8 <vd_write_block>:
    11b8:	b5f0      	push	{r4, r5, r6, r7, lr}
    11ba:	4b85      	ldr	r3, [pc, #532]	; (13d0 <vd_write_block+0x218>)
    11bc:	0016      	movs	r6, r2
    11be:	6812      	ldr	r2, [r2, #0]
    11c0:	b085      	sub	sp, #20
    11c2:	9003      	str	r0, [sp, #12]
    11c4:	429a      	cmp	r2, r3
    11c6:	d002      	beq.n	11ce <vd_write_block+0x16>
    11c8:	2000      	movs	r0, #0
    11ca:	b005      	add	sp, #20
    11cc:	bdf0      	pop	{r4, r5, r6, r7, pc}
    11ce:	4b81      	ldr	r3, [pc, #516]	; (13d4 <vd_write_block+0x21c>)
    11d0:	6872      	ldr	r2, [r6, #4]
    11d2:	429a      	cmp	r2, r3
    11d4:	d1f8      	bne.n	11c8 <vd_write_block+0x10>
    11d6:	22fe      	movs	r2, #254	; 0xfe
    11d8:	0052      	lsls	r2, r2, #1
    11da:	4b7f      	ldr	r3, [pc, #508]	; (13d8 <vd_write_block+0x220>)
    11dc:	58b2      	ldr	r2, [r6, r2]
    11de:	429a      	cmp	r2, r3
    11e0:	d1f2      	bne.n	11c8 <vd_write_block+0x10>
    11e2:	68b3      	ldr	r3, [r6, #8]
    11e4:	049a      	lsls	r2, r3, #18
    11e6:	d5ef      	bpl.n	11c8 <vd_write_block+0x10>
    11e8:	4a7c      	ldr	r2, [pc, #496]	; (13dc <vd_write_block+0x224>)
    11ea:	69f1      	ldr	r1, [r6, #28]
    11ec:	4291      	cmp	r1, r2
    11ee:	d1eb      	bne.n	11c8 <vd_write_block+0x10>
    11f0:	2201      	movs	r2, #1
    11f2:	001d      	movs	r5, r3
    11f4:	4015      	ands	r5, r2
    11f6:	4213      	tst	r3, r2
    11f8:	d1e6      	bne.n	11c8 <vd_write_block+0x10>
    11fa:	2380      	movs	r3, #128	; 0x80
    11fc:	6932      	ldr	r2, [r6, #16]
    11fe:	005b      	lsls	r3, r3, #1
    1200:	429a      	cmp	r2, r3
    1202:	d1e1      	bne.n	11c8 <vd_write_block+0x10>
    1204:	68f7      	ldr	r7, [r6, #12]
    1206:	0038      	movs	r0, r7
    1208:	f7ff fc62 	bl	ad0 <is_address_ram.lto_priv.0>
    120c:	2800      	cmp	r0, #0
    120e:	d004      	beq.n	121a <vd_write_block+0x62>
    1210:	0038      	movs	r0, r7
    1212:	30ff      	adds	r0, #255	; 0xff
    1214:	f7ff fc5c 	bl	ad0 <is_address_ram.lto_priv.0>
    1218:	0005      	movs	r5, r0
    121a:	69b3      	ldr	r3, [r6, #24]
    121c:	4c70      	ldr	r4, [pc, #448]	; (13e0 <vd_write_block+0x228>)
    121e:	2b00      	cmp	r3, #0
    1220:	d009      	beq.n	1236 <vd_write_block+0x7e>
    1222:	22f0      	movs	r2, #240	; 0xf0
    1224:	0612      	lsls	r2, r2, #24
    1226:	18ba      	adds	r2, r7, r2
    1228:	9201      	str	r2, [sp, #4]
    122a:	2d00      	cmp	r5, #0
    122c:	d106      	bne.n	123c <vd_write_block+0x84>
    122e:	0011      	movs	r1, r2
    1230:	4a6c      	ldr	r2, [pc, #432]	; (13e4 <vd_write_block+0x22c>)
    1232:	4291      	cmp	r1, r2
    1234:	d907      	bls.n	1246 <vd_write_block+0x8e>
    1236:	2000      	movs	r0, #0
    1238:	6120      	str	r0, [r4, #16]
    123a:	e7c6      	b.n	11ca <vd_write_block+0x12>
    123c:	9a01      	ldr	r2, [sp, #4]
    123e:	0011      	movs	r1, r2
    1240:	4a68      	ldr	r2, [pc, #416]	; (13e4 <vd_write_block+0x22c>)
    1242:	4291      	cmp	r1, r2
    1244:	d802      	bhi.n	124c <vd_write_block+0x94>
    1246:	b2ff      	uxtb	r7, r7
    1248:	2f00      	cmp	r7, #0
    124a:	d1f4      	bne.n	1236 <vd_write_block+0x7e>
    124c:	4a66      	ldr	r2, [pc, #408]	; (13e8 <vd_write_block+0x230>)
    124e:	3229      	adds	r2, #41	; 0x29
    1250:	7812      	ldrb	r2, [r2, #0]
    1252:	2a00      	cmp	r2, #0
    1254:	d1ef      	bne.n	1236 <vd_write_block+0x7e>
    1256:	3201      	adds	r2, #1
    1258:	402a      	ands	r2, r5
    125a:	9202      	str	r2, [sp, #8]
    125c:	6922      	ldr	r2, [r4, #16]
    125e:	2708      	movs	r7, #8
    1260:	4293      	cmp	r3, r2
    1262:	d035      	beq.n	12d0 <vd_write_block+0x118>
    1264:	0020      	movs	r0, r4
    1266:	2150      	movs	r1, #80	; 0x50
    1268:	f7ff fe6c 	bl	f44 <memset0>
    126c:	0023      	movs	r3, r4
    126e:	9a02      	ldr	r2, [sp, #8]
    1270:	334c      	adds	r3, #76	; 0x4c
    1272:	485e      	ldr	r0, [pc, #376]	; (13ec <vd_write_block+0x234>)
    1274:	701a      	strb	r2, [r3, #0]
    1276:	2d00      	cmp	r5, #0
    1278:	d101      	bne.n	127e <vd_write_block+0xc6>
    127a:	20a8      	movs	r0, #168	; 0xa8
    127c:	0540      	lsls	r0, r0, #21
    127e:	4269      	negs	r1, r5
    1280:	4169      	adcs	r1, r5
    1282:	23a0      	movs	r3, #160	; 0xa0
    1284:	4d5a      	ldr	r5, [pc, #360]	; (13f0 <vd_write_block+0x238>)
    1286:	4249      	negs	r1, r1
    1288:	00db      	lsls	r3, r3, #3
    128a:	4029      	ands	r1, r5
    128c:	18c9      	adds	r1, r1, r3
    128e:	6061      	str	r1, [r4, #4]
    1290:	08c9      	lsrs	r1, r1, #3
    1292:	6020      	str	r0, [r4, #0]
    1294:	f7ff fe56 	bl	f44 <memset0>
    1298:	9b01      	ldr	r3, [sp, #4]
    129a:	001a      	movs	r2, r3
    129c:	4b51      	ldr	r3, [pc, #324]	; (13e4 <vd_write_block+0x22c>)
    129e:	429a      	cmp	r2, r3
    12a0:	d806      	bhi.n	12b0 <vd_write_block+0xf8>
    12a2:	4854      	ldr	r0, [pc, #336]	; (13f4 <vd_write_block+0x23c>)
    12a4:	4b54      	ldr	r3, [pc, #336]	; (13f8 <vd_write_block+0x240>)
    12a6:	4955      	ldr	r1, [pc, #340]	; (13fc <vd_write_block+0x244>)
    12a8:	60a0      	str	r0, [r4, #8]
    12aa:	60e3      	str	r3, [r4, #12]
    12ac:	f7ff fe4a 	bl	f44 <memset0>
    12b0:	69b3      	ldr	r3, [r6, #24]
    12b2:	6862      	ldr	r2, [r4, #4]
    12b4:	4293      	cmp	r3, r2
    12b6:	d900      	bls.n	12ba <vd_write_block+0x102>
    12b8:	e786      	b.n	11c8 <vd_write_block+0x10>
    12ba:	6123      	str	r3, [r4, #16]
    12bc:	2301      	movs	r3, #1
    12be:	2700      	movs	r7, #0
    12c0:	425b      	negs	r3, r3
    12c2:	9a01      	ldr	r2, [sp, #4]
    12c4:	61e3      	str	r3, [r4, #28]
    12c6:	4b47      	ldr	r3, [pc, #284]	; (13e4 <vd_write_block+0x22c>)
    12c8:	61a7      	str	r7, [r4, #24]
    12ca:	4293      	cmp	r3, r2
    12cc:	417f      	adcs	r7, r7
    12ce:	3708      	adds	r7, #8
    12d0:	0023      	movs	r3, r4
    12d2:	334c      	adds	r3, #76	; 0x4c
    12d4:	781b      	ldrb	r3, [r3, #0]
    12d6:	9a02      	ldr	r2, [sp, #8]
    12d8:	4293      	cmp	r3, r2
    12da:	d1ac      	bne.n	1236 <vd_write_block+0x7e>
    12dc:	6973      	ldr	r3, [r6, #20]
    12de:	69b2      	ldr	r2, [r6, #24]
    12e0:	4293      	cmp	r3, r2
    12e2:	d2a8      	bcs.n	1236 <vd_write_block+0x7e>
    12e4:	0020      	movs	r0, r4
    12e6:	2128      	movs	r1, #40	; 0x28
    12e8:	3024      	adds	r0, #36	; 0x24
    12ea:	f7ff fe2b 	bl	f44 <memset0>
    12ee:	0022      	movs	r2, r4
    12f0:	9b03      	ldr	r3, [sp, #12]
    12f2:	3248      	adds	r2, #72	; 0x48
    12f4:	6971      	ldr	r1, [r6, #20]
    12f6:	6263      	str	r3, [r4, #36]	; 0x24
    12f8:	6163      	str	r3, [r4, #20]
    12fa:	68f3      	ldr	r3, [r6, #12]
    12fc:	7017      	strb	r7, [r2, #0]
    12fe:	4a40      	ldr	r2, [pc, #256]	; (1400 <vd_write_block+0x248>)
    1300:	2001      	movs	r0, #1
    1302:	4694      	mov	ip, r2
    1304:	62e2      	str	r2, [r4, #44]	; 0x2c
    1306:	2280      	movs	r2, #128	; 0x80
    1308:	0052      	lsls	r2, r2, #1
    130a:	6422      	str	r2, [r4, #64]	; 0x40
    130c:	0022      	movs	r2, r4
    130e:	324a      	adds	r2, #74	; 0x4a
    1310:	7010      	strb	r0, [r2, #0]
    1312:	221f      	movs	r2, #31
    1314:	400a      	ands	r2, r1
    1316:	4090      	lsls	r0, r2
    1318:	6825      	ldr	r5, [r4, #0]
    131a:	094a      	lsrs	r2, r1, #5
    131c:	0092      	lsls	r2, r2, #2
    131e:	6221      	str	r1, [r4, #32]
    1320:	6323      	str	r3, [r4, #48]	; 0x30
    1322:	18aa      	adds	r2, r5, r2
    1324:	6815      	ldr	r5, [r2, #0]
    1326:	3620      	adds	r6, #32
    1328:	63e6      	str	r6, [r4, #60]	; 0x3c
    132a:	9001      	str	r0, [sp, #4]
    132c:	4205      	tst	r5, r0
    132e:	d000      	beq.n	1332 <vd_write_block+0x17a>
    1330:	e74a      	b.n	11c8 <vd_write_block+0x10>
    1332:	2580      	movs	r5, #128	; 0x80
    1334:	69e6      	ldr	r6, [r4, #28]
    1336:	05ad      	lsls	r5, r5, #22
    1338:	42b3      	cmp	r3, r6
    133a:	d20b      	bcs.n	1354 <vd_write_block+0x19c>
    133c:	42ab      	cmp	r3, r5
    133e:	41bf      	sbcs	r7, r7
    1340:	427f      	negs	r7, r7
    1342:	0038      	movs	r0, r7
    1344:	42ae      	cmp	r6, r5
    1346:	41bf      	sbcs	r7, r7
    1348:	427f      	negs	r7, r7
    134a:	9702      	str	r7, [sp, #8]
    134c:	0007      	movs	r7, r0
    134e:	9802      	ldr	r0, [sp, #8]
    1350:	4287      	cmp	r7, r0
    1352:	d003      	beq.n	135c <vd_write_block+0x1a4>
    1354:	42ae      	cmp	r6, r5
    1356:	d202      	bcs.n	135e <vd_write_block+0x1a6>
    1358:	42ab      	cmp	r3, r5
    135a:	d300      	bcc.n	135e <vd_write_block+0x1a6>
    135c:	61e3      	str	r3, [r4, #28]
    135e:	0025      	movs	r5, r4
    1360:	354c      	adds	r5, #76	; 0x4c
    1362:	782d      	ldrb	r5, [r5, #0]
    1364:	2d00      	cmp	r5, #0
    1366:	d11a      	bne.n	139e <vd_write_block+0x1e6>
    1368:	020e      	lsls	r6, r1, #8
    136a:	05c9      	lsls	r1, r1, #23
    136c:	0ec9      	lsrs	r1, r1, #27
    136e:	3501      	adds	r5, #1
    1370:	408d      	lsls	r5, r1
    1372:	0c71      	lsrs	r1, r6, #17
    1374:	68a6      	ldr	r6, [r4, #8]
    1376:	0089      	lsls	r1, r1, #2
    1378:	1871      	adds	r1, r6, r1
    137a:	680e      	ldr	r6, [r1, #0]
    137c:	422e      	tst	r6, r5
    137e:	d10e      	bne.n	139e <vd_write_block+0x1e6>
    1380:	0b1b      	lsrs	r3, r3, #12
    1382:	031b      	lsls	r3, r3, #12
    1384:	6363      	str	r3, [r4, #52]	; 0x34
    1386:	2380      	movs	r3, #128	; 0x80
    1388:	015b      	lsls	r3, r3, #5
    138a:	63a3      	str	r3, [r4, #56]	; 0x38
    138c:	680b      	ldr	r3, [r1, #0]
    138e:	431d      	orrs	r5, r3
    1390:	600d      	str	r5, [r1, #0]
    1392:	0021      	movs	r1, r4
    1394:	2302      	movs	r3, #2
    1396:	3148      	adds	r1, #72	; 0x48
    1398:	780d      	ldrb	r5, [r1, #0]
    139a:	432b      	orrs	r3, r5
    139c:	700b      	strb	r3, [r1, #0]
    139e:	69a3      	ldr	r3, [r4, #24]
    13a0:	9801      	ldr	r0, [sp, #4]
    13a2:	3301      	adds	r3, #1
    13a4:	61a3      	str	r3, [r4, #24]
    13a6:	6813      	ldr	r3, [r2, #0]
    13a8:	0021      	movs	r1, r4
    13aa:	4318      	orrs	r0, r3
    13ac:	4663      	mov	r3, ip
    13ae:	4d0e      	ldr	r5, [pc, #56]	; (13e8 <vd_write_block+0x230>)
    13b0:	6010      	str	r0, [r2, #0]
    13b2:	3528      	adds	r5, #40	; 0x28
    13b4:	62e3      	str	r3, [r4, #44]	; 0x2c
    13b6:	2228      	movs	r2, #40	; 0x28
    13b8:	3124      	adds	r1, #36	; 0x24
    13ba:	480b      	ldr	r0, [pc, #44]	; (13e8 <vd_write_block+0x230>)
    13bc:	782b      	ldrb	r3, [r5, #0]
    13be:	f001 f93f 	bl	2640 <__memcpy>
    13c2:	2001      	movs	r0, #1
    13c4:	7028      	strb	r0, [r5, #0]
    13c6:	bf40      	sev
    13c8:	344b      	adds	r4, #75	; 0x4b
    13ca:	7020      	strb	r0, [r4, #0]
    13cc:	e6fd      	b.n	11ca <vd_write_block+0x12>
    13ce:	46c0      	nop			; (mov r8, r8)
    13d0:	0a324655 	.word	0x0a324655
    13d4:	9e5d5157 	.word	0x9e5d5157
    13d8:	0ab16f30 	.word	0x0ab16f30
    13dc:	e48bff56 	.word	0xe48bff56
    13e0:	50100d3c 	.word	0x50100d3c
    13e4:	0fffff01 	.word	0x0fffff01
    13e8:	50100fc0 	.word	0x50100fc0
    13ec:	50100ec4 	.word	0x50100ec4
    13f0:	0001dce0 	.word	0x0001dce0
    13f4:	15003c3c 	.word	0x15003c3c
    13f8:	00001e1e 	.word	0x00001e1e
    13fc:	000003c3 	.word	0x000003c3
    1400:	00001631 	.word	0x00001631

00001404 <usb_get_single_packet_response_buffer>:
    1404:	b570      	push	{r4, r5, r6, lr}
    1406:	000d      	movs	r5, r1
    1408:	f7ff f8c8 	bl	59c <usb_current_packet_buffer>
    140c:	0004      	movs	r4, r0
    140e:	0029      	movs	r1, r5
    1410:	6800      	ldr	r0, [r0, #0]
    1412:	f7ff fd97 	bl	f44 <memset0>
    1416:	6820      	ldr	r0, [r4, #0]
    1418:	7125      	strb	r5, [r4, #4]
    141a:	bd70      	pop	{r4, r5, r6, pc}

0000141c <_msc_send_csw>:
    141c:	2200      	movs	r2, #0
    141e:	b510      	push	{r4, lr}
    1420:	4c07      	ldr	r4, [pc, #28]	; (1440 <_msc_send_csw+0x24>)
    1422:	210d      	movs	r1, #13
    1424:	1da3      	adds	r3, r4, #6
    1426:	4807      	ldr	r0, [pc, #28]	; (1444 <_msc_send_csw+0x28>)
    1428:	77da      	strb	r2, [r3, #31]
    142a:	f7ff ffeb 	bl	1404 <usb_get_single_packet_response_buffer>
    142e:	220d      	movs	r2, #13
    1430:	0021      	movs	r1, r4
    1432:	f001 f905 	bl	2640 <__memcpy>
    1436:	4804      	ldr	r0, [pc, #16]	; (1448 <_msc_send_csw+0x2c>)
    1438:	f7ff f94c 	bl	6d4 <_msc_reset_and_start_cmd_response_transfer>
    143c:	bd10      	pop	{r4, pc}
    143e:	46c0      	nop			; (mov r8, r8)
    1440:	50100a7c 	.word	0x50100a7c
    1444:	50100dc0 	.word	0x50100dc0
    1448:	00000705 	.word	0x00000705

0000144c <_msc_in_on_stall_change>:
    144c:	b510      	push	{r4, lr}
    144e:	1dc3      	adds	r3, r0, #7
    1450:	7fdb      	ldrb	r3, [r3, #31]
    1452:	2b00      	cmp	r3, #0
    1454:	d109      	bne.n	146a <_msc_in_on_stall_change+0x1e>
    1456:	4b05      	ldr	r3, [pc, #20]	; (146c <_msc_in_on_stall_change+0x20>)
    1458:	4298      	cmp	r0, r3
    145a:	d106      	bne.n	146a <_msc_in_on_stall_change+0x1e>
    145c:	4b04      	ldr	r3, [pc, #16]	; (1470 <_msc_in_on_stall_change+0x24>)
    145e:	3306      	adds	r3, #6
    1460:	7fdb      	ldrb	r3, [r3, #31]
    1462:	2b00      	cmp	r3, #0
    1464:	d001      	beq.n	146a <_msc_in_on_stall_change+0x1e>
    1466:	f7ff ffd9 	bl	141c <_msc_send_csw>
    146a:	bd10      	pop	{r4, pc}
    146c:	50100dc0 	.word	0x50100dc0
    1470:	50100a7c 	.word	0x50100a7c

00001474 <_msc_data_phase_complete>:
    1474:	b510      	push	{r4, lr}
    1476:	4a0c      	ldr	r2, [pc, #48]	; (14a8 <_msc_data_phase_complete+0x34>)
    1478:	1d53      	adds	r3, r2, #5
    147a:	7fd9      	ldrb	r1, [r3, #31]
    147c:	2901      	cmp	r1, #1
    147e:	d107      	bne.n	1490 <_msc_data_phase_complete+0x1c>
    1480:	2380      	movs	r3, #128	; 0x80
    1482:	005b      	lsls	r3, r3, #1
    1484:	4809      	ldr	r0, [pc, #36]	; (14ac <_msc_data_phase_complete+0x38>)
    1486:	8493      	strh	r3, [r2, #36]	; 0x24
    1488:	3101      	adds	r1, #1
    148a:	f7ff f9a7 	bl	7dc <_usb_stall_endpoint>
    148e:	bd10      	pop	{r4, pc}
    1490:	2902      	cmp	r1, #2
    1492:	d105      	bne.n	14a0 <_msc_data_phase_complete+0x2c>
    1494:	2200      	movs	r2, #0
    1496:	4805      	ldr	r0, [pc, #20]	; (14ac <_msc_data_phase_complete+0x38>)
    1498:	77da      	strb	r2, [r3, #31]
    149a:	302c      	adds	r0, #44	; 0x2c
    149c:	f7ff f99e 	bl	7dc <_usb_stall_endpoint>
    14a0:	f7ff ffbc 	bl	141c <_msc_send_csw>
    14a4:	e7f3      	b.n	148e <_msc_data_phase_complete+0x1a>
    14a6:	46c0      	nop			; (mov r8, r8)
    14a8:	50100a7c 	.word	0x50100a7c
    14ac:	50100dc0 	.word	0x50100dc0

000014b0 <_msc_init_for_di_or_do>:
    14b0:	2300      	movs	r3, #0
    14b2:	b570      	push	{r4, r5, r6, lr}
    14b4:	4c11      	ldr	r4, [pc, #68]	; (14fc <_msc_init_for_di_or_do+0x4c>)
    14b6:	1d65      	adds	r5, r4, #5
    14b8:	77eb      	strb	r3, [r5, #31]
    14ba:	6223      	str	r3, [r4, #32]
    14bc:	7b05      	ldrb	r5, [r0, #12]
    14be:	3301      	adds	r3, #1
    14c0:	2d7f      	cmp	r5, #127	; 0x7f
    14c2:	d800      	bhi.n	14c6 <_msc_init_for_di_or_do+0x16>
    14c4:	3301      	adds	r3, #1
    14c6:	429a      	cmp	r2, r3
    14c8:	d007      	beq.n	14da <_msc_init_for_di_or_do+0x2a>
    14ca:	1d62      	adds	r2, r4, #5
    14cc:	77d3      	strb	r3, [r2, #31]
    14ce:	2302      	movs	r3, #2
    14d0:	7323      	strb	r3, [r4, #12]
    14d2:	f7ff ffcf 	bl	1474 <_msc_data_phase_complete>
    14d6:	2000      	movs	r0, #0
    14d8:	e00f      	b.n	14fa <_msc_init_for_di_or_do+0x4a>
    14da:	6883      	ldr	r3, [r0, #8]
    14dc:	428b      	cmp	r3, r1
    14de:	d008      	beq.n	14f2 <_msc_init_for_di_or_do+0x42>
    14e0:	1d60      	adds	r0, r4, #5
    14e2:	77c2      	strb	r2, [r0, #31]
    14e4:	428b      	cmp	r3, r1
    14e6:	d201      	bcs.n	14ec <_msc_init_for_di_or_do+0x3c>
    14e8:	2202      	movs	r2, #2
    14ea:	7322      	strb	r2, [r4, #12]
    14ec:	428b      	cmp	r3, r1
    14ee:	d900      	bls.n	14f2 <_msc_init_for_di_or_do+0x42>
    14f0:	000b      	movs	r3, r1
    14f2:	2001      	movs	r0, #1
    14f4:	6223      	str	r3, [r4, #32]
    14f6:	2b00      	cmp	r3, #0
    14f8:	d0eb      	beq.n	14d2 <_msc_init_for_di_or_do+0x22>
    14fa:	bd70      	pop	{r4, r5, r6, pc}
    14fc:	50100a7c 	.word	0x50100a7c

00001500 <_scsi_handle_read_or_write_command>:
    1500:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    1502:	7c82      	ldrb	r2, [r0, #18]
    1504:	7c43      	ldrb	r3, [r0, #17]
    1506:	0212      	lsls	r2, r2, #8
    1508:	431a      	orrs	r2, r3
    150a:	7cc3      	ldrb	r3, [r0, #19]
    150c:	000f      	movs	r7, r1
    150e:	041b      	lsls	r3, r3, #16
    1510:	431a      	orrs	r2, r3
    1512:	7d03      	ldrb	r3, [r0, #20]
    1514:	7dc1      	ldrb	r1, [r0, #23]
    1516:	061b      	lsls	r3, r3, #24
    1518:	4313      	orrs	r3, r2
    151a:	7d82      	ldrb	r2, [r0, #22]
    151c:	0209      	lsls	r1, r1, #8
    151e:	4311      	orrs	r1, r2
    1520:	4e20      	ldr	r6, [pc, #128]	; (15a4 <_scsi_handle_read_or_write_command+0xa4>)
    1522:	ba49      	rev16	r1, r1
    1524:	0032      	movs	r2, r6
    1526:	ba1b      	rev	r3, r3
    1528:	b289      	uxth	r1, r1
    152a:	2f01      	cmp	r7, #1
    152c:	d000      	beq.n	1530 <_scsi_handle_read_or_write_command+0x30>
    152e:	322c      	adds	r2, #44	; 0x2c
    1530:	4c1d      	ldr	r4, [pc, #116]	; (15a8 <_scsi_handle_read_or_write_command+0xa8>)
    1532:	0249      	lsls	r1, r1, #9
    1534:	6262      	str	r2, [r4, #36]	; 0x24
    1536:	003a      	movs	r2, r7
    1538:	62e3      	str	r3, [r4, #44]	; 0x2c
    153a:	f7ff ffb9 	bl	14b0 <_msc_init_for_di_or_do>
    153e:	2800      	cmp	r0, #0
    1540:	d029      	beq.n	1596 <_scsi_handle_read_or_write_command+0x96>
    1542:	4b1a      	ldr	r3, [pc, #104]	; (15ac <_scsi_handle_read_or_write_command+0xac>)
    1544:	6a1d      	ldr	r5, [r3, #32]
    1546:	2d3f      	cmp	r5, #63	; 0x3f
    1548:	d928      	bls.n	159c <_scsi_handle_read_or_write_command+0x9c>
    154a:	4a19      	ldr	r2, [pc, #100]	; (15b0 <_scsi_handle_read_or_write_command+0xb0>)
    154c:	0020      	movs	r0, r4
    154e:	6813      	ldr	r3, [r2, #0]
    1550:	4918      	ldr	r1, [pc, #96]	; (15b4 <_scsi_handle_read_or_write_command+0xb4>)
    1552:	3301      	adds	r3, #1
    1554:	6013      	str	r3, [r2, #0]
    1556:	233f      	movs	r3, #63	; 0x3f
    1558:	439d      	bics	r5, r3
    155a:	4b17      	ldr	r3, [pc, #92]	; (15b8 <_scsi_handle_read_or_write_command+0xb8>)
    155c:	61a5      	str	r5, [r4, #24]
    155e:	62a3      	str	r3, [r4, #40]	; 0x28
    1560:	4b16      	ldr	r3, [pc, #88]	; (15bc <_scsi_handle_read_or_write_command+0xbc>)
    1562:	4a17      	ldr	r2, [pc, #92]	; (15c0 <_scsi_handle_read_or_write_command+0xc0>)
    1564:	6223      	str	r3, [r4, #32]
    1566:	2380      	movs	r3, #128	; 0x80
    1568:	009b      	lsls	r3, r3, #2
    156a:	61e3      	str	r3, [r4, #28]
    156c:	2300      	movs	r3, #0
    156e:	6163      	str	r3, [r4, #20]
    1570:	f7fe ff7e 	bl	470 <usb_reset_transfer>
    1574:	353f      	adds	r5, #63	; 0x3f
    1576:	68a3      	ldr	r3, [r4, #8]
    1578:	09ad      	lsrs	r5, r5, #6
    157a:	195b      	adds	r3, r3, r5
    157c:	60a3      	str	r3, [r4, #8]
    157e:	68e3      	ldr	r3, [r4, #12]
    1580:	195d      	adds	r5, r3, r5
    1582:	60e5      	str	r5, [r4, #12]
    1584:	2f01      	cmp	r7, #1
    1586:	d107      	bne.n	1598 <_scsi_handle_read_or_write_command+0x98>
    1588:	2300      	movs	r3, #0
    158a:	0030      	movs	r0, r6
    158c:	60b4      	str	r4, [r6, #8]
    158e:	60f3      	str	r3, [r6, #12]
    1590:	74a7      	strb	r7, [r4, #18]
    1592:	f7ff f86d 	bl	670 <_usb_give_as_many_buffers_as_possible>
    1596:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1598:	63b4      	str	r4, [r6, #56]	; 0x38
    159a:	e7fc      	b.n	1596 <_scsi_handle_read_or_write_command+0x96>
    159c:	f7ff ff6a 	bl	1474 <_msc_data_phase_complete>
    15a0:	e7f9      	b.n	1596 <_scsi_handle_read_or_write_command+0x96>
    15a2:	46c0      	nop			; (mov r8, r8)
    15a4:	50100dc0 	.word	0x50100dc0
    15a8:	50100a4c 	.word	0x50100a4c
    15ac:	50100a7c 	.word	0x50100a7c
    15b0:	50100a20 	.word	0x50100a20
    15b4:	00003e17 	.word	0x00003e17
    15b8:	00003de4 	.word	0x00003de4
    15bc:	50100b1c 	.word	0x50100b1c
    15c0:	00001475 	.word	0x00001475

000015c4 <_scsi_standard_response>:
    15c4:	b570      	push	{r4, r5, r6, lr}
    15c6:	0005      	movs	r5, r0
    15c8:	480c      	ldr	r0, [pc, #48]	; (15fc <_scsi_standard_response+0x38>)
    15ca:	f7fe ffe7 	bl	59c <usb_current_packet_buffer>
    15ce:	68a9      	ldr	r1, [r5, #8]
    15d0:	7903      	ldrb	r3, [r0, #4]
    15d2:	0004      	movs	r4, r0
    15d4:	4299      	cmp	r1, r3
    15d6:	d900      	bls.n	15da <_scsi_standard_response+0x16>
    15d8:	0019      	movs	r1, r3
    15da:	2201      	movs	r2, #1
    15dc:	0028      	movs	r0, r5
    15de:	f7ff ff67 	bl	14b0 <_msc_init_for_di_or_do>
    15e2:	2800      	cmp	r0, #0
    15e4:	d009      	beq.n	15fa <_scsi_standard_response+0x36>
    15e6:	4a06      	ldr	r2, [pc, #24]	; (1600 <_scsi_standard_response+0x3c>)
    15e8:	4806      	ldr	r0, [pc, #24]	; (1604 <_scsi_standard_response+0x40>)
    15ea:	6a13      	ldr	r3, [r2, #32]
    15ec:	7123      	strb	r3, [r4, #4]
    15ee:	6891      	ldr	r1, [r2, #8]
    15f0:	b2db      	uxtb	r3, r3
    15f2:	1acb      	subs	r3, r1, r3
    15f4:	6093      	str	r3, [r2, #8]
    15f6:	f7ff f86d 	bl	6d4 <_msc_reset_and_start_cmd_response_transfer>
    15fa:	bd70      	pop	{r4, r5, r6, pc}
    15fc:	50100dc0 	.word	0x50100dc0
    1600:	50100a7c 	.word	0x50100a7c
    1604:	00001475 	.word	0x00001475

00001608 <_msc_init_for_dn>:
    1608:	2100      	movs	r1, #0
    160a:	4b08      	ldr	r3, [pc, #32]	; (162c <_msc_init_for_dn+0x24>)
    160c:	b510      	push	{r4, lr}
    160e:	1d5a      	adds	r2, r3, #5
    1610:	77d1      	strb	r1, [r2, #31]
    1612:	6882      	ldr	r2, [r0, #8]
    1614:	428a      	cmp	r2, r1
    1616:	d006      	beq.n	1626 <_msc_init_for_dn+0x1e>
    1618:	7b01      	ldrb	r1, [r0, #12]
    161a:	2201      	movs	r2, #1
    161c:	297f      	cmp	r1, #127	; 0x7f
    161e:	d800      	bhi.n	1622 <_msc_init_for_dn+0x1a>
    1620:	1892      	adds	r2, r2, r2
    1622:	3305      	adds	r3, #5
    1624:	77da      	strb	r2, [r3, #31]
    1626:	f7ff ff25 	bl	1474 <_msc_data_phase_complete>
    162a:	bd10      	pop	{r4, pc}
    162c:	50100a7c 	.word	0x50100a7c

00001630 <_write_uf2_page_complete>:
    1630:	4b1a      	ldr	r3, [pc, #104]	; (169c <_write_uf2_page_complete+0x6c>)
    1632:	6802      	ldr	r2, [r0, #0]
    1634:	6959      	ldr	r1, [r3, #20]
    1636:	b510      	push	{r4, lr}
    1638:	0004      	movs	r4, r0
    163a:	428a      	cmp	r2, r1
    163c:	d111      	bne.n	1662 <_write_uf2_page_complete+0x32>
    163e:	6840      	ldr	r0, [r0, #4]
    1640:	2800      	cmp	r0, #0
    1642:	d10e      	bne.n	1662 <_write_uf2_page_complete+0x32>
    1644:	699a      	ldr	r2, [r3, #24]
    1646:	6919      	ldr	r1, [r3, #16]
    1648:	428a      	cmp	r2, r1
    164a:	d10a      	bne.n	1662 <_write_uf2_page_complete+0x32>
    164c:	001a      	movs	r2, r3
    164e:	324c      	adds	r2, #76	; 0x4c
    1650:	7812      	ldrb	r2, [r2, #0]
    1652:	2a00      	cmp	r2, #0
    1654:	d000      	beq.n	1658 <_write_uf2_page_complete+0x28>
    1656:	69d8      	ldr	r0, [r3, #28]
    1658:	22fa      	movs	r2, #250	; 0xfa
    165a:	4911      	ldr	r1, [pc, #68]	; (16a0 <_write_uf2_page_complete+0x70>)
    165c:	0092      	lsls	r2, r2, #2
    165e:	f7ff f9cd 	bl	9fc <watchdog_reboot>
    1662:	cc0a      	ldmia	r4!, {r1, r3}
    1664:	f3ef 8410 	mrs	r4, PRIMASK
    1668:	b672      	cpsid	i
    166a:	4a0e      	ldr	r2, [pc, #56]	; (16a4 <_write_uf2_page_complete+0x74>)
    166c:	6812      	ldr	r2, [r2, #0]
    166e:	4291      	cmp	r1, r2
    1670:	d111      	bne.n	1696 <_write_uf2_page_complete+0x66>
    1672:	2b00      	cmp	r3, #0
    1674:	d00c      	beq.n	1690 <_write_uf2_page_complete+0x60>
    1676:	2201      	movs	r2, #1
    1678:	4b0b      	ldr	r3, [pc, #44]	; (16a8 <_write_uf2_page_complete+0x78>)
    167a:	731a      	strb	r2, [r3, #12]
    167c:	3206      	adds	r2, #6
    167e:	73da      	strb	r2, [r3, #15]
    1680:	3219      	adds	r2, #25
    1682:	765a      	strb	r2, [r3, #25]
    1684:	3a1e      	subs	r2, #30
    1686:	769a      	strb	r2, [r3, #26]
    1688:	3305      	adds	r3, #5
    168a:	77da      	strb	r2, [r3, #31]
    168c:	f7ff fef2 	bl	1474 <_msc_data_phase_complete>
    1690:	4806      	ldr	r0, [pc, #24]	; (16ac <_write_uf2_page_complete+0x7c>)
    1692:	f7ff fbab 	bl	dec <usb_stream_packet_handler_complete>
    1696:	f384 8810 	msr	PRIMASK, r4
    169a:	bd10      	pop	{r4, pc}
    169c:	50100d3c 	.word	0x50100d3c
    16a0:	20042000 	.word	0x20042000
    16a4:	50100a20 	.word	0x50100a20
    16a8:	50100a7c 	.word	0x50100a7c
    16ac:	50100a4c 	.word	0x50100a4c

000016b0 <_picoboot_reset>:
    16b0:	2100      	movs	r1, #0
    16b2:	b510      	push	{r4, lr}
    16b4:	480f      	ldr	r0, [pc, #60]	; (16f4 <_picoboot_reset+0x44>)
    16b6:	f7ff f979 	bl	9ac <_usb_reset_endpoint>
    16ba:	480f      	ldr	r0, [pc, #60]	; (16f8 <_picoboot_reset+0x48>)
    16bc:	2100      	movs	r1, #0
    16be:	f7ff f975 	bl	9ac <_usb_reset_endpoint>
    16c2:	480e      	ldr	r0, [pc, #56]	; (16fc <_picoboot_reset+0x4c>)
    16c4:	7a43      	ldrb	r3, [r0, #9]
    16c6:	2b00      	cmp	r3, #0
    16c8:	d003      	beq.n	16d2 <_picoboot_reset+0x22>
    16ca:	2280      	movs	r2, #128	; 0x80
    16cc:	4b0c      	ldr	r3, [pc, #48]	; (1700 <_picoboot_reset+0x50>)
    16ce:	0292      	lsls	r2, r2, #10
    16d0:	601a      	str	r2, [r3, #0]
    16d2:	2110      	movs	r1, #16
    16d4:	f7ff fc36 	bl	f44 <memset0>
    16d8:	4b0a      	ldr	r3, [pc, #40]	; (1704 <_picoboot_reset+0x54>)
    16da:	2200      	movs	r2, #0
    16dc:	0019      	movs	r1, r3
    16de:	3329      	adds	r3, #41	; 0x29
    16e0:	3128      	adds	r1, #40	; 0x28
    16e2:	700a      	strb	r2, [r1, #0]
    16e4:	701a      	strb	r2, [r3, #0]
    16e6:	4b08      	ldr	r3, [pc, #32]	; (1708 <_picoboot_reset+0x58>)
    16e8:	0019      	movs	r1, r3
    16ea:	3329      	adds	r3, #41	; 0x29
    16ec:	3128      	adds	r1, #40	; 0x28
    16ee:	700a      	strb	r2, [r1, #0]
    16f0:	701a      	strb	r2, [r3, #0]
    16f2:	bd10      	pop	{r4, pc}
    16f4:	50100e58 	.word	0x50100e58
    16f8:	50100e24 	.word	0x50100e24
    16fc:	50100ab8 	.word	0x50100ab8
    1700:	4001a01c 	.word	0x4001a01c
    1704:	50100fc0 	.word	0x50100fc0
    1708:	50100e84 	.word	0x50100e84

0000170c <_usb_boot_on_configure>:
    170c:	2280      	movs	r2, #128	; 0x80
    170e:	4b05      	ldr	r3, [pc, #20]	; (1724 <_usb_boot_on_configure+0x18>)
    1710:	0292      	lsls	r2, r2, #10
    1712:	b510      	push	{r4, lr}
    1714:	601a      	str	r2, [r3, #0]
    1716:	2900      	cmp	r1, #0
    1718:	d003      	beq.n	1722 <_usb_boot_on_configure+0x16>
    171a:	f7ff fc19 	bl	f50 <_msc_reset>
    171e:	f7ff ffc7 	bl	16b0 <_picoboot_reset>
    1722:	bd10      	pop	{r4, pc}
    1724:	4001a01c 	.word	0x4001a01c

00001728 <_picoboot_setup_request_handler>:
    1728:	2260      	movs	r2, #96	; 0x60
    172a:	780b      	ldrb	r3, [r1, #0]
    172c:	2000      	movs	r0, #0
    172e:	b510      	push	{r4, lr}
    1730:	401a      	ands	r2, r3
    1732:	2a40      	cmp	r2, #64	; 0x40
    1734:	d113      	bne.n	175e <_picoboot_setup_request_handler+0x36>
    1736:	b25b      	sxtb	r3, r3
    1738:	784a      	ldrb	r2, [r1, #1]
    173a:	4283      	cmp	r3, r0
    173c:	da10      	bge.n	1760 <_picoboot_setup_request_handler+0x38>
    173e:	2a42      	cmp	r2, #66	; 0x42
    1740:	d10d      	bne.n	175e <_picoboot_setup_request_handler+0x36>
    1742:	88cc      	ldrh	r4, [r1, #6]
    1744:	2c10      	cmp	r4, #16
    1746:	d10a      	bne.n	175e <_picoboot_setup_request_handler+0x36>
    1748:	0021      	movs	r1, r4
    174a:	4809      	ldr	r0, [pc, #36]	; (1770 <_picoboot_setup_request_handler+0x48>)
    174c:	f7ff fe5a 	bl	1404 <usb_get_single_packet_response_buffer>
    1750:	0022      	movs	r2, r4
    1752:	4908      	ldr	r1, [pc, #32]	; (1774 <_picoboot_setup_request_handler+0x4c>)
    1754:	f000 ff74 	bl	2640 <__memcpy>
    1758:	f7ff f80c 	bl	774 <usb_start_single_buffer_control_in_transfer>
    175c:	2001      	movs	r0, #1
    175e:	bd10      	pop	{r4, pc}
    1760:	2a41      	cmp	r2, #65	; 0x41
    1762:	d1fc      	bne.n	175e <_picoboot_setup_request_handler+0x36>
    1764:	f7ff ffa4 	bl	16b0 <_picoboot_reset>
    1768:	f7fe ffec 	bl	744 <usb_start_empty_control_in_transfer_null_completion>
    176c:	e7f6      	b.n	175c <_picoboot_setup_request_handler+0x34>
    176e:	46c0      	nop			; (mov r8, r8)
    1770:	50100f68 	.word	0x50100f68
    1774:	50100ab8 	.word	0x50100ab8

00001778 <flash_put_get>:
    1778:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    177a:	4e18      	ldr	r6, [pc, #96]	; (17dc <flash_put_get+0x64>)
    177c:	24c0      	movs	r4, #192	; 0xc0
    177e:	0015      	movs	r5, r2
    1780:	46b4      	mov	ip, r6
    1782:	0564      	lsls	r4, r4, #21
    1784:	001e      	movs	r6, r3
    1786:	4316      	orrs	r6, r2
    1788:	432e      	orrs	r6, r5
    178a:	d103      	bne.n	1794 <flash_put_get+0x1c>
    178c:	2003      	movs	r0, #3
    178e:	f7ff f9ff 	bl	b90 <flash_cs_force>
    1792:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1794:	6a27      	ldr	r7, [r4, #32]
    1796:	6a66      	ldr	r6, [r4, #36]	; 0x24
    1798:	2a00      	cmp	r2, #0
    179a:	d015      	beq.n	17c8 <flash_put_get+0x50>
    179c:	19bf      	adds	r7, r7, r6
    179e:	2f0d      	cmp	r7, #13
    17a0:	d812      	bhi.n	17c8 <flash_put_get+0x50>
    17a2:	1e07      	subs	r7, r0, #0
    17a4:	d001      	beq.n	17aa <flash_put_get+0x32>
    17a6:	7807      	ldrb	r7, [r0, #0]
    17a8:	3001      	adds	r0, #1
    17aa:	6627      	str	r7, [r4, #96]	; 0x60
    17ac:	3a01      	subs	r2, #1
    17ae:	2e00      	cmp	r6, #0
    17b0:	d0e8      	beq.n	1784 <flash_put_get+0xc>
    17b2:	6e26      	ldr	r6, [r4, #96]	; 0x60
    17b4:	2b00      	cmp	r3, #0
    17b6:	d001      	beq.n	17bc <flash_put_get+0x44>
    17b8:	3b01      	subs	r3, #1
    17ba:	e7e3      	b.n	1784 <flash_put_get+0xc>
    17bc:	2900      	cmp	r1, #0
    17be:	d001      	beq.n	17c4 <flash_put_get+0x4c>
    17c0:	700e      	strb	r6, [r1, #0]
    17c2:	3101      	adds	r1, #1
    17c4:	3d01      	subs	r5, #1
    17c6:	e7dd      	b.n	1784 <flash_put_get+0xc>
    17c8:	2e00      	cmp	r6, #0
    17ca:	d1f2      	bne.n	17b2 <flash_put_get+0x3a>
    17cc:	4666      	mov	r6, ip
    17ce:	27c0      	movs	r7, #192	; 0xc0
    17d0:	6836      	ldr	r6, [r6, #0]
    17d2:	02bf      	lsls	r7, r7, #10
    17d4:	423e      	tst	r6, r7
    17d6:	d0d5      	beq.n	1784 <flash_put_get+0xc>
    17d8:	e7d8      	b.n	178c <flash_put_get+0x14>
    17da:	46c0      	nop			; (mov r8, r8)
    17dc:	4001801c 	.word	0x4001801c

000017e0 <flash_read_data.constprop.0>:
    17e0:	b510      	push	{r4, lr}
    17e2:	000c      	movs	r4, r1
    17e4:	0001      	movs	r1, r0
    17e6:	2003      	movs	r0, #3
    17e8:	f7ff f9da 	bl	ba0 <flash_put_cmd_addr>
    17ec:	2280      	movs	r2, #128	; 0x80
    17ee:	2304      	movs	r3, #4
    17f0:	0021      	movs	r1, r4
    17f2:	2000      	movs	r0, #0
    17f4:	0052      	lsls	r2, r2, #1
    17f6:	f7ff ffbf 	bl	1778 <flash_put_get>
    17fa:	bd10      	pop	{r4, pc}

000017fc <_do_flash_page_read>:
    17fc:	23f0      	movs	r3, #240	; 0xf0
    17fe:	b510      	push	{r4, lr}
    1800:	061b      	lsls	r3, r3, #24
    1802:	18c0      	adds	r0, r0, r3
    1804:	f7ff ffec 	bl	17e0 <flash_read_data.constprop.0>
    1808:	2000      	movs	r0, #0
    180a:	bd10      	pop	{r4, pc}

0000180c <flash_enable_write>:
    180c:	b510      	push	{r4, lr}
    180e:	2002      	movs	r0, #2
    1810:	f7ff f9be 	bl	b90 <flash_cs_force>
    1814:	23c0      	movs	r3, #192	; 0xc0
    1816:	2206      	movs	r2, #6
    1818:	055b      	lsls	r3, r3, #21
    181a:	661a      	str	r2, [r3, #96]	; 0x60
    181c:	2200      	movs	r2, #0
    181e:	2301      	movs	r3, #1
    1820:	0011      	movs	r1, r2
    1822:	0010      	movs	r0, r2
    1824:	f7ff ffa8 	bl	1778 <flash_put_get>
    1828:	bd10      	pop	{r4, pc}
    182a:	be00      	bkpt	0x0000

0000182c <flash_wait_ready>:
    182c:	b573      	push	{r0, r1, r4, r5, r6, lr}
    182e:	26c0      	movs	r6, #192	; 0xc0
    1830:	2401      	movs	r4, #1
    1832:	0576      	lsls	r6, r6, #21
    1834:	2002      	movs	r0, #2
    1836:	f7ff f9ab 	bl	b90 <flash_cs_force>
    183a:	2305      	movs	r3, #5
    183c:	6633      	str	r3, [r6, #96]	; 0x60
    183e:	466b      	mov	r3, sp
    1840:	1ddd      	adds	r5, r3, #7
    1842:	0022      	movs	r2, r4
    1844:	0023      	movs	r3, r4
    1846:	0029      	movs	r1, r5
    1848:	2000      	movs	r0, #0
    184a:	f7ff ff95 	bl	1778 <flash_put_get>
    184e:	782b      	ldrb	r3, [r5, #0]
    1850:	4223      	tst	r3, r4
    1852:	d005      	beq.n	1860 <flash_wait_ready+0x34>
    1854:	4b03      	ldr	r3, [pc, #12]	; (1864 <flash_wait_ready+0x38>)
    1856:	681a      	ldr	r2, [r3, #0]
    1858:	23c0      	movs	r3, #192	; 0xc0
    185a:	029b      	lsls	r3, r3, #10
    185c:	421a      	tst	r2, r3
    185e:	d0e9      	beq.n	1834 <flash_wait_ready+0x8>
    1860:	bd73      	pop	{r0, r1, r4, r5, r6, pc}
    1862:	46c0      	nop			; (mov r8, r8)
    1864:	4001801c 	.word	0x4001801c

00001868 <flash_user_erase>:
    1868:	b570      	push	{r4, r5, r6, lr}
    186a:	0005      	movs	r5, r0
    186c:	000c      	movs	r4, r1
    186e:	f7ff ffcd 	bl	180c <flash_enable_write>
    1872:	0029      	movs	r1, r5
    1874:	0020      	movs	r0, r4
    1876:	f7ff f993 	bl	ba0 <flash_put_cmd_addr>
    187a:	2200      	movs	r2, #0
    187c:	2304      	movs	r3, #4
    187e:	0011      	movs	r1, r2
    1880:	0010      	movs	r0, r2
    1882:	f7ff ff79 	bl	1778 <flash_put_get>
    1886:	f7ff ffd1 	bl	182c <flash_wait_ready>
    188a:	bd70      	pop	{r4, r5, r6, pc}

0000188c <_do_flash_erase_sector>:
    188c:	23f0      	movs	r3, #240	; 0xf0
    188e:	b510      	push	{r4, lr}
    1890:	061b      	lsls	r3, r3, #24
    1892:	18c0      	adds	r0, r0, r3
    1894:	2120      	movs	r1, #32
    1896:	f7ff ffe7 	bl	1868 <flash_user_erase>
    189a:	2000      	movs	r0, #0
    189c:	bd10      	pop	{r4, pc}

0000189e <flash_page_program>:
    189e:	b570      	push	{r4, r5, r6, lr}
    18a0:	0005      	movs	r5, r0
    18a2:	000c      	movs	r4, r1
    18a4:	f7ff ffb2 	bl	180c <flash_enable_write>
    18a8:	0029      	movs	r1, r5
    18aa:	2002      	movs	r0, #2
    18ac:	f7ff f978 	bl	ba0 <flash_put_cmd_addr>
    18b0:	2280      	movs	r2, #128	; 0x80
    18b2:	2304      	movs	r3, #4
    18b4:	2100      	movs	r1, #0
    18b6:	0020      	movs	r0, r4
    18b8:	0052      	lsls	r2, r2, #1
    18ba:	f7ff ff5d 	bl	1778 <flash_put_get>
    18be:	f7ff ffb5 	bl	182c <flash_wait_ready>
    18c2:	bd70      	pop	{r4, r5, r6, pc}

000018c4 <_do_flash_page_program>:
    18c4:	23f0      	movs	r3, #240	; 0xf0
    18c6:	b510      	push	{r4, lr}
    18c8:	061b      	lsls	r3, r3, #24
    18ca:	18c0      	adds	r0, r0, r3
    18cc:	f7ff ffe7 	bl	189e <flash_page_program>
    18d0:	2000      	movs	r0, #0
    18d2:	bd10      	pop	{r4, pc}

000018d4 <_usb_boot>:
    18d4:	2280      	movs	r2, #128	; 0x80
    18d6:	4b82      	ldr	r3, [pc, #520]	; (1ae0 <_usb_boot+0x20c>)
    18d8:	b5f0      	push	{r4, r5, r6, r7, lr}
    18da:	0452      	lsls	r2, r2, #17
    18dc:	601a      	str	r2, [r3, #0]
    18de:	4a81      	ldr	r2, [pc, #516]	; (1ae4 <_usb_boot+0x210>)
    18e0:	0006      	movs	r6, r0
    18e2:	6812      	ldr	r2, [r2, #0]
    18e4:	000d      	movs	r5, r1
    18e6:	b085      	sub	sp, #20
    18e8:	0792      	lsls	r2, r2, #30
    18ea:	d439      	bmi.n	1960 <_usb_boot+0x8c>
    18ec:	2003      	movs	r0, #3
    18ee:	4a7e      	ldr	r2, [pc, #504]	; (1ae8 <_usb_boot+0x214>)
    18f0:	497e      	ldr	r1, [pc, #504]	; (1aec <_usb_boot+0x218>)
    18f2:	4c7f      	ldr	r4, [pc, #508]	; (1af0 <_usb_boot+0x21c>)
    18f4:	6011      	str	r1, [r2, #0]
    18f6:	4a7f      	ldr	r2, [pc, #508]	; (1af4 <_usb_boot+0x220>)
    18f8:	6010      	str	r0, [r2, #0]
    18fa:	4a7f      	ldr	r2, [pc, #508]	; (1af8 <_usb_boot+0x224>)
    18fc:	487f      	ldr	r0, [pc, #508]	; (1afc <_usb_boot+0x228>)
    18fe:	67a2      	str	r2, [r4, #120]	; 0x78
    1900:	3aff      	subs	r2, #255	; 0xff
    1902:	3aff      	subs	r2, #255	; 0xff
    1904:	6002      	str	r2, [r0, #0]
    1906:	6c60      	ldr	r0, [r4, #68]	; 0x44
    1908:	4210      	tst	r0, r2
    190a:	d0fc      	beq.n	1906 <_usb_boot+0x32>
    190c:	2280      	movs	r2, #128	; 0x80
    190e:	0052      	lsls	r2, r2, #1
    1910:	6422      	str	r2, [r4, #64]	; 0x40
    1912:	65a2      	str	r2, [r4, #88]	; 0x58
    1914:	4a7a      	ldr	r2, [pc, #488]	; (1b00 <_usb_boot+0x22c>)
    1916:	6011      	str	r1, [r2, #0]
    1918:	6851      	ldr	r1, [r2, #4]
    191a:	2900      	cmp	r1, #0
    191c:	dafc      	bge.n	1918 <_usb_boot+0x44>
    191e:	2080      	movs	r0, #128	; 0x80
    1920:	0140      	lsls	r0, r0, #5
    1922:	6018      	str	r0, [r3, #0]
    1924:	f7ff f94e 	bl	bc4 <unreset_block_wait.lto_priv.0>
    1928:	2201      	movs	r2, #1
    192a:	4b76      	ldr	r3, [pc, #472]	; (1b04 <_usb_boot+0x230>)
    192c:	2121      	movs	r1, #33	; 0x21
    192e:	601a      	str	r2, [r3, #0]
    1930:	3263      	adds	r2, #99	; 0x63
    1932:	609a      	str	r2, [r3, #8]
    1934:	22aa      	movs	r2, #170	; 0xaa
    1936:	02d2      	lsls	r2, r2, #11
    1938:	60da      	str	r2, [r3, #12]
    193a:	4a73      	ldr	r2, [pc, #460]	; (1b08 <_usb_boot+0x234>)
    193c:	6011      	str	r1, [r2, #0]
    193e:	6819      	ldr	r1, [r3, #0]
    1940:	2900      	cmp	r1, #0
    1942:	dafc      	bge.n	193e <_usb_boot+0x6a>
    1944:	2308      	movs	r3, #8
    1946:	6013      	str	r3, [r2, #0]
    1948:	2300      	movs	r3, #0
    194a:	63e3      	str	r3, [r4, #60]	; 0x3c
    194c:	2382      	movs	r3, #130	; 0x82
    194e:	2201      	movs	r2, #1
    1950:	011b      	lsls	r3, r3, #4
    1952:	6563      	str	r3, [r4, #84]	; 0x54
    1954:	4b6d      	ldr	r3, [pc, #436]	; (1b0c <_usb_boot+0x238>)
    1956:	601a      	str	r2, [r3, #0]
    1958:	2302      	movs	r3, #2
    195a:	6c62      	ldr	r2, [r4, #68]	; 0x44
    195c:	421a      	tst	r2, r3
    195e:	d0fc      	beq.n	195a <_usb_boot+0x86>
    1960:	2080      	movs	r0, #128	; 0x80
    1962:	0440      	lsls	r0, r0, #17
    1964:	f7ff f92e 	bl	bc4 <unreset_block_wait.lto_priv.0>
    1968:	220c      	movs	r2, #12
    196a:	4b69      	ldr	r3, [pc, #420]	; (1b10 <_usb_boot+0x23c>)
    196c:	2180      	movs	r1, #128	; 0x80
    196e:	62da      	str	r2, [r3, #44]	; 0x2c
    1970:	4b68      	ldr	r3, [pc, #416]	; (1b14 <_usb_boot+0x240>)
    1972:	32f5      	adds	r2, #245	; 0xf5
    1974:	32ff      	adds	r2, #255	; 0xff
    1976:	601a      	str	r2, [r3, #0]
    1978:	2201      	movs	r2, #1
    197a:	4b67      	ldr	r3, [pc, #412]	; (1b18 <_usb_boot+0x244>)
    197c:	4867      	ldr	r0, [pc, #412]	; (1b1c <_usb_boot+0x248>)
    197e:	601a      	str	r2, [r3, #0]
    1980:	0149      	lsls	r1, r1, #5
    1982:	f7ff fadf 	bl	f44 <memset0>
    1986:	4b66      	ldr	r3, [pc, #408]	; (1b20 <_usb_boot+0x24c>)
    1988:	601e      	str	r6, [r3, #0]
    198a:	43eb      	mvns	r3, r5
    198c:	079b      	lsls	r3, r3, #30
    198e:	d100      	bne.n	1992 <_usb_boot+0xbe>
    1990:	2500      	movs	r5, #0
    1992:	2e00      	cmp	r6, #0
    1994:	d001      	beq.n	199a <_usb_boot+0xc6>
    1996:	f7ff faaf 	bl	ef8 <gpio_setup.part.0>
    199a:	4c62      	ldr	r4, [pc, #392]	; (1b24 <_usb_boot+0x250>)
    199c:	4b62      	ldr	r3, [pc, #392]	; (1b28 <_usb_boot+0x254>)
    199e:	0020      	movs	r0, r4
    19a0:	6819      	ldr	r1, [r3, #0]
    19a2:	f7ff f8a7 	bl	af4 <_write_six_msb_hex_chars>
    19a6:	4b61      	ldr	r3, [pc, #388]	; (1b2c <_usb_boot+0x258>)
    19a8:	1da0      	adds	r0, r4, #6
    19aa:	6819      	ldr	r1, [r3, #0]
    19ac:	f7ff f8a2 	bl	af4 <_write_six_msb_hex_chars>
    19b0:	2601      	movs	r6, #1
    19b2:	4c5f      	ldr	r4, [pc, #380]	; (1b30 <_usb_boot+0x25c>)
    19b4:	2d00      	cmp	r5, #0
    19b6:	d01f      	beq.n	19f8 <_usb_boot+0x124>
    19b8:	4f5e      	ldr	r7, [pc, #376]	; (1b34 <_usb_boot+0x260>)
    19ba:	2220      	movs	r2, #32
    19bc:	0021      	movs	r1, r4
    19be:	0038      	movs	r0, r7
    19c0:	f000 fe3e 	bl	2640 <__memcpy>
    19c4:	2320      	movs	r3, #32
    19c6:	70bb      	strb	r3, [r7, #2]
    19c8:	2300      	movs	r3, #0
    19ca:	2601      	movs	r6, #1
    19cc:	70fb      	strb	r3, [r7, #3]
    19ce:	002b      	movs	r3, r5
    19d0:	4033      	ands	r3, r6
    19d2:	9303      	str	r3, [sp, #12]
    19d4:	4235      	tst	r5, r6
    19d6:	d007      	beq.n	19e8 <_usb_boot+0x114>
    19d8:	0021      	movs	r1, r4
    19da:	0038      	movs	r0, r7
    19dc:	2217      	movs	r2, #23
    19de:	3120      	adds	r1, #32
    19e0:	3009      	adds	r0, #9
    19e2:	f000 fe2d 	bl	2640 <__memcpy>
    19e6:	2600      	movs	r6, #0
    19e8:	2301      	movs	r3, #1
    19ea:	713b      	strb	r3, [r7, #4]
    19ec:	2300      	movs	r3, #0
    19ee:	72fb      	strb	r3, [r7, #11]
    19f0:	9b03      	ldr	r3, [sp, #12]
    19f2:	003c      	movs	r4, r7
    19f4:	2b00      	cmp	r3, #0
    19f6:	d108      	bne.n	1a0a <_usb_boot+0x136>
    19f8:	0021      	movs	r1, r4
    19fa:	4f4f      	ldr	r7, [pc, #316]	; (1b38 <_usb_boot+0x264>)
    19fc:	4a4f      	ldr	r2, [pc, #316]	; (1b3c <_usb_boot+0x268>)
    19fe:	0038      	movs	r0, r7
    1a00:	3109      	adds	r1, #9
    1a02:	f7fe fd91 	bl	528 <usb_interface_init.constprop.0>
    1a06:	4b4e      	ldr	r3, [pc, #312]	; (1b40 <_usb_boot+0x26c>)
    1a08:	607b      	str	r3, [r7, #4]
    1a0a:	07ab      	lsls	r3, r5, #30
    1a0c:	d40f      	bmi.n	1a2e <_usb_boot+0x15a>
    1a0e:	2117      	movs	r1, #23
    1a10:	4371      	muls	r1, r6
    1a12:	4e4c      	ldr	r6, [pc, #304]	; (1b44 <_usb_boot+0x270>)
    1a14:	3109      	adds	r1, #9
    1a16:	4a4c      	ldr	r2, [pc, #304]	; (1b48 <_usb_boot+0x274>)
    1a18:	0030      	movs	r0, r6
    1a1a:	1861      	adds	r1, r4, r1
    1a1c:	f7fe fd84 	bl	528 <usb_interface_init.constprop.0>
    1a20:	4b4a      	ldr	r3, [pc, #296]	; (1b4c <_usb_boot+0x278>)
    1a22:	4a4b      	ldr	r2, [pc, #300]	; (1b50 <_usb_boot+0x27c>)
    1a24:	601a      	str	r2, [r3, #0]
    1a26:	4a4b      	ldr	r2, [pc, #300]	; (1b54 <_usb_boot+0x280>)
    1a28:	6053      	str	r3, [r2, #4]
    1a2a:	4b4b      	ldr	r3, [pc, #300]	; (1b58 <_usb_boot+0x284>)
    1a2c:	6073      	str	r3, [r6, #4]
    1a2e:	4b4b      	ldr	r3, [pc, #300]	; (1b5c <_usb_boot+0x288>)
    1a30:	2d01      	cmp	r5, #1
    1a32:	d100      	bne.n	1a36 <_usb_boot+0x162>
    1a34:	3304      	adds	r3, #4
    1a36:	4d4a      	ldr	r5, [pc, #296]	; (1b60 <_usb_boot+0x28c>)
    1a38:	4a4a      	ldr	r2, [pc, #296]	; (1b64 <_usb_boot+0x290>)
    1a3a:	60ec      	str	r4, [r5, #12]
    1a3c:	2400      	movs	r4, #0
    1a3e:	4f4a      	ldr	r7, [pc, #296]	; (1b68 <_usb_boot+0x294>)
    1a40:	612b      	str	r3, [r5, #16]
    1a42:	4b4a      	ldr	r3, [pc, #296]	; (1b6c <_usb_boot+0x298>)
    1a44:	0021      	movs	r1, r4
    1a46:	602a      	str	r2, [r5, #0]
    1a48:	60ab      	str	r3, [r5, #8]
    1a4a:	2201      	movs	r2, #1
    1a4c:	2340      	movs	r3, #64	; 0x40
    1a4e:	9400      	str	r4, [sp, #0]
    1a50:	0038      	movs	r0, r7
    1a52:	f7fe fd55 	bl	500 <_usb_endpoint_init_internal>
    1a56:	4e46      	ldr	r6, [pc, #280]	; (1b70 <_usb_boot+0x29c>)
    1a58:	0022      	movs	r2, r4
    1a5a:	0021      	movs	r1, r4
    1a5c:	2340      	movs	r3, #64	; 0x40
    1a5e:	9400      	str	r4, [sp, #0]
    1a60:	0030      	movs	r0, r6
    1a62:	f7fe fd4d 	bl	500 <_usb_endpoint_init_internal>
    1a66:	2380      	movs	r3, #128	; 0x80
    1a68:	0021      	movs	r1, r4
    1a6a:	005b      	lsls	r3, r3, #1
    1a6c:	0038      	movs	r0, r7
    1a6e:	832b      	strh	r3, [r5, #24]
    1a70:	f7fe fd12 	bl	498 <_usb_endpoint_hw_init>
    1a74:	2380      	movs	r3, #128	; 0x80
    1a76:	0021      	movs	r1, r4
    1a78:	005b      	lsls	r3, r3, #1
    1a7a:	0030      	movs	r0, r6
    1a7c:	832b      	strh	r3, [r5, #24]
    1a7e:	f7fe fd0b 	bl	498 <_usb_endpoint_hw_init>
    1a82:	23c0      	movs	r3, #192	; 0xc0
    1a84:	005b      	lsls	r3, r3, #1
    1a86:	832b      	strh	r3, [r5, #24]
    1a88:	3401      	adds	r4, #1
    1a8a:	4b3a      	ldr	r3, [pc, #232]	; (1b74 <_usb_boot+0x2a0>)
    1a8c:	00a2      	lsls	r2, r4, #2
    1a8e:	58d0      	ldr	r0, [r2, r3]
    1a90:	2800      	cmp	r0, #0
    1a92:	d002      	beq.n	1a9a <_usb_boot+0x1c6>
    1a94:	2100      	movs	r1, #0
    1a96:	f7fe fcff 	bl	498 <_usb_endpoint_hw_init>
    1a9a:	3401      	adds	r4, #1
    1a9c:	2c05      	cmp	r4, #5
    1a9e:	d1f4      	bne.n	1a8a <_usb_boot+0x1b6>
    1aa0:	4b35      	ldr	r3, [pc, #212]	; (1b78 <_usb_boot+0x2a4>)
    1aa2:	2000      	movs	r0, #0
    1aa4:	606b      	str	r3, [r5, #4]
    1aa6:	4b35      	ldr	r3, [pc, #212]	; (1b7c <_usb_boot+0x2a8>)
    1aa8:	4a35      	ldr	r2, [pc, #212]	; (1b80 <_usb_boot+0x2ac>)
    1aaa:	001c      	movs	r4, r3
    1aac:	0019      	movs	r1, r3
    1aae:	3304      	adds	r3, #4
    1ab0:	6008      	str	r0, [r1, #0]
    1ab2:	4293      	cmp	r3, r2
    1ab4:	d1fa      	bne.n	1aac <_usb_boot+0x1d8>
    1ab6:	2309      	movs	r3, #9
    1ab8:	6763      	str	r3, [r4, #116]	; 0x74
    1aba:	3303      	adds	r3, #3
    1abc:	67a3      	str	r3, [r4, #120]	; 0x78
    1abe:	3b0b      	subs	r3, #11
    1ac0:	6423      	str	r3, [r4, #64]	; 0x40
    1ac2:	f7ff fa03 	bl	ecc <_usb_handle_bus_reset>
    1ac6:	4b2f      	ldr	r3, [pc, #188]	; (1b84 <_usb_boot+0x2b0>)
    1ac8:	4a2f      	ldr	r2, [pc, #188]	; (1b88 <_usb_boot+0x2b4>)
    1aca:	64e3      	str	r3, [r4, #76]	; 0x4c
    1acc:	4b2f      	ldr	r3, [pc, #188]	; (1b8c <_usb_boot+0x2b8>)
    1ace:	601a      	str	r2, [r3, #0]
    1ad0:	2320      	movs	r3, #32
    1ad2:	4a2f      	ldr	r2, [pc, #188]	; (1b90 <_usb_boot+0x2bc>)
    1ad4:	6013      	str	r3, [r2, #0]
    1ad6:	4a2f      	ldr	r2, [pc, #188]	; (1b94 <_usb_boot+0x2c0>)
    1ad8:	6013      	str	r3, [r2, #0]
    1ada:	f7fe fbe5 	bl	2a8 <async_task_worker_thunk>
    1ade:	46c0      	nop			; (mov r8, r8)
    1ae0:	4000e000 	.word	0x4000e000
    1ae4:	4006c000 	.word	0x4006c000
    1ae8:	40060000 	.word	0x40060000
    1aec:	00fab000 	.word	0x00fab000
    1af0:	40008000 	.word	0x40008000
    1af4:	4000b030 	.word	0x4000b030
    1af8:	000001ff 	.word	0x000001ff
    1afc:	4000b03c 	.word	0x4000b03c
    1b00:	40024000 	.word	0x40024000
    1b04:	40028000 	.word	0x40028000
    1b08:	4002b004 	.word	0x4002b004
    1b0c:	4000a03c 	.word	0x4000a03c
    1b10:	40058000 	.word	0x40058000
    1b14:	4005a02c 	.word	0x4005a02c
    1b18:	14003000 	.word	0x14003000
    1b1c:	50100000 	.word	0x50100000
    1b20:	50100f64 	.word	0x50100f64
    1b24:	50100eb5 	.word	0x50100eb5
    1b28:	40000040 	.word	0x40000040
    1b2c:	00000050 	.word	0x00000050
    1b30:	00003e19 	.word	0x00003e19
    1b34:	50100d1c 	.word	0x50100d1c
    1b38:	50100e18 	.word	0x50100e18
    1b3c:	00003ddc 	.word	0x00003ddc
    1b40:	00000fb5 	.word	0x00000fb5
    1b44:	50100e50 	.word	0x50100e50
    1b48:	00003f38 	.word	0x00003f38
    1b4c:	50100aa4 	.word	0x50100aa4
    1b50:	00003dec 	.word	0x00003dec
    1b54:	50100e58 	.word	0x50100e58
    1b58:	00001729 	.word	0x00001729
    1b5c:	00003e64 	.word	0x00003e64
    1b60:	501009ec 	.word	0x501009ec
    1b64:	00003e50 	.word	0x00003e50
    1b68:	50100f68 	.word	0x50100f68
    1b6c:	00000b75 	.word	0x00000b75
    1b70:	50100f94 	.word	0x50100f94
    1b74:	50100a08 	.word	0x50100a08
    1b78:	0000170d 	.word	0x0000170d
    1b7c:	50110000 	.word	0x50110000
    1b80:	50110084 	.word	0x50110084
    1b84:	20010000 	.word	0x20010000
    1b88:	000113f0 	.word	0x000113f0
    1b8c:	50110090 	.word	0x50110090
    1b90:	e000e280 	.word	0xe000e280
    1b94:	e000e100 	.word	0xe000e100

00001b98 <_usb_boot_reboot_wrapper>:
    1b98:	4b02      	ldr	r3, [pc, #8]	; (1ba4 <_usb_boot_reboot_wrapper+0xc>)
    1b9a:	b510      	push	{r4, lr}
    1b9c:	68d8      	ldr	r0, [r3, #12]
    1b9e:	6919      	ldr	r1, [r3, #16]
    1ba0:	f7ff fe98 	bl	18d4 <_usb_boot>
    1ba4:	40058000 	.word	0x40058000

00001ba8 <impl_usb_stream_packet_packet_handler>:
    1ba8:	4b24      	ldr	r3, [pc, #144]	; (1c3c <impl_usb_stream_packet_packet_handler+0x94>)
    1baa:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    1bac:	681a      	ldr	r2, [r3, #0]
    1bae:	4b24      	ldr	r3, [pc, #144]	; (1c40 <impl_usb_stream_packet_packet_handler+0x98>)
    1bb0:	6884      	ldr	r4, [r0, #8]
    1bb2:	601a      	str	r2, [r3, #0]
    1bb4:	0002      	movs	r2, r0
    1bb6:	69e5      	ldr	r5, [r4, #28]
    1bb8:	3229      	adds	r2, #41	; 0x29
    1bba:	6963      	ldr	r3, [r4, #20]
    1bbc:	7812      	ldrb	r2, [r2, #0]
    1bbe:	1e6e      	subs	r6, r5, #1
    1bc0:	401e      	ands	r6, r3
    1bc2:	9201      	str	r2, [sp, #4]
    1bc4:	2a00      	cmp	r2, #0
    1bc6:	d015      	beq.n	1bf4 <impl_usb_stream_packet_packet_handler+0x4c>
    1bc8:	2e00      	cmp	r6, #0
    1bca:	d003      	beq.n	1bd4 <impl_usb_stream_packet_packet_handler+0x2c>
    1bcc:	0020      	movs	r0, r4
    1bce:	f7ff f90d 	bl	dec <usb_stream_packet_handler_complete>
    1bd2:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
    1bd4:	69a2      	ldr	r2, [r4, #24]
    1bd6:	1959      	adds	r1, r3, r5
    1bd8:	4291      	cmp	r1, r2
    1bda:	d900      	bls.n	1bde <impl_usb_stream_packet_packet_handler+0x36>
    1bdc:	1ad5      	subs	r5, r2, r3
    1bde:	2d00      	cmp	r5, #0
    1be0:	d0f4      	beq.n	1bcc <impl_usb_stream_packet_packet_handler+0x24>
    1be2:	6aa3      	ldr	r3, [r4, #40]	; 0x28
    1be4:	4a17      	ldr	r2, [pc, #92]	; (1c44 <impl_usb_stream_packet_packet_handler+0x9c>)
    1be6:	791b      	ldrb	r3, [r3, #4]
    1be8:	0028      	movs	r0, r5
    1bea:	5ad3      	ldrh	r3, [r2, r3]
    1bec:	4798      	blx	r3
    1bee:	2800      	cmp	r0, #0
    1bf0:	d0ec      	beq.n	1bcc <impl_usb_stream_packet_packet_handler+0x24>
    1bf2:	e7ee      	b.n	1bd2 <impl_usb_stream_packet_packet_handler+0x2a>
    1bf4:	f7fe fcd2 	bl	59c <usb_current_packet_buffer>
    1bf8:	6961      	ldr	r1, [r4, #20]
    1bfa:	69a2      	ldr	r2, [r4, #24]
    1bfc:	3140      	adds	r1, #64	; 0x40
    1bfe:	0007      	movs	r7, r0
    1c00:	69e3      	ldr	r3, [r4, #28]
    1c02:	4291      	cmp	r1, r2
    1c04:	d312      	bcc.n	1c2c <impl_usb_stream_packet_packet_handler+0x84>
    1c06:	0015      	movs	r5, r2
    1c08:	1e59      	subs	r1, r3, #1
    1c0a:	400d      	ands	r5, r1
    1c0c:	420a      	tst	r2, r1
    1c0e:	d100      	bne.n	1c12 <impl_usb_stream_packet_packet_handler+0x6a>
    1c10:	001d      	movs	r5, r3
    1c12:	2e00      	cmp	r6, #0
    1c14:	d103      	bne.n	1c1e <impl_usb_stream_packet_packet_handler+0x76>
    1c16:	69e1      	ldr	r1, [r4, #28]
    1c18:	6a20      	ldr	r0, [r4, #32]
    1c1a:	f7ff f993 	bl	f44 <memset0>
    1c1e:	6a23      	ldr	r3, [r4, #32]
    1c20:	793a      	ldrb	r2, [r7, #4]
    1c22:	6839      	ldr	r1, [r7, #0]
    1c24:	1998      	adds	r0, r3, r6
    1c26:	f000 fd0b 	bl	2640 <__memcpy>
    1c2a:	e7d8      	b.n	1bde <impl_usb_stream_packet_packet_handler+0x36>
    1c2c:	001d      	movs	r5, r3
    1c2e:	0033      	movs	r3, r6
    1c30:	3340      	adds	r3, #64	; 0x40
    1c32:	42ab      	cmp	r3, r5
    1c34:	d2ed      	bcs.n	1c12 <impl_usb_stream_packet_packet_handler+0x6a>
    1c36:	9d01      	ldr	r5, [sp, #4]
    1c38:	e7eb      	b.n	1c12 <impl_usb_stream_packet_packet_handler+0x6a>
    1c3a:	46c0      	nop			; (mov r8, r8)
    1c3c:	50100f64 	.word	0x50100f64
    1c40:	d0000014 	.word	0xd0000014
    1c44:	0000043c 	.word	0x0000043c

00001c48 <impl_msc_cmd_packet>:
    1c48:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    1c4a:	0006      	movs	r6, r0
    1c4c:	f7fe fca6 	bl	59c <usb_current_packet_buffer>
    1c50:	7903      	ldrb	r3, [r0, #4]
    1c52:	2b1f      	cmp	r3, #31
    1c54:	d000      	beq.n	1c58 <impl_msc_cmd_packet+0x10>
    1c56:	e0a0      	b.n	1d9a <impl_msc_cmd_packet+0x152>
    1c58:	6805      	ldr	r5, [r0, #0]
    1c5a:	4b55      	ldr	r3, [pc, #340]	; (1db0 <impl_msc_cmd_packet+0x168>)
    1c5c:	682a      	ldr	r2, [r5, #0]
    1c5e:	429a      	cmp	r2, r3
    1c60:	d000      	beq.n	1c64 <impl_msc_cmd_packet+0x1c>
    1c62:	e09a      	b.n	1d9a <impl_msc_cmd_packet+0x152>
    1c64:	7b6b      	ldrb	r3, [r5, #13]
    1c66:	2b00      	cmp	r3, #0
    1c68:	d000      	beq.n	1c6c <impl_msc_cmd_packet+0x24>
    1c6a:	e096      	b.n	1d9a <impl_msc_cmd_packet+0x152>
    1c6c:	7b29      	ldrb	r1, [r5, #12]
    1c6e:	337f      	adds	r3, #127	; 0x7f
    1c70:	000a      	movs	r2, r1
    1c72:	401a      	ands	r2, r3
    1c74:	4219      	tst	r1, r3
    1c76:	d000      	beq.n	1c7a <impl_msc_cmd_packet+0x32>
    1c78:	e08f      	b.n	1d9a <impl_msc_cmd_packet+0x152>
    1c7a:	7bab      	ldrb	r3, [r5, #14]
    1c7c:	3b01      	subs	r3, #1
    1c7e:	2b0f      	cmp	r3, #15
    1c80:	d900      	bls.n	1c84 <impl_msc_cmd_packet+0x3c>
    1c82:	e08a      	b.n	1d9a <impl_msc_cmd_packet+0x152>
    1c84:	4c4b      	ldr	r4, [pc, #300]	; (1db4 <impl_msc_cmd_packet+0x16c>)
    1c86:	4b4c      	ldr	r3, [pc, #304]	; (1db8 <impl_msc_cmd_packet+0x170>)
    1c88:	6023      	str	r3, [r4, #0]
    1c8a:	686b      	ldr	r3, [r5, #4]
    1c8c:	6063      	str	r3, [r4, #4]
    1c8e:	68ab      	ldr	r3, [r5, #8]
    1c90:	60a3      	str	r3, [r4, #8]
    1c92:	7beb      	ldrb	r3, [r5, #15]
    1c94:	2b03      	cmp	r3, #3
    1c96:	d002      	beq.n	1c9e <impl_msc_cmd_packet+0x56>
    1c98:	73e2      	strb	r2, [r4, #15]
    1c9a:	7662      	strb	r2, [r4, #25]
    1c9c:	76a2      	strb	r2, [r4, #26]
    1c9e:	2700      	movs	r7, #0
    1ca0:	7327      	strb	r7, [r4, #12]
    1ca2:	2b23      	cmp	r3, #35	; 0x23
    1ca4:	d047      	beq.n	1d36 <impl_msc_cmd_packet+0xee>
    1ca6:	d818      	bhi.n	1cda <impl_msc_cmd_packet+0x92>
    1ca8:	2b1a      	cmp	r3, #26
    1caa:	d03b      	beq.n	1d24 <impl_msc_cmd_packet+0xdc>
    1cac:	d80d      	bhi.n	1cca <impl_msc_cmd_packet+0x82>
    1cae:	2b03      	cmp	r3, #3
    1cb0:	d051      	beq.n	1d56 <impl_msc_cmd_packet+0x10e>
    1cb2:	2b12      	cmp	r3, #18
    1cb4:	d025      	beq.n	1d02 <impl_msc_cmd_packet+0xba>
    1cb6:	42bb      	cmp	r3, r7
    1cb8:	d05a      	beq.n	1d70 <impl_msc_cmd_packet+0x128>
    1cba:	2301      	movs	r3, #1
    1cbc:	7323      	strb	r3, [r4, #12]
    1cbe:	3304      	adds	r3, #4
    1cc0:	73e3      	strb	r3, [r4, #15]
    1cc2:	331b      	adds	r3, #27
    1cc4:	7663      	strb	r3, [r4, #25]
    1cc6:	2300      	movs	r3, #0
    1cc8:	e05c      	b.n	1d84 <impl_msc_cmd_packet+0x13c>
    1cca:	2b1b      	cmp	r3, #27
    1ccc:	d05c      	beq.n	1d88 <impl_msc_cmd_packet+0x140>
    1cce:	2b1e      	cmp	r3, #30
    1cd0:	d1f3      	bne.n	1cba <impl_msc_cmd_packet+0x72>
    1cd2:	0028      	movs	r0, r5
    1cd4:	f7ff fc98 	bl	1608 <_msc_init_for_dn>
    1cd8:	e00a      	b.n	1cf0 <impl_msc_cmd_packet+0xa8>
    1cda:	2b2a      	cmp	r3, #42	; 0x2a
    1cdc:	d029      	beq.n	1d32 <impl_msc_cmd_packet+0xea>
    1cde:	d80b      	bhi.n	1cf8 <impl_msc_cmd_packet+0xb0>
    1ce0:	2b25      	cmp	r3, #37	; 0x25
    1ce2:	d031      	beq.n	1d48 <impl_msc_cmd_packet+0x100>
    1ce4:	2101      	movs	r1, #1
    1ce6:	2b28      	cmp	r3, #40	; 0x28
    1ce8:	d1e7      	bne.n	1cba <impl_msc_cmd_packet+0x72>
    1cea:	0028      	movs	r0, r5
    1cec:	f7ff fc08 	bl	1500 <_scsi_handle_read_or_write_command>
    1cf0:	0030      	movs	r0, r6
    1cf2:	f7fe fdd5 	bl	8a0 <usb_packet_done>
    1cf6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    1cf8:	2b2f      	cmp	r3, #47	; 0x2f
    1cfa:	d0ea      	beq.n	1cd2 <impl_msc_cmd_packet+0x8a>
    1cfc:	2b35      	cmp	r3, #53	; 0x35
    1cfe:	d0e8      	beq.n	1cd2 <impl_msc_cmd_packet+0x8a>
    1d00:	e7db      	b.n	1cba <impl_msc_cmd_packet+0x72>
    1d02:	2124      	movs	r1, #36	; 0x24
    1d04:	482d      	ldr	r0, [pc, #180]	; (1dbc <impl_msc_cmd_packet+0x174>)
    1d06:	f7ff fb7d 	bl	1404 <usb_get_single_packet_response_buffer>
    1d0a:	2119      	movs	r1, #25
    1d0c:	0004      	movs	r4, r0
    1d0e:	482c      	ldr	r0, [pc, #176]	; (1dc0 <impl_msc_cmd_packet+0x178>)
    1d10:	0022      	movs	r2, r4
    1d12:	1840      	adds	r0, r0, r1
    1d14:	f000 fc75 	bl	2602 <poor_mans_text_decompress>
    1d18:	2380      	movs	r3, #128	; 0x80
    1d1a:	7063      	strb	r3, [r4, #1]
    1d1c:	0028      	movs	r0, r5
    1d1e:	f7ff fc51 	bl	15c4 <_scsi_standard_response>
    1d22:	e7e5      	b.n	1cf0 <impl_msc_cmd_packet+0xa8>
    1d24:	2104      	movs	r1, #4
    1d26:	4825      	ldr	r0, [pc, #148]	; (1dbc <impl_msc_cmd_packet+0x174>)
    1d28:	f7ff fb6c 	bl	1404 <usb_get_single_packet_response_buffer>
    1d2c:	2303      	movs	r3, #3
    1d2e:	6003      	str	r3, [r0, #0]
    1d30:	e7f4      	b.n	1d1c <impl_msc_cmd_packet+0xd4>
    1d32:	2102      	movs	r1, #2
    1d34:	e7d9      	b.n	1cea <impl_msc_cmd_packet+0xa2>
    1d36:	210c      	movs	r1, #12
    1d38:	4820      	ldr	r0, [pc, #128]	; (1dbc <impl_msc_cmd_packet+0x174>)
    1d3a:	f7ff fb63 	bl	1404 <usb_get_single_packet_response_buffer>
    1d3e:	220c      	movs	r2, #12
    1d40:	4920      	ldr	r1, [pc, #128]	; (1dc4 <impl_msc_cmd_packet+0x17c>)
    1d42:	f000 fc7d 	bl	2640 <__memcpy>
    1d46:	e7e9      	b.n	1d1c <impl_msc_cmd_packet+0xd4>
    1d48:	2108      	movs	r1, #8
    1d4a:	481c      	ldr	r0, [pc, #112]	; (1dbc <impl_msc_cmd_packet+0x174>)
    1d4c:	f7ff fb5a 	bl	1404 <usb_get_single_packet_response_buffer>
    1d50:	2208      	movs	r2, #8
    1d52:	491d      	ldr	r1, [pc, #116]	; (1dc8 <impl_msc_cmd_packet+0x180>)
    1d54:	e7f5      	b.n	1d42 <impl_msc_cmd_packet+0xfa>
    1d56:	2112      	movs	r1, #18
    1d58:	4818      	ldr	r0, [pc, #96]	; (1dbc <impl_msc_cmd_packet+0x174>)
    1d5a:	f7ff fb53 	bl	1404 <usb_get_single_packet_response_buffer>
    1d5e:	0021      	movs	r1, r4
    1d60:	2212      	movs	r2, #18
    1d62:	310d      	adds	r1, #13
    1d64:	f000 fc6c 	bl	2640 <__memcpy>
    1d68:	73e7      	strb	r7, [r4, #15]
    1d6a:	7667      	strb	r7, [r4, #25]
    1d6c:	76a7      	strb	r7, [r4, #26]
    1d6e:	e7d5      	b.n	1d1c <impl_msc_cmd_packet+0xd4>
    1d70:	1de2      	adds	r2, r4, #7
    1d72:	7fd2      	ldrb	r2, [r2, #31]
    1d74:	2a00      	cmp	r2, #0
    1d76:	d0ac      	beq.n	1cd2 <impl_msc_cmd_packet+0x8a>
    1d78:	2201      	movs	r2, #1
    1d7a:	7322      	strb	r2, [r4, #12]
    1d7c:	1892      	adds	r2, r2, r2
    1d7e:	73e2      	strb	r2, [r4, #15]
    1d80:	3238      	adds	r2, #56	; 0x38
    1d82:	7662      	strb	r2, [r4, #25]
    1d84:	76a3      	strb	r3, [r4, #26]
    1d86:	e7a4      	b.n	1cd2 <impl_msc_cmd_packet+0x8a>
    1d88:	2203      	movs	r2, #3
    1d8a:	7ceb      	ldrb	r3, [r5, #19]
    1d8c:	4013      	ands	r3, r2
    1d8e:	2b02      	cmp	r3, #2
    1d90:	d19f      	bne.n	1cd2 <impl_msc_cmd_packet+0x8a>
    1d92:	3407      	adds	r4, #7
    1d94:	3b01      	subs	r3, #1
    1d96:	77e3      	strb	r3, [r4, #31]
    1d98:	e79b      	b.n	1cd2 <impl_msc_cmd_packet+0x8a>
    1d9a:	4c08      	ldr	r4, [pc, #32]	; (1dbc <impl_msc_cmd_packet+0x174>)
    1d9c:	2103      	movs	r1, #3
    1d9e:	0020      	movs	r0, r4
    1da0:	f7fe fd1c 	bl	7dc <_usb_stall_endpoint>
    1da4:	0020      	movs	r0, r4
    1da6:	2103      	movs	r1, #3
    1da8:	302c      	adds	r0, #44	; 0x2c
    1daa:	f7fe fd17 	bl	7dc <_usb_stall_endpoint>
    1dae:	e79f      	b.n	1cf0 <impl_msc_cmd_packet+0xa8>
    1db0:	43425355 	.word	0x43425355
    1db4:	50100a7c 	.word	0x50100a7c
    1db8:	53425355 	.word	0x53425355
    1dbc:	50100dc0 	.word	0x50100dc0
    1dc0:	00003f40 	.word	0x00003f40
    1dc4:	00003e0b 	.word	0x00003e0b
    1dc8:	00003e03 	.word	0x00003e03

00001dcc <impl_msc_on_sector_stream_chunk>:
    1dcc:	b510      	push	{r4, lr}
    1dce:	4b09      	ldr	r3, [pc, #36]	; (1df4 <impl_msc_on_sector_stream_chunk+0x28>)
    1dd0:	4c09      	ldr	r4, [pc, #36]	; (1df8 <impl_msc_on_sector_stream_chunk+0x2c>)
    1dd2:	6a5a      	ldr	r2, [r3, #36]	; 0x24
    1dd4:	3229      	adds	r2, #41	; 0x29
    1dd6:	7812      	ldrb	r2, [r2, #0]
    1dd8:	2a00      	cmp	r2, #0
    1dda:	d100      	bne.n	1dde <impl_msc_on_sector_stream_chunk+0x12>
    1ddc:	4c07      	ldr	r4, [pc, #28]	; (1dfc <impl_msc_on_sector_stream_chunk+0x30>)
    1dde:	4a08      	ldr	r2, [pc, #32]	; (1e00 <impl_msc_on_sector_stream_chunk+0x34>)
    1de0:	6811      	ldr	r1, [r2, #0]
    1de2:	1c48      	adds	r0, r1, #1
    1de4:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
    1de6:	6010      	str	r0, [r2, #0]
    1de8:	1c4a      	adds	r2, r1, #1
    1dea:	62da      	str	r2, [r3, #44]	; 0x2c
    1dec:	4a05      	ldr	r2, [pc, #20]	; (1e04 <impl_msc_on_sector_stream_chunk+0x38>)
    1dee:	47a0      	blx	r4
    1df0:	bd10      	pop	{r4, pc}
    1df2:	46c0      	nop			; (mov r8, r8)
    1df4:	50100a4c 	.word	0x50100a4c
    1df8:	00001031 	.word	0x00001031
    1dfc:	000011b9 	.word	0x000011b9
    1e00:	50100a20 	.word	0x50100a20
    1e04:	50100b1c 	.word	0x50100b1c

00001e08 <isr_irq5>:
    1e08:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    1e0a:	4baa      	ldr	r3, [pc, #680]	; (20b4 <isr_irq5+0x2ac>)
    1e0c:	681b      	ldr	r3, [r3, #0]
    1e0e:	9301      	str	r3, [sp, #4]
    1e10:	03db      	lsls	r3, r3, #15
    1e12:	d400      	bmi.n	1e16 <isr_irq5+0xe>
    1e14:	e088      	b.n	1f28 <isr_irq5+0x120>
    1e16:	f3bf 8f5f 	dmb	sy
    1e1a:	4fa7      	ldr	r7, [pc, #668]	; (20b8 <isr_irq5+0x2b0>)
    1e1c:	2100      	movs	r1, #0
    1e1e:	0038      	movs	r0, r7
    1e20:	2401      	movs	r4, #1
    1e22:	f7fe fdc3 	bl	9ac <_usb_reset_endpoint>
    1e26:	4ea5      	ldr	r6, [pc, #660]	; (20bc <isr_irq5+0x2b4>)
    1e28:	2100      	movs	r1, #0
    1e2a:	0030      	movs	r0, r6
    1e2c:	f7fe fdbe 	bl	9ac <_usb_reset_endpoint>
    1e30:	211f      	movs	r1, #31
    1e32:	1cb3      	adds	r3, r6, #2
    1e34:	77dc      	strb	r4, [r3, #31]
    1e36:	4aa2      	ldr	r2, [pc, #648]	; (20c0 <isr_irq5+0x2b8>)
    1e38:	1cbb      	adds	r3, r7, #2
    1e3a:	77dc      	strb	r4, [r3, #31]
    1e3c:	7813      	ldrb	r3, [r2, #0]
    1e3e:	0015      	movs	r5, r2
    1e40:	4019      	ands	r1, r3
    1e42:	42a1      	cmp	r1, r4
    1e44:	d100      	bne.n	1e48 <isr_irq5+0x40>
    1e46:	e0a2      	b.n	1f8e <isr_irq5+0x186>
    1e48:	2902      	cmp	r1, #2
    1e4a:	d100      	bne.n	1e4e <isr_irq5+0x46>
    1e4c:	e0ca      	b.n	1fe4 <isr_irq5+0x1dc>
    1e4e:	2900      	cmp	r1, #0
    1e50:	d157      	bne.n	1f02 <isr_irq5+0xfa>
    1e52:	3160      	adds	r1, #96	; 0x60
    1e54:	420b      	tst	r3, r1
    1e56:	d154      	bne.n	1f02 <isr_irq5+0xfa>
    1e58:	b25b      	sxtb	r3, r3
    1e5a:	2b00      	cmp	r3, #0
    1e5c:	da4c      	bge.n	1ef8 <isr_irq5+0xf0>
    1e5e:	0038      	movs	r0, r7
    1e60:	f7fe fb9c 	bl	59c <usb_current_packet_buffer>
    1e64:	786b      	ldrb	r3, [r5, #1]
    1e66:	0007      	movs	r7, r0
    1e68:	6806      	ldr	r6, [r0, #0]
    1e6a:	2b06      	cmp	r3, #6
    1e6c:	d00d      	beq.n	1e8a <isr_irq5+0x82>
    1e6e:	2b08      	cmp	r3, #8
    1e70:	d03e      	beq.n	1ef0 <isr_irq5+0xe8>
    1e72:	2b00      	cmp	r3, #0
    1e74:	d145      	bne.n	1f02 <isr_irq5+0xfa>
    1e76:	8033      	strh	r3, [r6, #0]
    1e78:	1924      	adds	r4, r4, r4
    1e7a:	88eb      	ldrh	r3, [r5, #6]
    1e7c:	42a3      	cmp	r3, r4
    1e7e:	dd00      	ble.n	1e82 <isr_irq5+0x7a>
    1e80:	0023      	movs	r3, r4
    1e82:	713b      	strb	r3, [r7, #4]
    1e84:	f7fe fc76 	bl	774 <usb_start_single_buffer_control_in_transfer>
    1e88:	e04a      	b.n	1f20 <isr_irq5+0x118>
    1e8a:	8868      	ldrh	r0, [r5, #2]
    1e8c:	0a03      	lsrs	r3, r0, #8
    1e8e:	2b02      	cmp	r3, #2
    1e90:	d00d      	beq.n	1eae <isr_irq5+0xa6>
    1e92:	2b03      	cmp	r3, #3
    1e94:	d016      	beq.n	1ec4 <isr_irq5+0xbc>
    1e96:	2b01      	cmp	r3, #1
    1e98:	d133      	bne.n	1f02 <isr_irq5+0xfa>
    1e9a:	4b8a      	ldr	r3, [pc, #552]	; (20c4 <isr_irq5+0x2bc>)
    1e9c:	2412      	movs	r4, #18
    1e9e:	6819      	ldr	r1, [r3, #0]
    1ea0:	2900      	cmp	r1, #0
    1ea2:	d0ea      	beq.n	1e7a <isr_irq5+0x72>
    1ea4:	0022      	movs	r2, r4
    1ea6:	0030      	movs	r0, r6
    1ea8:	f000 fbca 	bl	2640 <__memcpy>
    1eac:	e7e5      	b.n	1e7a <isr_irq5+0x72>
    1eae:	b2c0      	uxtb	r0, r0
    1eb0:	2800      	cmp	r0, #0
    1eb2:	d126      	bne.n	1f02 <isr_irq5+0xfa>
    1eb4:	4b83      	ldr	r3, [pc, #524]	; (20c4 <isr_irq5+0x2bc>)
    1eb6:	68d9      	ldr	r1, [r3, #12]
    1eb8:	78cc      	ldrb	r4, [r1, #3]
    1eba:	788b      	ldrb	r3, [r1, #2]
    1ebc:	0224      	lsls	r4, r4, #8
    1ebe:	431c      	orrs	r4, r3
    1ec0:	d0db      	beq.n	1e7a <isr_irq5+0x72>
    1ec2:	e7ef      	b.n	1ea4 <isr_irq5+0x9c>
    1ec4:	b2c0      	uxtb	r0, r0
    1ec6:	2800      	cmp	r0, #0
    1ec8:	d00f      	beq.n	1eea <isr_irq5+0xe2>
    1eca:	4b7e      	ldr	r3, [pc, #504]	; (20c4 <isr_irq5+0x2bc>)
    1ecc:	2402      	movs	r4, #2
    1ece:	689b      	ldr	r3, [r3, #8]
    1ed0:	4798      	blx	r3
    1ed2:	3001      	adds	r0, #1
    1ed4:	1e43      	subs	r3, r0, #1
    1ed6:	781b      	ldrb	r3, [r3, #0]
    1ed8:	2b00      	cmp	r3, #0
    1eda:	d103      	bne.n	1ee4 <isr_irq5+0xdc>
    1edc:	3303      	adds	r3, #3
    1ede:	7034      	strb	r4, [r6, #0]
    1ee0:	7073      	strb	r3, [r6, #1]
    1ee2:	e7ca      	b.n	1e7a <isr_irq5+0x72>
    1ee4:	5333      	strh	r3, [r6, r4]
    1ee6:	3402      	adds	r4, #2
    1ee8:	e7f3      	b.n	1ed2 <isr_irq5+0xca>
    1eea:	2404      	movs	r4, #4
    1eec:	4976      	ldr	r1, [pc, #472]	; (20c8 <isr_irq5+0x2c0>)
    1eee:	e7d9      	b.n	1ea4 <isr_irq5+0x9c>
    1ef0:	4b74      	ldr	r3, [pc, #464]	; (20c4 <isr_irq5+0x2bc>)
    1ef2:	7d5b      	ldrb	r3, [r3, #21]
    1ef4:	7033      	strb	r3, [r6, #0]
    1ef6:	e7c0      	b.n	1e7a <isr_irq5+0x72>
    1ef8:	7853      	ldrb	r3, [r2, #1]
    1efa:	2b05      	cmp	r3, #5
    1efc:	d004      	beq.n	1f08 <isr_irq5+0x100>
    1efe:	2b09      	cmp	r3, #9
    1f00:	d038      	beq.n	1f74 <isr_irq5+0x16c>
    1f02:	f7fe fd3d 	bl	980 <usb_stall_control_pipe.constprop.0>
    1f06:	e00b      	b.n	1f20 <isr_irq5+0x118>
    1f08:	2302      	movs	r3, #2
    1f0a:	56d3      	ldrsb	r3, [r2, r3]
    1f0c:	8851      	ldrh	r1, [r2, #2]
    1f0e:	2b00      	cmp	r3, #0
    1f10:	ddf7      	ble.n	1f02 <isr_irq5+0xfa>
    1f12:	4b6c      	ldr	r3, [pc, #432]	; (20c4 <isr_irq5+0x2bc>)
    1f14:	0038      	movs	r0, r7
    1f16:	7599      	strb	r1, [r3, #22]
    1f18:	4a6c      	ldr	r2, [pc, #432]	; (20cc <isr_irq5+0x2c4>)
    1f1a:	496d      	ldr	r1, [pc, #436]	; (20d0 <isr_irq5+0x2c8>)
    1f1c:	f7fe fbfc 	bl	718 <usb_start_empty_transfer>
    1f20:	2280      	movs	r2, #128	; 0x80
    1f22:	4b6c      	ldr	r3, [pc, #432]	; (20d4 <isr_irq5+0x2cc>)
    1f24:	0292      	lsls	r2, r2, #10
    1f26:	651a      	str	r2, [r3, #80]	; 0x50
    1f28:	9b01      	ldr	r3, [sp, #4]
    1f2a:	06db      	lsls	r3, r3, #27
    1f2c:	d50a      	bpl.n	1f44 <isr_irq5+0x13c>
    1f2e:	2600      	movs	r6, #0
    1f30:	2401      	movs	r4, #1
    1f32:	4f69      	ldr	r7, [pc, #420]	; (20d8 <isr_irq5+0x2d0>)
    1f34:	6dbd      	ldr	r5, [r7, #88]	; 0x58
    1f36:	2d00      	cmp	r5, #0
    1f38:	d004      	beq.n	1f44 <isr_irq5+0x13c>
    1f3a:	2e0a      	cmp	r6, #10
    1f3c:	d000      	beq.n	1f40 <isr_irq5+0x138>
    1f3e:	e082      	b.n	2046 <isr_irq5+0x23e>
    1f40:	4b64      	ldr	r3, [pc, #400]	; (20d4 <isr_irq5+0x2cc>)
    1f42:	659d      	str	r5, [r3, #88]	; 0x58
    1f44:	9b01      	ldr	r3, [sp, #4]
    1f46:	04db      	lsls	r3, r3, #19
    1f48:	d505      	bpl.n	1f56 <isr_irq5+0x14e>
    1f4a:	f7fe ffbf 	bl	ecc <_usb_handle_bus_reset>
    1f4e:	2280      	movs	r2, #128	; 0x80
    1f50:	4b60      	ldr	r3, [pc, #384]	; (20d4 <isr_irq5+0x2cc>)
    1f52:	0312      	lsls	r2, r2, #12
    1f54:	651a      	str	r2, [r3, #80]	; 0x50
    1f56:	23f8      	movs	r3, #248	; 0xf8
    1f58:	9a01      	ldr	r2, [sp, #4]
    1f5a:	009b      	lsls	r3, r3, #2
    1f5c:	421a      	tst	r2, r3
    1f5e:	d008      	beq.n	1f72 <isr_irq5+0x16a>
    1f60:	4b5d      	ldr	r3, [pc, #372]	; (20d8 <isr_irq5+0x2d0>)
    1f62:	6d1b      	ldr	r3, [r3, #80]	; 0x50
    1f64:	2b00      	cmp	r3, #0
    1f66:	db00      	blt.n	1f6a <isr_irq5+0x162>
    1f68:	e07e      	b.n	2068 <isr_irq5+0x260>
    1f6a:	2280      	movs	r2, #128	; 0x80
    1f6c:	4b59      	ldr	r3, [pc, #356]	; (20d4 <isr_irq5+0x2cc>)
    1f6e:	0612      	lsls	r2, r2, #24
    1f70:	651a      	str	r2, [r3, #80]	; 0x50
    1f72:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
    1f74:	7890      	ldrb	r0, [r2, #2]
    1f76:	2800      	cmp	r0, #0
    1f78:	d004      	beq.n	1f84 <isr_irq5+0x17c>
    1f7a:	4b52      	ldr	r3, [pc, #328]	; (20c4 <isr_irq5+0x2bc>)
    1f7c:	68db      	ldr	r3, [r3, #12]
    1f7e:	795b      	ldrb	r3, [r3, #5]
    1f80:	4283      	cmp	r3, r0
    1f82:	d1be      	bne.n	1f02 <isr_irq5+0xfa>
    1f84:	f7fe ff86 	bl	e94 <_usb_handle_set_config>
    1f88:	f7fe fbdc 	bl	744 <usb_start_empty_control_in_transfer_null_completion>
    1f8c:	e7c8      	b.n	1f20 <isr_irq5+0x118>
    1f8e:	8893      	ldrh	r3, [r2, #4]
    1f90:	4a4c      	ldr	r2, [pc, #304]	; (20c4 <isr_irq5+0x2bc>)
    1f92:	7d51      	ldrb	r1, [r2, #21]
    1f94:	2900      	cmp	r1, #0
    1f96:	d0b4      	beq.n	1f02 <isr_irq5+0xfa>
    1f98:	21fe      	movs	r1, #254	; 0xfe
    1f9a:	420b      	tst	r3, r1
    1f9c:	d1b1      	bne.n	1f02 <isr_irq5+0xfa>
    1f9e:	6912      	ldr	r2, [r2, #16]
    1fa0:	b2db      	uxtb	r3, r3
    1fa2:	009b      	lsls	r3, r3, #2
    1fa4:	5898      	ldr	r0, [r3, r2]
    1fa6:	2800      	cmp	r0, #0
    1fa8:	d0ab      	beq.n	1f02 <isr_irq5+0xfa>
    1faa:	6843      	ldr	r3, [r0, #4]
    1fac:	2b00      	cmp	r3, #0
    1fae:	d114      	bne.n	1fda <isr_irq5+0x1d2>
    1fb0:	2260      	movs	r2, #96	; 0x60
    1fb2:	782b      	ldrb	r3, [r5, #0]
    1fb4:	4213      	tst	r3, r2
    1fb6:	d1a4      	bne.n	1f02 <isr_irq5+0xfa>
    1fb8:	88aa      	ldrh	r2, [r5, #4]
    1fba:	0a12      	lsrs	r2, r2, #8
    1fbc:	d1a1      	bne.n	1f02 <isr_irq5+0xfa>
    1fbe:	b25b      	sxtb	r3, r3
    1fc0:	2b00      	cmp	r3, #0
    1fc2:	da9e      	bge.n	1f02 <isr_irq5+0xfa>
    1fc4:	786c      	ldrb	r4, [r5, #1]
    1fc6:	2c00      	cmp	r4, #0
    1fc8:	d19b      	bne.n	1f02 <isr_irq5+0xfa>
    1fca:	0038      	movs	r0, r7
    1fcc:	f7fe fae6 	bl	59c <usb_current_packet_buffer>
    1fd0:	6803      	ldr	r3, [r0, #0]
    1fd2:	601c      	str	r4, [r3, #0]
    1fd4:	2302      	movs	r3, #2
    1fd6:	7103      	strb	r3, [r0, #4]
    1fd8:	e754      	b.n	1e84 <isr_irq5+0x7c>
    1fda:	0029      	movs	r1, r5
    1fdc:	4798      	blx	r3
    1fde:	2800      	cmp	r0, #0
    1fe0:	d19e      	bne.n	1f20 <isr_irq5+0x118>
    1fe2:	e7e5      	b.n	1fb0 <isr_irq5+0x1a8>
    1fe4:	8892      	ldrh	r2, [r2, #4]
    1fe6:	2a00      	cmp	r2, #0
    1fe8:	d041      	beq.n	206e <isr_irq5+0x266>
    1fea:	2a80      	cmp	r2, #128	; 0x80
    1fec:	d060      	beq.n	20b0 <isr_irq5+0x2a8>
    1fee:	4935      	ldr	r1, [pc, #212]	; (20c4 <isr_irq5+0x2bc>)
    1ff0:	7d49      	ldrb	r1, [r1, #21]
    1ff2:	2900      	cmp	r1, #0
    1ff4:	d100      	bne.n	1ff8 <isr_irq5+0x1f0>
    1ff6:	e784      	b.n	1f02 <isr_irq5+0xfa>
    1ff8:	4938      	ldr	r1, [pc, #224]	; (20dc <isr_irq5+0x2d4>)
    1ffa:	00a0      	lsls	r0, r4, #2
    1ffc:	5840      	ldr	r0, [r0, r1]
    1ffe:	6806      	ldr	r6, [r0, #0]
    2000:	78b6      	ldrb	r6, [r6, #2]
    2002:	42b2      	cmp	r2, r6
    2004:	d034      	beq.n	2070 <isr_irq5+0x268>
    2006:	3401      	adds	r4, #1
    2008:	2c05      	cmp	r4, #5
    200a:	d1f6      	bne.n	1ffa <isr_irq5+0x1f2>
    200c:	e779      	b.n	1f02 <isr_irq5+0xfa>
    200e:	7869      	ldrb	r1, [r5, #1]
    2010:	2901      	cmp	r1, #1
    2012:	d00a      	beq.n	202a <isr_irq5+0x222>
    2014:	2903      	cmp	r1, #3
    2016:	d000      	beq.n	201a <isr_irq5+0x212>
    2018:	e773      	b.n	1f02 <isr_irq5+0xfa>
    201a:	886b      	ldrh	r3, [r5, #2]
    201c:	2b00      	cmp	r3, #0
    201e:	d000      	beq.n	2022 <isr_irq5+0x21a>
    2020:	e76f      	b.n	1f02 <isr_irq5+0xfa>
    2022:	2102      	movs	r1, #2
    2024:	f7fe fbda 	bl	7dc <_usb_stall_endpoint>
    2028:	e7ae      	b.n	1f88 <isr_irq5+0x180>
    202a:	886b      	ldrh	r3, [r5, #2]
    202c:	2b00      	cmp	r3, #0
    202e:	d000      	beq.n	2032 <isr_irq5+0x22a>
    2030:	e767      	b.n	1f02 <isr_irq5+0xfa>
    2032:	1dc2      	adds	r2, r0, #7
    2034:	7fd2      	ldrb	r2, [r2, #31]
    2036:	2a02      	cmp	r2, #2
    2038:	d802      	bhi.n	2040 <isr_irq5+0x238>
    203a:	f7fe fcb7 	bl	9ac <_usb_reset_endpoint>
    203e:	e7a3      	b.n	1f88 <isr_irq5+0x180>
    2040:	3002      	adds	r0, #2
    2042:	77c3      	strb	r3, [r0, #31]
    2044:	e7a0      	b.n	1f88 <isr_irq5+0x180>
    2046:	422c      	tst	r4, r5
    2048:	d00b      	beq.n	2062 <isr_irq5+0x25a>
    204a:	2101      	movs	r1, #1
    204c:	6dfa      	ldr	r2, [r7, #92]	; 0x5c
    204e:	4b21      	ldr	r3, [pc, #132]	; (20d4 <isr_irq5+0x2cc>)
    2050:	4022      	ands	r2, r4
    2052:	659c      	str	r4, [r3, #88]	; 0x58
    2054:	0870      	lsrs	r0, r6, #1
    2056:	1e53      	subs	r3, r2, #1
    2058:	419a      	sbcs	r2, r3
    205a:	43b1      	bics	r1, r6
    205c:	f7fe fbe6 	bl	82c <_usb_handle_transfer>
    2060:	43a5      	bics	r5, r4
    2062:	0064      	lsls	r4, r4, #1
    2064:	3601      	adds	r6, #1
    2066:	e766      	b.n	1f36 <isr_irq5+0x12e>
    2068:	f7fe ff30 	bl	ecc <_usb_handle_bus_reset>
    206c:	e781      	b.n	1f72 <isr_irq5+0x16a>
    206e:	0030      	movs	r0, r6
    2070:	2260      	movs	r2, #96	; 0x60
    2072:	4213      	tst	r3, r2
    2074:	d000      	beq.n	2078 <isr_irq5+0x270>
    2076:	e744      	b.n	1f02 <isr_irq5+0xfa>
    2078:	b25b      	sxtb	r3, r3
    207a:	2b00      	cmp	r3, #0
    207c:	dac7      	bge.n	200e <isr_irq5+0x206>
    207e:	786b      	ldrb	r3, [r5, #1]
    2080:	2b00      	cmp	r3, #0
    2082:	d000      	beq.n	2086 <isr_irq5+0x27e>
    2084:	e73d      	b.n	1f02 <isr_irq5+0xfa>
    2086:	886b      	ldrh	r3, [r5, #2]
    2088:	2b00      	cmp	r3, #0
    208a:	d000      	beq.n	208e <isr_irq5+0x286>
    208c:	e739      	b.n	1f02 <isr_irq5+0xfa>
    208e:	88ec      	ldrh	r4, [r5, #6]
    2090:	2c02      	cmp	r4, #2
    2092:	d000      	beq.n	2096 <isr_irq5+0x28e>
    2094:	e735      	b.n	1f02 <isr_irq5+0xfa>
    2096:	2501      	movs	r5, #1
    2098:	3007      	adds	r0, #7
    209a:	7fc3      	ldrb	r3, [r0, #31]
    209c:	0038      	movs	r0, r7
    209e:	429d      	cmp	r5, r3
    20a0:	41ad      	sbcs	r5, r5
    20a2:	f7fe fa7b 	bl	59c <usb_current_packet_buffer>
    20a6:	6803      	ldr	r3, [r0, #0]
    20a8:	426d      	negs	r5, r5
    20aa:	601d      	str	r5, [r3, #0]
    20ac:	7104      	strb	r4, [r0, #4]
    20ae:	e6e9      	b.n	1e84 <isr_irq5+0x7c>
    20b0:	0038      	movs	r0, r7
    20b2:	e7dd      	b.n	2070 <isr_irq5+0x268>
    20b4:	50110098 	.word	0x50110098
    20b8:	50100f68 	.word	0x50100f68
    20bc:	50100f94 	.word	0x50100f94
    20c0:	50100000 	.word	0x50100000
    20c4:	501009ec 	.word	0x501009ec
    20c8:	00003f32 	.word	0x00003f32
    20cc:	0000045d 	.word	0x0000045d
    20d0:	501009c4 	.word	0x501009c4
    20d4:	50113000 	.word	0x50113000
    20d8:	50110000 	.word	0x50110000
    20dc:	50100a08 	.word	0x50100a08

000020e0 <impl_usb_transfer_current_packet_only>:
    20e0:	b510      	push	{r4, lr}
    20e2:	f7fe fbdd 	bl	8a0 <usb_packet_done>
    20e6:	bd10      	pop	{r4, pc}

000020e8 <async_task_worker>:
    20e8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    20ea:	4a1a      	ldr	r2, [pc, #104]	; (2154 <async_task_worker+0x6c>)
    20ec:	4b1a      	ldr	r3, [pc, #104]	; (2158 <async_task_worker+0x70>)
    20ee:	601a      	str	r2, [r3, #0]
    20f0:	f3ef 8510 	mrs	r5, PRIMASK
    20f4:	b672      	cpsid	i
    20f6:	f3bf 8f5f 	dmb	sy
    20fa:	4c18      	ldr	r4, [pc, #96]	; (215c <async_task_worker+0x74>)
    20fc:	0027      	movs	r7, r4
    20fe:	3728      	adds	r7, #40	; 0x28
    2100:	783b      	ldrb	r3, [r7, #0]
    2102:	b2de      	uxtb	r6, r3
    2104:	2b00      	cmp	r3, #0
    2106:	d113      	bne.n	2130 <async_task_worker+0x48>
    2108:	f385 8810 	msr	PRIMASK, r5
    210c:	f3ef 8510 	mrs	r5, PRIMASK
    2110:	b672      	cpsid	i
    2112:	f3bf 8f5f 	dmb	sy
    2116:	4c12      	ldr	r4, [pc, #72]	; (2160 <async_task_worker+0x78>)
    2118:	0027      	movs	r7, r4
    211a:	3728      	adds	r7, #40	; 0x28
    211c:	783b      	ldrb	r3, [r7, #0]
    211e:	2b00      	cmp	r3, #0
    2120:	d013      	beq.n	214a <async_task_worker+0x62>
    2122:	2228      	movs	r2, #40	; 0x28
    2124:	0021      	movs	r1, r4
    2126:	480f      	ldr	r0, [pc, #60]	; (2164 <async_task_worker+0x7c>)
    2128:	f000 fa8a 	bl	2640 <__memcpy>
    212c:	703e      	strb	r6, [r7, #0]
    212e:	e006      	b.n	213e <async_task_worker+0x56>
    2130:	2228      	movs	r2, #40	; 0x28
    2132:	0021      	movs	r1, r4
    2134:	480b      	ldr	r0, [pc, #44]	; (2164 <async_task_worker+0x7c>)
    2136:	f000 fa83 	bl	2640 <__memcpy>
    213a:	2300      	movs	r3, #0
    213c:	703b      	strb	r3, [r7, #0]
    213e:	f385 8810 	msr	PRIMASK, r5
    2142:	0020      	movs	r0, r4
    2144:	f7fe fd4a 	bl	bdc <execute_task.constprop.0>
    2148:	e7d2      	b.n	20f0 <async_task_worker+0x8>
    214a:	f385 8810 	msr	PRIMASK, r5
    214e:	bf20      	wfe
    2150:	e7ce      	b.n	20f0 <async_task_worker+0x8>
    2152:	46c0      	nop			; (mov r8, r8)
    2154:	00003ecc 	.word	0x00003ecc
    2158:	50100dbc 	.word	0x50100dbc
    215c:	50100fc0 	.word	0x50100fc0
    2160:	50100e84 	.word	0x50100e84
    2164:	50100d8c 	.word	0x50100d8c

00002168 <impl_picoboot_cmd_packet>:
    2168:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    216a:	9001      	str	r0, [sp, #4]
    216c:	f7fe fa16 	bl	59c <usb_current_packet_buffer>
    2170:	7903      	ldrb	r3, [r0, #4]
    2172:	2b20      	cmp	r3, #32
    2174:	d000      	beq.n	2178 <impl_picoboot_cmd_packet+0x10>
    2176:	e09e      	b.n	22b6 <impl_picoboot_cmd_packet+0x14e>
    2178:	6806      	ldr	r6, [r0, #0]
    217a:	4b53      	ldr	r3, [pc, #332]	; (22c8 <impl_picoboot_cmd_packet+0x160>)
    217c:	6832      	ldr	r2, [r6, #0]
    217e:	429a      	cmp	r2, r3
    2180:	d000      	beq.n	2184 <impl_picoboot_cmd_packet+0x1c>
    2182:	e098      	b.n	22b6 <impl_picoboot_cmd_packet+0x14e>
    2184:	4c51      	ldr	r4, [pc, #324]	; (22cc <impl_picoboot_cmd_packet+0x164>)
    2186:	2128      	movs	r1, #40	; 0x28
    2188:	0020      	movs	r0, r4
    218a:	302c      	adds	r0, #44	; 0x2c
    218c:	f7fe feda 	bl	f44 <memset0>
    2190:	4a4f      	ldr	r2, [pc, #316]	; (22d0 <impl_picoboot_cmd_packet+0x168>)
    2192:	6813      	ldr	r3, [r2, #0]
    2194:	3b01      	subs	r3, #1
    2196:	6013      	str	r3, [r2, #0]
    2198:	6872      	ldr	r2, [r6, #4]
    219a:	62e3      	str	r3, [r4, #44]	; 0x2c
    219c:	64e2      	str	r2, [r4, #76]	; 0x4c
    219e:	7a33      	ldrb	r3, [r6, #8]
    21a0:	9300      	str	r3, [sp, #0]
    21a2:	4b4c      	ldr	r3, [pc, #304]	; (22d4 <impl_picoboot_cmd_packet+0x16c>)
    21a4:	9900      	ldr	r1, [sp, #0]
    21a6:	601a      	str	r2, [r3, #0]
    21a8:	2200      	movs	r2, #0
    21aa:	725a      	strb	r2, [r3, #9]
    21ac:	3201      	adds	r2, #1
    21ae:	605a      	str	r2, [r3, #4]
    21b0:	6932      	ldr	r2, [r6, #16]
    21b2:	7219      	strb	r1, [r3, #8]
    21b4:	63e2      	str	r2, [r4, #60]	; 0x3c
    21b6:	63a2      	str	r2, [r4, #56]	; 0x38
    21b8:	4694      	mov	ip, r2
    21ba:	0022      	movs	r2, r4
    21bc:	6971      	ldr	r1, [r6, #20]
    21be:	3251      	adds	r2, #81	; 0x51
    21c0:	6421      	str	r1, [r4, #64]	; 0x40
    21c2:	7c30      	ldrb	r0, [r6, #16]
    21c4:	7010      	strb	r0, [r2, #0]
    21c6:	227f      	movs	r2, #127	; 0x7f
    21c8:	9800      	ldr	r0, [sp, #0]
    21ca:	4002      	ands	r2, r0
    21cc:	1e50      	subs	r0, r2, #1
    21ce:	2808      	cmp	r0, #8
    21d0:	d900      	bls.n	21d4 <impl_picoboot_cmd_packet+0x6c>
    21d2:	e070      	b.n	22b6 <impl_picoboot_cmd_packet+0x14e>
    21d4:	2003      	movs	r0, #3
    21d6:	4342      	muls	r2, r0
    21d8:	483f      	ldr	r0, [pc, #252]	; (22d8 <impl_picoboot_cmd_packet+0x170>)
    21da:	7a77      	ldrb	r7, [r6, #9]
    21dc:	5c85      	ldrb	r5, [r0, r2]
    21de:	42af      	cmp	r7, r5
    21e0:	d161      	bne.n	22a6 <impl_picoboot_cmd_packet+0x13e>
    21e2:	2500      	movs	r5, #0
    21e4:	1880      	adds	r0, r0, r2
    21e6:	605d      	str	r5, [r3, #4]
    21e8:	7843      	ldrb	r3, [r0, #1]
    21ea:	7840      	ldrb	r0, [r0, #1]
    21ec:	000d      	movs	r5, r1
    21ee:	b240      	sxtb	r0, r0
    21f0:	2800      	cmp	r0, #0
    21f2:	db00      	blt.n	21f6 <impl_picoboot_cmd_packet+0x8e>
    21f4:	001d      	movs	r5, r3
    21f6:	68f3      	ldr	r3, [r6, #12]
    21f8:	42ab      	cmp	r3, r5
    21fa:	d156      	bne.n	22aa <impl_picoboot_cmd_packet+0x142>
    21fc:	4b36      	ldr	r3, [pc, #216]	; (22d8 <impl_picoboot_cmd_packet+0x170>)
    21fe:	189a      	adds	r2, r3, r2
    2200:	9b00      	ldr	r3, [sp, #0]
    2202:	7897      	ldrb	r7, [r2, #2]
    2204:	2b02      	cmp	r3, #2
    2206:	d109      	bne.n	221c <impl_picoboot_cmd_packet+0xb4>
    2208:	4660      	mov	r0, ip
    220a:	69b2      	ldr	r2, [r6, #24]
    220c:	f7fe fbf6 	bl	9fc <watchdog_reboot>
    2210:	f7fe fc80 	bl	b14 <_picoboot_ack>
    2214:	9801      	ldr	r0, [sp, #4]
    2216:	f7fe fb43 	bl	8a0 <usb_packet_done>
    221a:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
    221c:	2f00      	cmp	r7, #0
    221e:	d047      	beq.n	22b0 <impl_picoboot_cmd_packet+0x148>
    2220:	0023      	movs	r3, r4
    2222:	3350      	adds	r3, #80	; 0x50
    2224:	701f      	strb	r7, [r3, #0]
    2226:	0023      	movs	r3, r4
    2228:	2202      	movs	r2, #2
    222a:	2601      	movs	r6, #1
    222c:	3352      	adds	r3, #82	; 0x52
    222e:	701a      	strb	r2, [r3, #0]
    2230:	4b28      	ldr	r3, [pc, #160]	; (22d4 <impl_picoboot_cmd_packet+0x16c>)
    2232:	725e      	strb	r6, [r3, #9]
    2234:	2d00      	cmp	r5, #0
    2236:	d028      	beq.n	228a <impl_picoboot_cmd_packet+0x122>
    2238:	4b28      	ldr	r3, [pc, #160]	; (22dc <impl_picoboot_cmd_packet+0x174>)
    223a:	4a29      	ldr	r2, [pc, #164]	; (22e0 <impl_picoboot_cmd_packet+0x178>)
    223c:	6463      	str	r3, [r4, #68]	; 0x44
    223e:	6223      	str	r3, [r4, #32]
    2240:	2380      	movs	r3, #128	; 0x80
    2242:	005b      	lsls	r3, r3, #1
    2244:	61e3      	str	r3, [r4, #28]
    2246:	2300      	movs	r3, #0
    2248:	62a2      	str	r2, [r4, #40]	; 0x28
    224a:	6163      	str	r3, [r4, #20]
    224c:	4a25      	ldr	r2, [pc, #148]	; (22e4 <impl_picoboot_cmd_packet+0x17c>)
    224e:	61a5      	str	r5, [r4, #24]
    2250:	0020      	movs	r0, r4
    2252:	4925      	ldr	r1, [pc, #148]	; (22e8 <impl_picoboot_cmd_packet+0x180>)
    2254:	f7fe f90c 	bl	470 <usb_reset_transfer>
    2258:	353f      	adds	r5, #63	; 0x3f
    225a:	68a3      	ldr	r3, [r4, #8]
    225c:	09ad      	lsrs	r5, r5, #6
    225e:	195b      	adds	r3, r3, r5
    2260:	60a3      	str	r3, [r4, #8]
    2262:	68e3      	ldr	r3, [r4, #12]
    2264:	003a      	movs	r2, r7
    2266:	195d      	adds	r5, r3, r5
    2268:	2308      	movs	r3, #8
    226a:	60e5      	str	r5, [r4, #12]
    226c:	401a      	ands	r2, r3
    226e:	421f      	tst	r7, r3
    2270:	d003      	beq.n	227a <impl_picoboot_cmd_packet+0x112>
    2272:	4b1e      	ldr	r3, [pc, #120]	; (22ec <impl_picoboot_cmd_packet+0x184>)
    2274:	6263      	str	r3, [r4, #36]	; 0x24
    2276:	60dc      	str	r4, [r3, #12]
    2278:	e7cc      	b.n	2214 <impl_picoboot_cmd_packet+0xac>
    227a:	481d      	ldr	r0, [pc, #116]	; (22f0 <impl_picoboot_cmd_packet+0x188>)
    227c:	74a6      	strb	r6, [r4, #18]
    227e:	6260      	str	r0, [r4, #36]	; 0x24
    2280:	6084      	str	r4, [r0, #8]
    2282:	60c2      	str	r2, [r0, #12]
    2284:	f7fe f9f4 	bl	670 <_usb_give_as_many_buffers_as_possible>
    2288:	e7c4      	b.n	2214 <impl_picoboot_cmd_packet+0xac>
    228a:	481a      	ldr	r0, [pc, #104]	; (22f4 <impl_picoboot_cmd_packet+0x18c>)
    228c:	0021      	movs	r1, r4
    228e:	0005      	movs	r5, r0
    2290:	4b19      	ldr	r3, [pc, #100]	; (22f8 <impl_picoboot_cmd_packet+0x190>)
    2292:	3528      	adds	r5, #40	; 0x28
    2294:	6363      	str	r3, [r4, #52]	; 0x34
    2296:	2228      	movs	r2, #40	; 0x28
    2298:	312c      	adds	r1, #44	; 0x2c
    229a:	782b      	ldrb	r3, [r5, #0]
    229c:	f000 f9d0 	bl	2640 <__memcpy>
    22a0:	702e      	strb	r6, [r5, #0]
    22a2:	bf40      	sev
    22a4:	e7b6      	b.n	2214 <impl_picoboot_cmd_packet+0xac>
    22a6:	2202      	movs	r2, #2
    22a8:	e004      	b.n	22b4 <impl_picoboot_cmd_packet+0x14c>
    22aa:	9b00      	ldr	r3, [sp, #0]
    22ac:	2b02      	cmp	r3, #2
    22ae:	d0ab      	beq.n	2208 <impl_picoboot_cmd_packet+0xa0>
    22b0:	2203      	movs	r2, #3
    22b2:	4b08      	ldr	r3, [pc, #32]	; (22d4 <impl_picoboot_cmd_packet+0x16c>)
    22b4:	605a      	str	r2, [r3, #4]
    22b6:	2102      	movs	r1, #2
    22b8:	480d      	ldr	r0, [pc, #52]	; (22f0 <impl_picoboot_cmd_packet+0x188>)
    22ba:	f7fe fa8f 	bl	7dc <_usb_stall_endpoint>
    22be:	2102      	movs	r1, #2
    22c0:	480a      	ldr	r0, [pc, #40]	; (22ec <impl_picoboot_cmd_packet+0x184>)
    22c2:	f7fe fa8b 	bl	7dc <_usb_stall_endpoint>
    22c6:	e7a5      	b.n	2214 <impl_picoboot_cmd_packet+0xac>
    22c8:	431fd10b 	.word	0x431fd10b
    22cc:	50100ac8 	.word	0x50100ac8
    22d0:	50100eb0 	.word	0x50100eb0
    22d4:	50100ab8 	.word	0x50100ab8
    22d8:	00003eac 	.word	0x00003eac
    22dc:	501008c4 	.word	0x501008c4
    22e0:	00003df0 	.word	0x00003df0
    22e4:	00000b15 	.word	0x00000b15
    22e8:	00003e17 	.word	0x00003e17
    22ec:	50100e58 	.word	0x50100e58
    22f0:	50100e24 	.word	0x50100e24
    22f4:	50100e84 	.word	0x50100e84
    22f8:	00000b45 	.word	0x00000b45

000022fc <impl_picoboot_on_stream_chunk>:
    22fc:	b570      	push	{r4, r5, r6, lr}
    22fe:	4c09      	ldr	r4, [pc, #36]	; (2324 <impl_picoboot_on_stream_chunk+0x28>)
    2300:	4b09      	ldr	r3, [pc, #36]	; (2328 <impl_picoboot_on_stream_chunk+0x2c>)
    2302:	64a0      	str	r0, [r4, #72]	; 0x48
    2304:	4809      	ldr	r0, [pc, #36]	; (232c <impl_picoboot_on_stream_chunk+0x30>)
    2306:	0021      	movs	r1, r4
    2308:	0005      	movs	r5, r0
    230a:	6363      	str	r3, [r4, #52]	; 0x34
    230c:	3528      	adds	r5, #40	; 0x28
    230e:	2228      	movs	r2, #40	; 0x28
    2310:	312c      	adds	r1, #44	; 0x2c
    2312:	782b      	ldrb	r3, [r5, #0]
    2314:	f000 f994 	bl	2640 <__memcpy>
    2318:	2001      	movs	r0, #1
    231a:	7028      	strb	r0, [r5, #0]
    231c:	bf40      	sev
    231e:	3453      	adds	r4, #83	; 0x53
    2320:	7020      	strb	r0, [r4, #0]
    2322:	bd70      	pop	{r4, r5, r6, pc}
    2324:	50100ac8 	.word	0x50100ac8
    2328:	00000e59 	.word	0x00000e59
    232c:	50100e84 	.word	0x50100e84

00002330 <flash_enter_cmd_xip>:
    2330:	23c0      	movs	r3, #192	; 0xc0
    2332:	2200      	movs	r2, #0
    2334:	055b      	lsls	r3, r3, #21
    2336:	609a      	str	r2, [r3, #8]
    2338:	4a04      	ldr	r2, [pc, #16]	; (234c <flash_enter_cmd_xip+0x1c>)
    233a:	4905      	ldr	r1, [pc, #20]	; (2350 <flash_enter_cmd_xip+0x20>)
    233c:	601a      	str	r2, [r3, #0]
    233e:	001a      	movs	r2, r3
    2340:	32f4      	adds	r2, #244	; 0xf4
    2342:	6011      	str	r1, [r2, #0]
    2344:	2201      	movs	r2, #1
    2346:	609a      	str	r2, [r3, #8]
    2348:	4770      	bx	lr
    234a:	46c0      	nop			; (mov r8, r8)
    234c:	001f0300 	.word	0x001f0300
    2350:	03000218 	.word	0x03000218

00002354 <_do_flash_enter_cmd_xip>:
    2354:	b510      	push	{r4, lr}
    2356:	f7ff ffeb 	bl	2330 <flash_enter_cmd_xip>
    235a:	2000      	movs	r0, #0
    235c:	bd10      	pop	{r4, pc}
    235e:	be00      	bkpt	0x0000

00002360 <flash_flush_cache>:
    2360:	22a0      	movs	r2, #160	; 0xa0
    2362:	2301      	movs	r3, #1
    2364:	b510      	push	{r4, lr}
    2366:	0552      	lsls	r2, r2, #21
    2368:	6053      	str	r3, [r2, #4]
    236a:	6852      	ldr	r2, [r2, #4]
    236c:	4a02      	ldr	r2, [pc, #8]	; (2378 <flash_flush_cache+0x18>)
    236e:	2000      	movs	r0, #0
    2370:	6013      	str	r3, [r2, #0]
    2372:	f7fe fc0d 	bl	b90 <flash_cs_force>
    2376:	bd10      	pop	{r4, pc}
    2378:	14002000 	.word	0x14002000

0000237c <flash_range_erase>:
    237c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    237e:	0004      	movs	r4, r0
    2380:	0015      	movs	r5, r2
    2382:	001f      	movs	r7, r3
    2384:	1846      	adds	r6, r0, r1
    2386:	42b4      	cmp	r4, r6
    2388:	d205      	bcs.n	2396 <flash_range_erase+0x1a>
    238a:	22c0      	movs	r2, #192	; 0xc0
    238c:	4b0c      	ldr	r3, [pc, #48]	; (23c0 <flash_range_erase+0x44>)
    238e:	0292      	lsls	r2, r2, #10
    2390:	681b      	ldr	r3, [r3, #0]
    2392:	4213      	tst	r3, r2
    2394:	d000      	beq.n	2398 <flash_range_erase+0x1c>
    2396:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2398:	1e6b      	subs	r3, r5, #1
    239a:	421c      	tst	r4, r3
    239c:	d108      	bne.n	23b0 <flash_range_erase+0x34>
    239e:	1b33      	subs	r3, r6, r4
    23a0:	42ab      	cmp	r3, r5
    23a2:	d305      	bcc.n	23b0 <flash_range_erase+0x34>
    23a4:	0020      	movs	r0, r4
    23a6:	0039      	movs	r1, r7
    23a8:	f7ff fa5e 	bl	1868 <flash_user_erase>
    23ac:	1964      	adds	r4, r4, r5
    23ae:	e7ea      	b.n	2386 <flash_range_erase+0xa>
    23b0:	0020      	movs	r0, r4
    23b2:	2120      	movs	r1, #32
    23b4:	f7ff fa58 	bl	1868 <flash_user_erase>
    23b8:	2380      	movs	r3, #128	; 0x80
    23ba:	015b      	lsls	r3, r3, #5
    23bc:	18e4      	adds	r4, r4, r3
    23be:	e7e2      	b.n	2386 <flash_range_erase+0xa>
    23c0:	4001801c 	.word	0x4001801c

000023c4 <flash_range_program>:
    23c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    23c6:	0005      	movs	r5, r0
    23c8:	000f      	movs	r7, r1
    23ca:	0004      	movs	r4, r0
    23cc:	1886      	adds	r6, r0, r2
    23ce:	1b79      	subs	r1, r7, r5
    23d0:	1909      	adds	r1, r1, r4
    23d2:	42b4      	cmp	r4, r6
    23d4:	d205      	bcs.n	23e2 <flash_range_program+0x1e>
    23d6:	22c0      	movs	r2, #192	; 0xc0
    23d8:	4b05      	ldr	r3, [pc, #20]	; (23f0 <flash_range_program+0x2c>)
    23da:	0292      	lsls	r2, r2, #10
    23dc:	681b      	ldr	r3, [r3, #0]
    23de:	4213      	tst	r3, r2
    23e0:	d000      	beq.n	23e4 <flash_range_program+0x20>
    23e2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    23e4:	0020      	movs	r0, r4
    23e6:	3401      	adds	r4, #1
    23e8:	f7ff fa59 	bl	189e <flash_page_program>
    23ec:	34ff      	adds	r4, #255	; 0xff
    23ee:	e7ee      	b.n	23ce <flash_range_program+0xa>
    23f0:	4001801c 	.word	0x4001801c

000023f4 <flash_exit_xip>:
    23f4:	2301      	movs	r3, #1
    23f6:	b5f0      	push	{r4, r5, r6, r7, lr}
    23f8:	b085      	sub	sp, #20
    23fa:	425b      	negs	r3, r3
    23fc:	af03      	add	r7, sp, #12
    23fe:	803b      	strh	r3, [r7, #0]
    2400:	23c0      	movs	r3, #192	; 0xc0
    2402:	2200      	movs	r2, #0
    2404:	055b      	lsls	r3, r3, #21
    2406:	609a      	str	r2, [r3, #8]
    2408:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    240a:	6c9a      	ldr	r2, [r3, #72]	; 0x48
    240c:	2206      	movs	r2, #6
    240e:	615a      	str	r2, [r3, #20]
    2410:	22e0      	movs	r2, #224	; 0xe0
    2412:	02d2      	lsls	r2, r2, #11
    2414:	601a      	str	r2, [r3, #0]
    2416:	2201      	movs	r2, #1
    2418:	4c1f      	ldr	r4, [pc, #124]	; (2498 <flash_exit_xip+0xa4>)
    241a:	611a      	str	r2, [r3, #16]
    241c:	609a      	str	r2, [r3, #8]
    241e:	6826      	ldr	r6, [r4, #0]
    2420:	238c      	movs	r3, #140	; 0x8c
    2422:	0032      	movs	r2, r6
    2424:	2584      	movs	r5, #132	; 0x84
    2426:	439a      	bics	r2, r3
    2428:	2003      	movs	r0, #3
    242a:	4315      	orrs	r5, r2
    242c:	f7fe fbb0 	bl	b90 <flash_cs_force>
    2430:	2302      	movs	r3, #2
    2432:	9301      	str	r3, [sp, #4]
    2434:	2380      	movs	r3, #128	; 0x80
    2436:	6025      	str	r5, [r4, #0]
    2438:	011b      	lsls	r3, r3, #4
    243a:	6065      	str	r5, [r4, #4]
    243c:	60a5      	str	r5, [r4, #8]
    243e:	60e5      	str	r5, [r4, #12]
    2440:	3b01      	subs	r3, #1
    2442:	d1fd      	bne.n	2440 <flash_exit_xip+0x4c>
    2444:	2300      	movs	r3, #0
    2446:	2204      	movs	r2, #4
    2448:	0019      	movs	r1, r3
    244a:	0018      	movs	r0, r3
    244c:	f7ff f994 	bl	1778 <flash_put_get>
    2450:	230c      	movs	r3, #12
    2452:	2108      	movs	r1, #8
    2454:	439d      	bics	r5, r3
    2456:	2002      	movs	r0, #2
    2458:	430d      	orrs	r5, r1
    245a:	f7fe fb99 	bl	b90 <flash_cs_force>
    245e:	9901      	ldr	r1, [sp, #4]
    2460:	2901      	cmp	r1, #1
    2462:	d116      	bne.n	2492 <flash_exit_xip+0x9e>
    2464:	220c      	movs	r2, #12
    2466:	6026      	str	r6, [r4, #0]
    2468:	6066      	str	r6, [r4, #4]
    246a:	4396      	bics	r6, r2
    246c:	0033      	movs	r3, r6
    246e:	2608      	movs	r6, #8
    2470:	431e      	orrs	r6, r3
    2472:	60a6      	str	r6, [r4, #8]
    2474:	2002      	movs	r0, #2
    2476:	60e6      	str	r6, [r4, #12]
    2478:	f7fe fb8a 	bl	b90 <flash_cs_force>
    247c:	2300      	movs	r3, #0
    247e:	2202      	movs	r2, #2
    2480:	0019      	movs	r1, r3
    2482:	0038      	movs	r0, r7
    2484:	f7ff f978 	bl	1778 <flash_put_get>
    2488:	2200      	movs	r2, #0
    248a:	4b04      	ldr	r3, [pc, #16]	; (249c <flash_exit_xip+0xa8>)
    248c:	601a      	str	r2, [r3, #0]
    248e:	b005      	add	sp, #20
    2490:	bdf0      	pop	{r4, r5, r6, r7, pc}
    2492:	2301      	movs	r3, #1
    2494:	e7cd      	b.n	2432 <flash_exit_xip+0x3e>
    2496:	46c0      	nop			; (mov r8, r8)
    2498:	40020008 	.word	0x40020008
    249c:	4001800c 	.word	0x4001800c

000024a0 <connect_internal_flash>:
    24a0:	2090      	movs	r0, #144	; 0x90
    24a2:	4b07      	ldr	r3, [pc, #28]	; (24c0 <connect_internal_flash+0x20>)
    24a4:	0080      	lsls	r0, r0, #2
    24a6:	b510      	push	{r4, lr}
    24a8:	6018      	str	r0, [r3, #0]
    24aa:	f7fe fb8b 	bl	bc4 <unreset_block_wait.lto_priv.0>
    24ae:	2200      	movs	r2, #0
    24b0:	4b04      	ldr	r3, [pc, #16]	; (24c4 <connect_internal_flash+0x24>)
    24b2:	605a      	str	r2, [r3, #4]
    24b4:	60da      	str	r2, [r3, #12]
    24b6:	615a      	str	r2, [r3, #20]
    24b8:	61da      	str	r2, [r3, #28]
    24ba:	625a      	str	r2, [r3, #36]	; 0x24
    24bc:	62da      	str	r2, [r3, #44]	; 0x2c
    24be:	bd10      	pop	{r4, pc}
    24c0:	4000e000 	.word	0x4000e000
    24c4:	40018000 	.word	0x40018000

000024c8 <_do_flash_exit_xip>:
    24c8:	b510      	push	{r4, lr}
    24ca:	f7ff ffe9 	bl	24a0 <connect_internal_flash>
    24ce:	f7ff ff91 	bl	23f4 <flash_exit_xip>
    24d2:	4b04      	ldr	r3, [pc, #16]	; (24e4 <_do_flash_exit_xip+0x1c>)
    24d4:	681b      	ldr	r3, [r3, #0]
    24d6:	2b00      	cmp	r3, #0
    24d8:	d001      	beq.n	24de <_do_flash_exit_xip+0x16>
    24da:	f7fe fd0d 	bl	ef8 <gpio_setup.part.0>
    24de:	2000      	movs	r0, #0
    24e0:	bd10      	pop	{r4, pc}
    24e2:	46c0      	nop			; (mov r8, r8)
    24e4:	50100f64 	.word	0x50100f64

000024e8 <main>:
    24e8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    24ea:	4a2b      	ldr	r2, [pc, #172]	; (2598 <main+0xb0>)
    24ec:	4b2b      	ldr	r3, [pc, #172]	; (259c <main+0xb4>)
    24ee:	6013      	str	r3, [r2, #0]
    24f0:	4a2b      	ldr	r2, [pc, #172]	; (25a0 <main+0xb8>)
    24f2:	6013      	str	r3, [r2, #0]
    24f4:	2202      	movs	r2, #2
    24f6:	4b2b      	ldr	r3, [pc, #172]	; (25a4 <main+0xbc>)
    24f8:	681b      	ldr	r3, [r3, #0]
    24fa:	4213      	tst	r3, r2
    24fc:	d008      	beq.n	2510 <main+0x28>
    24fe:	2105      	movs	r1, #5
    2500:	4b29      	ldr	r3, [pc, #164]	; (25a8 <main+0xc0>)
    2502:	6019      	str	r1, [r3, #0]
    2504:	23d0      	movs	r3, #208	; 0xd0
    2506:	061b      	lsls	r3, r3, #24
    2508:	631a      	str	r2, [r3, #48]	; 0x30
    250a:	641a      	str	r2, [r3, #64]	; 0x40
    250c:	2200      	movs	r2, #0
    250e:	641a      	str	r2, [r3, #64]	; 0x40
    2510:	23c8      	movs	r3, #200	; 0xc8
    2512:	005b      	lsls	r3, r3, #1
    2514:	3b01      	subs	r3, #1
    2516:	d1fd      	bne.n	2514 <main+0x2c>
    2518:	20d0      	movs	r0, #208	; 0xd0
    251a:	2409      	movs	r4, #9
    251c:	2200      	movs	r2, #0
    251e:	2504      	movs	r5, #4
    2520:	2101      	movs	r1, #1
    2522:	0600      	lsls	r0, r0, #24
    2524:	002b      	movs	r3, r5
    2526:	3b01      	subs	r3, #1
    2528:	d1fd      	bne.n	2526 <main+0x3e>
    252a:	6883      	ldr	r3, [r0, #8]
    252c:	3c01      	subs	r4, #1
    252e:	085b      	lsrs	r3, r3, #1
    2530:	400b      	ands	r3, r1
    2532:	18d2      	adds	r2, r2, r3
    2534:	2c00      	cmp	r4, #0
    2536:	d1f5      	bne.n	2524 <main+0x3c>
    2538:	2a04      	cmp	r2, #4
    253a:	d923      	bls.n	2584 <main+0x9c>
    253c:	26c0      	movs	r6, #192	; 0xc0
    253e:	f7ff ffaf 	bl	24a0 <connect_internal_flash>
    2542:	f7ff ff57 	bl	23f4 <flash_exit_xip>
    2546:	0576      	lsls	r6, r6, #21
    2548:	2700      	movs	r7, #0
    254a:	22c0      	movs	r2, #192	; 0xc0
    254c:	60b7      	str	r7, [r6, #8]
    254e:	6833      	ldr	r3, [r6, #0]
    2550:	4d16      	ldr	r5, [pc, #88]	; (25ac <main+0xc4>)
    2552:	4393      	bics	r3, r2
    2554:	b2e2      	uxtb	r2, r4
    2556:	4313      	orrs	r3, r2
    2558:	6033      	str	r3, [r6, #0]
    255a:	2301      	movs	r3, #1
    255c:	0029      	movs	r1, r5
    255e:	60b3      	str	r3, [r6, #8]
    2560:	0038      	movs	r0, r7
    2562:	f7ff f93d 	bl	17e0 <flash_read_data.constprop.0>
    2566:	2201      	movs	r2, #1
    2568:	21fc      	movs	r1, #252	; 0xfc
    256a:	0028      	movs	r0, r5
    256c:	4252      	negs	r2, r2
    256e:	f000 f833 	bl	25d8 <crc32_small>
    2572:	4b0f      	ldr	r3, [pc, #60]	; (25b0 <main+0xc8>)
    2574:	681b      	ldr	r3, [r3, #0]
    2576:	4298      	cmp	r0, r3
    2578:	d008      	beq.n	258c <main+0xa4>
    257a:	2380      	movs	r3, #128	; 0x80
    257c:	3440      	adds	r4, #64	; 0x40
    257e:	019b      	lsls	r3, r3, #6
    2580:	429c      	cmp	r4, r3
    2582:	d1e1      	bne.n	2548 <main+0x60>
    2584:	2100      	movs	r1, #0
    2586:	0008      	movs	r0, r1
    2588:	f7ff f9a4 	bl	18d4 <_usb_boot>
    258c:	f7ff fee8 	bl	2360 <flash_flush_cache>
    2590:	3501      	adds	r5, #1
    2592:	46be      	mov	lr, r7
    2594:	4728      	bx	r5
    2596:	46c0      	nop			; (mov r8, r8)
    2598:	4000e000 	.word	0x4000e000
    259c:	00200240 	.word	0x00200240
    25a0:	4000f000 	.word	0x4000f000
    25a4:	4006c000 	.word	0x4006c000
    25a8:	4001800c 	.word	0x4001800c
    25ac:	20041f00 	.word	0x20041f00
    25b0:	20041ffc 	.word	0x20041ffc

000025b4 <reset_usb_boot>:
    25b4:	4b05      	ldr	r3, [pc, #20]	; (25cc <reset_usb_boot+0x18>)
    25b6:	b510      	push	{r4, lr}
    25b8:	220a      	movs	r2, #10
    25ba:	60d8      	str	r0, [r3, #12]
    25bc:	6119      	str	r1, [r3, #16]
    25be:	4804      	ldr	r0, [pc, #16]	; (25d0 <reset_usb_boot+0x1c>)
    25c0:	4904      	ldr	r1, [pc, #16]	; (25d4 <reset_usb_boot+0x20>)
    25c2:	f7fe fa1b 	bl	9fc <watchdog_reboot>
    25c6:	bf30      	wfi
    25c8:	e7fd      	b.n	25c6 <reset_usb_boot+0x12>
    25ca:	46c0      	nop			; (mov r8, r8)
    25cc:	40058000 	.word	0x40058000
    25d0:	00001b99 	.word	0x00001b99
    25d4:	20042000 	.word	0x20042000

000025d8 <crc32_small>:
    25d8:	b530      	push	{r4, r5, lr}
    25da:	1809      	adds	r1, r1, r0
    25dc:	4d5d      	ldr	r5, [pc, #372]	; (2754 <_memset_short_end+0x4>)
    25de:	e00c      	b.n	25fa <byte_loop_test>

000025e0 <byte_loop>:
    25e0:	7804      	ldrb	r4, [r0, #0]
    25e2:	ba13      	rev	r3, r2
    25e4:	405c      	eors	r4, r3
    25e6:	0624      	lsls	r4, r4, #24
    25e8:	2308      	movs	r3, #8

000025ea <bit_loop>:
    25ea:	0064      	lsls	r4, r4, #1
    25ec:	d300      	bcc.n	25f0 <no_bit>
    25ee:	406c      	eors	r4, r5

000025f0 <no_bit>:
    25f0:	3b01      	subs	r3, #1
    25f2:	d1fa      	bne.n	25ea <bit_loop>
    25f4:	0212      	lsls	r2, r2, #8
    25f6:	4062      	eors	r2, r4
    25f8:	3001      	adds	r0, #1

000025fa <byte_loop_test>:
    25fa:	4288      	cmp	r0, r1
    25fc:	dbf0      	blt.n	25e0 <byte_loop>
    25fe:	1c10      	adds	r0, r2, #0
    2600:	bd30      	pop	{r4, r5, pc}

00002602 <poor_mans_text_decompress>:
    2602:	b530      	push	{r4, r5, lr}
    2604:	4249      	negs	r1, r1
    2606:	5c43      	ldrb	r3, [r0, r1]
    2608:	3201      	adds	r2, #1
    260a:	0a1c      	lsrs	r4, r3, #8
    260c:	41ad      	sbcs	r5, r5
    260e:	d105      	bne.n	261c <poor_mans_text_decompress+0x1a>
    2610:	b25d      	sxtb	r5, r3
    2612:	3101      	adds	r1, #1
    2614:	5c44      	ldrb	r4, [r0, r1]
    2616:	41aa      	sbcs	r2, r5
    2618:	1b14      	subs	r4, r2, r4
    261a:	5d63      	ldrb	r3, [r4, r5]
    261c:	5553      	strb	r3, [r2, r5]
    261e:	3501      	adds	r5, #1
    2620:	d1fb      	bne.n	261a <poor_mans_text_decompress+0x18>
    2622:	3101      	adds	r1, #1
    2624:	d1ef      	bne.n	2606 <poor_mans_text_decompress+0x4>
    2626:	bd30      	pop	{r4, r5, pc}

00002628 <__memcpy_44>:
    2628:	4684      	mov	ip, r0
    262a:	2a08      	cmp	r2, #8
    262c:	d33a      	bcc.n	26a4 <_memcpy_short>
    262e:	b470      	push	{r4, r5, r6}
    2630:	e01c      	b.n	266c <_memcpy_aligned>

00002632 <__memcpy_slow_lp>:
    2632:	3a01      	subs	r2, #1
    2634:	5c8b      	ldrb	r3, [r1, r2]
    2636:	5483      	strb	r3, [r0, r2]
    2638:	d1fb      	bne.n	2632 <__memcpy_slow_lp>
    263a:	4660      	mov	r0, ip
    263c:	4770      	bx	lr
    263e:	46c0      	nop			; (mov r8, r8)

00002640 <__memcpy>:
    2640:	4684      	mov	ip, r0
    2642:	2a08      	cmp	r2, #8
    2644:	d32e      	bcc.n	26a4 <_memcpy_short>
    2646:	1a43      	subs	r3, r0, r1
    2648:	079b      	lsls	r3, r3, #30
    264a:	d1f2      	bne.n	2632 <__memcpy_slow_lp>
    264c:	b470      	push	{r4, r5, r6}
    264e:	1a09      	subs	r1, r1, r0
    2650:	1c05      	adds	r5, r0, #0
    2652:	0843      	lsrs	r3, r0, #1
    2654:	d302      	bcc.n	265c <__memcpy+0x1c>
    2656:	5c44      	ldrb	r4, [r0, r1]
    2658:	7004      	strb	r4, [r0, #0]
    265a:	3001      	adds	r0, #1
    265c:	0883      	lsrs	r3, r0, #2
    265e:	d302      	bcc.n	2666 <__memcpy+0x26>
    2660:	5a44      	ldrh	r4, [r0, r1]
    2662:	8004      	strh	r4, [r0, #0]
    2664:	3002      	adds	r0, #2
    2666:	1809      	adds	r1, r1, r0
    2668:	1a2d      	subs	r5, r5, r0
    266a:	1952      	adds	r2, r2, r5

0000266c <_memcpy_aligned>:
    266c:	3a10      	subs	r2, #16
    266e:	d303      	bcc.n	2678 <_memcpy_aligned+0xc>
    2670:	c978      	ldmia	r1!, {r3, r4, r5, r6}
    2672:	c078      	stmia	r0!, {r3, r4, r5, r6}
    2674:	3a10      	subs	r2, #16
    2676:	d2fb      	bcs.n	2670 <_memcpy_aligned+0x4>
    2678:	0752      	lsls	r2, r2, #29
    267a:	d301      	bcc.n	2680 <_memcpy_aligned+0x14>
    267c:	c918      	ldmia	r1!, {r3, r4}
    267e:	c018      	stmia	r0!, {r3, r4}
    2680:	0052      	lsls	r2, r2, #1
    2682:	d301      	bcc.n	2688 <_memcpy_aligned+0x1c>
    2684:	c908      	ldmia	r1!, {r3}
    2686:	c008      	stmia	r0!, {r3}
    2688:	d009      	beq.n	269e <_memcpy_aligned+0x32>
    268a:	0052      	lsls	r2, r2, #1
    268c:	d304      	bcc.n	2698 <_memcpy_aligned+0x2c>
    268e:	880b      	ldrh	r3, [r1, #0]
    2690:	8003      	strh	r3, [r0, #0]
    2692:	d004      	beq.n	269e <_memcpy_aligned+0x32>
    2694:	3102      	adds	r1, #2
    2696:	3002      	adds	r0, #2
    2698:	d001      	beq.n	269e <_memcpy_aligned+0x32>
    269a:	780b      	ldrb	r3, [r1, #0]
    269c:	7003      	strb	r3, [r0, #0]
    269e:	bc70      	pop	{r4, r5, r6}
    26a0:	4660      	mov	r0, ip
    26a2:	4770      	bx	lr

000026a4 <_memcpy_short>:
    26a4:	a309      	add	r3, pc, #36	; (adr r3, 26cc <_memcpy_short_end>)
    26a6:	0092      	lsls	r2, r2, #2
    26a8:	1a9b      	subs	r3, r3, r2
    26aa:	3301      	adds	r3, #1
    26ac:	4718      	bx	r3
    26ae:	46c0      	nop			; (mov r8, r8)
    26b0:	798b      	ldrb	r3, [r1, #6]
    26b2:	7183      	strb	r3, [r0, #6]
    26b4:	794b      	ldrb	r3, [r1, #5]
    26b6:	7143      	strb	r3, [r0, #5]
    26b8:	790b      	ldrb	r3, [r1, #4]
    26ba:	7103      	strb	r3, [r0, #4]
    26bc:	78cb      	ldrb	r3, [r1, #3]
    26be:	70c3      	strb	r3, [r0, #3]
    26c0:	788b      	ldrb	r3, [r1, #2]
    26c2:	7083      	strb	r3, [r0, #2]
    26c4:	784b      	ldrb	r3, [r1, #1]
    26c6:	7043      	strb	r3, [r0, #1]
    26c8:	780b      	ldrb	r3, [r1, #0]
    26ca:	7003      	strb	r3, [r0, #0]

000026cc <_memcpy_short_end>:
    26cc:	4660      	mov	r0, ip
    26ce:	4770      	bx	lr

000026d0 <__memset_4>:
    26d0:	4684      	mov	ip, r0
    26d2:	b2c9      	uxtb	r1, r1
    26d4:	020b      	lsls	r3, r1, #8
    26d6:	4319      	orrs	r1, r3
    26d8:	e011      	b.n	26fe <_memset_word_boundary_with_hword_r1>
    26da:	46c0      	nop			; (mov r8, r8)

000026dc <__memset>:
    26dc:	4684      	mov	ip, r0
    26de:	2a08      	cmp	r2, #8
    26e0:	d32a      	bcc.n	2738 <_memset_short>
    26e2:	0843      	lsrs	r3, r0, #1
    26e4:	d301      	bcc.n	26ea <__memset+0xe>
    26e6:	7001      	strb	r1, [r0, #0]
    26e8:	3001      	adds	r0, #1
    26ea:	b2c9      	uxtb	r1, r1
    26ec:	020b      	lsls	r3, r1, #8
    26ee:	4319      	orrs	r1, r3
    26f0:	0883      	lsrs	r3, r0, #2
    26f2:	d301      	bcc.n	26f8 <__memset+0x1c>
    26f4:	8001      	strh	r1, [r0, #0]
    26f6:	3002      	adds	r0, #2
    26f8:	4663      	mov	r3, ip
    26fa:	1a1b      	subs	r3, r3, r0
    26fc:	18d2      	adds	r2, r2, r3

000026fe <_memset_word_boundary_with_hword_r1>:
    26fe:	ba0b      	rev	r3, r1
    2700:	4319      	orrs	r1, r3
    2702:	1c0b      	adds	r3, r1, #0
    2704:	3a10      	subs	r2, #16
    2706:	d307      	bcc.n	2718 <_memset_word_boundary_with_hword_r1+0x1a>
    2708:	b430      	push	{r4, r5}
    270a:	1c0c      	adds	r4, r1, #0
    270c:	1c0d      	adds	r5, r1, #0
    270e:	46c0      	nop			; (mov r8, r8)
    2710:	c03a      	stmia	r0!, {r1, r3, r4, r5}
    2712:	3a10      	subs	r2, #16
    2714:	d2fc      	bcs.n	2710 <_memset_word_boundary_with_hword_r1+0x12>
    2716:	bc30      	pop	{r4, r5}
    2718:	0752      	lsls	r2, r2, #29
    271a:	d300      	bcc.n	271e <_memset_word_boundary_with_hword_r1+0x20>
    271c:	c00a      	stmia	r0!, {r1, r3}
    271e:	0052      	lsls	r2, r2, #1
    2720:	d300      	bcc.n	2724 <_memset_word_boundary_with_hword_r1+0x26>
    2722:	c002      	stmia	r0!, {r1}
    2724:	d006      	beq.n	2734 <_memset_word_boundary_with_hword_r1+0x36>
    2726:	0052      	lsls	r2, r2, #1
    2728:	d302      	bcc.n	2730 <_memset_word_boundary_with_hword_r1+0x32>
    272a:	8001      	strh	r1, [r0, #0]
    272c:	d002      	beq.n	2734 <_memset_word_boundary_with_hword_r1+0x36>
    272e:	3002      	adds	r0, #2
    2730:	d000      	beq.n	2734 <_memset_word_boundary_with_hword_r1+0x36>
    2732:	7001      	strb	r1, [r0, #0]
    2734:	4660      	mov	r0, ip
    2736:	4770      	bx	lr

00002738 <_memset_short>:
    2738:	a305      	add	r3, pc, #20	; (adr r3, 2750 <_memset_short_end>)
    273a:	1a9b      	subs	r3, r3, r2
    273c:	1a9b      	subs	r3, r3, r2
    273e:	3301      	adds	r3, #1
    2740:	4718      	bx	r3
    2742:	7181      	strb	r1, [r0, #6]
    2744:	7141      	strb	r1, [r0, #5]
    2746:	7101      	strb	r1, [r0, #4]
    2748:	70c1      	strb	r1, [r0, #3]
    274a:	7081      	strb	r1, [r0, #2]
    274c:	7041      	strb	r1, [r0, #1]
    274e:	7001      	strb	r1, [r0, #0]

00002750 <_memset_short_end>:
    2750:	4660      	mov	r0, ip
    2752:	4770      	bx	lr
    2754:	04c11db7 	.word	0x04c11db7

00002758 <mufp_lib_start>:
    2758:	b505      	push	{r0, r2, lr}
    275a:	4608      	mov	r0, r1
    275c:	461a      	mov	r2, r3
    275e:	bd0a      	pop	{r1, r3, pc}

00002760 <unpackx>:
    2760:	0dc2      	lsrs	r2, r0, #23
    2762:	0240      	lsls	r0, r0, #9
    2764:	0a40      	lsrs	r0, r0, #9
    2766:	2401      	movs	r4, #1
    2768:	05e4      	lsls	r4, r4, #23
    276a:	4320      	orrs	r0, r4
    276c:	2aff      	cmp	r2, #255	; 0xff
    276e:	b2d2      	uxtb	r2, r2
    2770:	d900      	bls.n	2774 <unpackx+0x14>
    2772:	4240      	negs	r0, r0
    2774:	3a01      	subs	r2, #1
    2776:	2afe      	cmp	r2, #254	; 0xfe
    2778:	d201      	bcs.n	277e <unpackx+0x1e>
    277a:	3a7e      	subs	r2, #126	; 0x7e
    277c:	4770      	bx	lr
    277e:	2800      	cmp	r0, #0
    2780:	4620      	mov	r0, r4
    2782:	d500      	bpl.n	2786 <unpackx+0x26>
    2784:	4240      	negs	r0, r0
    2786:	3a7e      	subs	r2, #126	; 0x7e
    2788:	0092      	lsls	r2, r2, #2
    278a:	3280      	adds	r2, #128	; 0x80
    278c:	4770      	bx	lr

0000278e <packx>:
    278e:	0fc4      	lsrs	r4, r0, #31
    2790:	07e4      	lsls	r4, r4, #31
    2792:	d504      	bpl.n	279e <packx0+0x2>
    2794:	2d00      	cmp	r5, #0
    2796:	d000      	beq.n	279a <packx+0xc>
    2798:	3001      	adds	r0, #1
    279a:	4240      	negs	r0, r0

0000279c <packx0>:
    279c:	d403      	bmi.n	27a6 <packx0+0xa>
    279e:	3a01      	subs	r2, #1
    27a0:	1800      	adds	r0, r0, r0
    27a2:	d012      	beq.n	27ca <packx0+0x2e>
    27a4:	d5fb      	bpl.n	279e <packx0+0x2>
    27a6:	3281      	adds	r2, #129	; 0x81
    27a8:	d101      	bne.n	27ae <packx0+0x12>
    27aa:	3080      	adds	r0, #128	; 0x80
    27ac:	d205      	bcs.n	27ba <packx0+0x1e>
    27ae:	3080      	adds	r0, #128	; 0x80
    27b0:	d203      	bcs.n	27ba <packx0+0x1e>
    27b2:	2d00      	cmp	r5, #0
    27b4:	d00f      	beq.n	27d6 <packx0+0x3a>
    27b6:	0040      	lsls	r0, r0, #1
    27b8:	3a01      	subs	r2, #1
    27ba:	2afe      	cmp	r2, #254	; 0xfe
    27bc:	da06      	bge.n	27cc <packx0+0x30>
    27be:	3201      	adds	r2, #1
    27c0:	dd07      	ble.n	27d2 <packx0+0x36>
    27c2:	0a40      	lsrs	r0, r0, #9
    27c4:	05d2      	lsls	r2, r2, #23
    27c6:	4310      	orrs	r0, r2
    27c8:	4320      	orrs	r0, r4
    27ca:	4770      	bx	lr
    27cc:	20ff      	movs	r0, #255	; 0xff
    27ce:	05c0      	lsls	r0, r0, #23
    27d0:	e7fa      	b.n	27c8 <packx0+0x2c>
    27d2:	2000      	movs	r0, #0
    27d4:	4770      	bx	lr
    27d6:	0605      	lsls	r5, r0, #24
    27d8:	d1ed      	bne.n	27b6 <packx0+0x1a>
    27da:	0a40      	lsrs	r0, r0, #9
    27dc:	0280      	lsls	r0, r0, #10
    27de:	e7eb      	b.n	27b8 <packx0+0x1c>

000027e0 <mul0>:
    27e0:	b283      	uxth	r3, r0
    27e2:	140c      	asrs	r4, r1, #16
    27e4:	4363      	muls	r3, r4
    27e6:	1404      	asrs	r4, r0, #16
    27e8:	b28d      	uxth	r5, r1
    27ea:	436c      	muls	r4, r5
    27ec:	191b      	adds	r3, r3, r4
    27ee:	b284      	uxth	r4, r0
    27f0:	436c      	muls	r4, r5
    27f2:	0425      	lsls	r5, r4, #16
    27f4:	0c24      	lsrs	r4, r4, #16
    27f6:	191b      	adds	r3, r3, r4
    27f8:	1400      	asrs	r0, r0, #16
    27fa:	1409      	asrs	r1, r1, #16
    27fc:	4348      	muls	r0, r1
    27fe:	02c0      	lsls	r0, r0, #11
    2800:	06d9      	lsls	r1, r3, #27
    2802:	430d      	orrs	r5, r1
    2804:	1159      	asrs	r1, r3, #5
    2806:	1840      	adds	r0, r0, r1
    2808:	4770      	bx	lr

0000280a <mufp_fcmp_combined>:
    280a:	0042      	lsls	r2, r0, #1
    280c:	0e12      	lsrs	r2, r2, #24
    280e:	d001      	beq.n	2814 <mufp_fcmp_combined+0xa>
    2810:	2aff      	cmp	r2, #255	; 0xff
    2812:	d101      	bne.n	2818 <mufp_fcmp_combined+0xe>
    2814:	0dc0      	lsrs	r0, r0, #23
    2816:	05c0      	lsls	r0, r0, #23
    2818:	004a      	lsls	r2, r1, #1
    281a:	0e12      	lsrs	r2, r2, #24
    281c:	d001      	beq.n	2822 <mufp_fcmp_combined+0x18>
    281e:	2aff      	cmp	r2, #255	; 0xff
    2820:	d101      	bne.n	2826 <mufp_fcmp_fast>
    2822:	0dc9      	lsrs	r1, r1, #23
    2824:	05c9      	lsls	r1, r1, #23

00002826 <mufp_fcmp_fast>:
    2826:	2201      	movs	r2, #1
    2828:	4041      	eors	r1, r0
    282a:	d409      	bmi.n	2840 <mufp_fcmp_fast+0x1a>
    282c:	4041      	eors	r1, r0
    282e:	d500      	bpl.n	2832 <mufp_fcmp_fast+0xc>
    2830:	4252      	negs	r2, r2
    2832:	4288      	cmp	r0, r1
    2834:	dc02      	bgt.n	283c <mufp_fcmp_fast+0x16>
    2836:	db00      	blt.n	283a <mufp_fcmp_fast+0x14>
    2838:	2200      	movs	r2, #0
    283a:	4252      	negs	r2, r2
    283c:	1e10      	subs	r0, r2, #0
    283e:	4770      	bx	lr
    2840:	4301      	orrs	r1, r0
    2842:	1849      	adds	r1, r1, r1
    2844:	d0f8      	beq.n	2838 <mufp_fcmp_fast+0x12>
    2846:	2800      	cmp	r0, #0
    2848:	daf8      	bge.n	283c <mufp_fcmp_fast+0x16>
    284a:	e7f6      	b.n	283a <mufp_fcmp_fast+0x14>

0000284c <mufp_float2int>:
    284c:	2100      	movs	r1, #0

0000284e <mufp_float2fix>:
    284e:	b510      	push	{r4, lr}
    2850:	f7ff ff86 	bl	2760 <unpackx>
    2854:	0013      	movs	r3, r2
    2856:	3382      	adds	r3, #130	; 0x82
    2858:	d410      	bmi.n	287c <mufp_float2fix+0x2e>
    285a:	440a      	add	r2, r1
    285c:	3a17      	subs	r2, #23
    285e:	db07      	blt.n	2870 <mufp_float2fix+0x22>
    2860:	2a07      	cmp	r2, #7
    2862:	dd19      	ble.n	2898 <mufp_float2ufix+0x16>
    2864:	17c1      	asrs	r1, r0, #31
    2866:	43c9      	mvns	r1, r1
    2868:	2001      	movs	r0, #1
    286a:	07c0      	lsls	r0, r0, #31
    286c:	4048      	eors	r0, r1
    286e:	bd10      	pop	{r4, pc}
    2870:	4252      	negs	r2, r2
    2872:	2a20      	cmp	r2, #32
    2874:	db00      	blt.n	2878 <mufp_float2fix+0x2a>
    2876:	2220      	movs	r2, #32
    2878:	4110      	asrs	r0, r2
    287a:	bd10      	pop	{r4, pc}
    287c:	2000      	movs	r0, #0
    287e:	bd10      	pop	{r4, pc}

00002880 <mufp_float2uint>:
    2880:	2100      	movs	r1, #0

00002882 <mufp_float2ufix>:
    2882:	b510      	push	{r4, lr}
    2884:	f7ff ff6c 	bl	2760 <unpackx>
    2888:	440a      	add	r2, r1
    288a:	0001      	movs	r1, r0
    288c:	d4ee      	bmi.n	286c <mufp_float2fix+0x1e>
    288e:	3a17      	subs	r2, #23
    2890:	dbee      	blt.n	2870 <mufp_float2fix+0x22>
    2892:	43c1      	mvns	r1, r0
    2894:	2a08      	cmp	r2, #8
    2896:	dce9      	bgt.n	286c <mufp_float2fix+0x1e>
    2898:	4090      	lsls	r0, r2
    289a:	bd10      	pop	{r4, pc}

0000289c <mufp_uint642float>:
    289c:	2200      	movs	r2, #0

0000289e <mufp_ufix642float>:
    289e:	b530      	push	{r4, r5, lr}
    28a0:	2900      	cmp	r1, #0
    28a2:	d506      	bpl.n	28b2 <mufp_fix642float+0x2>
    28a4:	07cd      	lsls	r5, r1, #31
    28a6:	4305      	orrs	r5, r0
    28a8:	0848      	lsrs	r0, r1, #1
    28aa:	3a01      	subs	r2, #1
    28ac:	e010      	b.n	28d0 <mufp_fix642float+0x20>

000028ae <mufp_int642float>:
    28ae:	2200      	movs	r2, #0

000028b0 <mufp_fix642float>:
    28b0:	b530      	push	{r4, r5, lr}
    28b2:	0005      	movs	r5, r0
    28b4:	430d      	orrs	r5, r1
    28b6:	d015      	beq.n	28e4 <ret_pop45>
    28b8:	17cd      	asrs	r5, r1, #31
    28ba:	160c      	asrs	r4, r1, #24
    28bc:	42ac      	cmp	r4, r5
    28be:	d105      	bne.n	28cc <mufp_fix642float+0x1c>
    28c0:	01c9      	lsls	r1, r1, #7
    28c2:	0e44      	lsrs	r4, r0, #25
    28c4:	4321      	orrs	r1, r4
    28c6:	01c0      	lsls	r0, r0, #7
    28c8:	3207      	adds	r2, #7
    28ca:	e7f6      	b.n	28ba <mufp_fix642float+0xa>
    28cc:	0005      	movs	r5, r0
    28ce:	0008      	movs	r0, r1
    28d0:	4252      	negs	r2, r2
    28d2:	323d      	adds	r2, #61	; 0x3d
    28d4:	e004      	b.n	28e0 <packret>

000028d6 <mufp_int2float>:
    28d6:	2100      	movs	r1, #0

000028d8 <mufp_fix2float>:
    28d8:	b530      	push	{r4, r5, lr}
    28da:	221d      	movs	r2, #29
    28dc:	1a52      	subs	r2, r2, r1

000028de <packretns>:
    28de:	2500      	movs	r5, #0

000028e0 <packret>:
    28e0:	f7ff ff55 	bl	278e <packx>

000028e4 <ret_pop45>:
    28e4:	bd30      	pop	{r4, r5, pc}

000028e6 <mufp_uint2float>:
    28e6:	2100      	movs	r1, #0

000028e8 <mufp_ufix2float>:
    28e8:	b530      	push	{r4, r5, lr}
    28ea:	2800      	cmp	r0, #0
    28ec:	daf5      	bge.n	28da <mufp_fix2float+0x2>
    28ee:	221e      	movs	r2, #30
    28f0:	1a52      	subs	r2, r2, r1
    28f2:	07c5      	lsls	r5, r0, #31
    28f4:	0840      	lsrs	r0, r0, #1
    28f6:	e7f3      	b.n	28e0 <packret>

000028f8 <cordic_start>:
    28f8:	2500      	movs	r5, #0
    28fa:	46a4      	mov	ip, r4
    28fc:	e00d      	b.n	291a <cordic_rstep+0x16>

000028fe <cordic_vstep>:
    28fe:	2900      	cmp	r1, #0
    2900:	dc02      	bgt.n	2908 <cordic_rstep+0x4>
    2902:	e005      	b.n	2910 <cordic_rstep+0xc>

00002904 <cordic_rstep>:
    2904:	2a00      	cmp	r2, #0
    2906:	da03      	bge.n	2910 <cordic_rstep+0xc>
    2908:	1b89      	subs	r1, r1, r6
    290a:	427f      	negs	r7, r7
    290c:	1912      	adds	r2, r2, r4
    290e:	e001      	b.n	2914 <cordic_rstep+0x10>
    2910:	1989      	adds	r1, r1, r6
    2912:	1b12      	subs	r2, r2, r4
    2914:	4664      	mov	r4, ip
    2916:	4367      	muls	r7, r4
    2918:	1bc0      	subs	r0, r0, r7
    291a:	cb10      	ldmia	r3!, {r4}
    291c:	0864      	lsrs	r4, r4, #1
    291e:	d200      	bcs.n	2922 <cordic_rstep+0x1e>
    2920:	3501      	adds	r5, #1
    2922:	4606      	mov	r6, r0
    2924:	412e      	asrs	r6, r5
    2926:	460f      	mov	r7, r1
    2928:	412f      	asrs	r7, r5
    292a:	0864      	lsrs	r4, r4, #1
    292c:	4770      	bx	lr

0000292e <cordic_rot>:
    292e:	b5c0      	push	{r6, r7, lr}
    2930:	f7ff ffe2 	bl	28f8 <cordic_start>
    2934:	f7ff ffe6 	bl	2904 <cordic_rstep>
    2938:	d3fc      	bcc.n	2934 <cordic_rot+0x6>
    293a:	1386      	asrs	r6, r0, #14
    293c:	138f      	asrs	r7, r1, #14
    293e:	10d2      	asrs	r2, r2, #3
    2940:	4356      	muls	r6, r2
    2942:	4357      	muls	r7, r2
    2944:	4664      	mov	r4, ip
    2946:	4367      	muls	r7, r4
    2948:	1336      	asrs	r6, r6, #12
    294a:	133f      	asrs	r7, r7, #12
    294c:	1bc0      	subs	r0, r0, r7
    294e:	1989      	adds	r1, r1, r6

00002950 <cordic_exit>:
    2950:	bdc0      	pop	{r6, r7, pc}

00002952 <cordic_vec>:
    2952:	b5c0      	push	{r6, r7, lr}
    2954:	f7ff ffd0 	bl	28f8 <cordic_start>
    2958:	f7ff ffd1 	bl	28fe <cordic_vstep>
    295c:	d3fc      	bcc.n	2958 <cordic_vec+0x6>
    295e:	2900      	cmp	r1, #0
    2960:	dc02      	bgt.n	2968 <cordic_vec+0x16>
    2962:	1989      	adds	r1, r1, r6
    2964:	1b12      	subs	r2, r2, r4
    2966:	e001      	b.n	296c <cordic_vec+0x1a>
    2968:	1b89      	subs	r1, r1, r6
    296a:	1912      	adds	r2, r2, r4
    296c:	1076      	asrs	r6, r6, #1
    296e:	1064      	asrs	r4, r4, #1
    2970:	d1f5      	bne.n	295e <cordic_vec+0xc>
    2972:	e7ed      	b.n	2950 <cordic_exit>

00002974 <mufp_fsin>:
    2974:	b530      	push	{r4, r5, lr}
    2976:	2118      	movs	r1, #24
    2978:	f7ff ff69 	bl	284e <mufp_float2fix>
    297c:	4c5d      	ldr	r4, [pc, #372]	; (2af4 <pi_q29>)
    297e:	0924      	lsrs	r4, r4, #4
    2980:	1b00      	subs	r0, r0, r4
    2982:	dafd      	bge.n	2980 <mufp_fsin+0xc>
    2984:	1900      	adds	r0, r0, r4
    2986:	d4fd      	bmi.n	2984 <mufp_fsin+0x10>
    2988:	0082      	lsls	r2, r0, #2
    298a:	0065      	lsls	r5, r4, #1
    298c:	4853      	ldr	r0, [pc, #332]	; (2adc <mufp_fatan2+0x6a>)
    298e:	2100      	movs	r1, #0
    2990:	42a2      	cmp	r2, r4
    2992:	db02      	blt.n	299a <mufp_fsin+0x26>
    2994:	1b52      	subs	r2, r2, r5
    2996:	4240      	negs	r0, r0
    2998:	e7fa      	b.n	2990 <mufp_fsin+0x1c>
    299a:	00d2      	lsls	r2, r2, #3
    299c:	a355      	add	r3, pc, #340	; (adr r3, 2af4 <pi_q29>)
    299e:	2401      	movs	r4, #1
    29a0:	f7ff ffc5 	bl	292e <cordic_rot>
    29a4:	3109      	adds	r1, #9
    29a6:	2200      	movs	r2, #0
    29a8:	2300      	movs	r3, #0
    29aa:	2500      	movs	r5, #0
    29ac:	f000 f80c 	bl	29c8 <clampx>
    29b0:	f7ff feed 	bl	278e <packx>
    29b4:	f7ff fed0 	bl	2758 <mufp_lib_start>
    29b8:	f000 f806 	bl	29c8 <clampx>
    29bc:	e78f      	b.n	28de <packretns>

000029be <mufp_fcos>:
    29be:	b500      	push	{lr}
    29c0:	f7ff ffd8 	bl	2974 <mufp_fsin>
    29c4:	4608      	mov	r0, r1
    29c6:	bd00      	pop	{pc}

000029c8 <clampx>:
    29c8:	2401      	movs	r4, #1
    29ca:	0764      	lsls	r4, r4, #29
    29cc:	42a0      	cmp	r0, r4
    29ce:	dc03      	bgt.n	29d8 <clampx+0x10>
    29d0:	4264      	negs	r4, r4
    29d2:	42a0      	cmp	r0, r4
    29d4:	dd00      	ble.n	29d8 <clampx+0x10>
    29d6:	4770      	bx	lr
    29d8:	0020      	movs	r0, r4
    29da:	4770      	bx	lr

000029dc <mufp_ftan>:
    29dc:	b570      	push	{r4, r5, r6, lr}
    29de:	f7ff ffc9 	bl	2974 <mufp_fsin>
    29e2:	e18c      	b.n	2cfe <fdiv_n>

000029e4 <mufp_fexp>:
    29e4:	b530      	push	{r4, r5, lr}
    29e6:	2118      	movs	r1, #24
    29e8:	f7ff ff31 	bl	284e <mufp_float2fix>
    29ec:	1401      	asrs	r1, r0, #16
    29ee:	4a3c      	ldr	r2, [pc, #240]	; (2ae0 <mufp_fatan2+0x6e>)
    29f0:	4351      	muls	r1, r2
    29f2:	14c9      	asrs	r1, r1, #19
    29f4:	3101      	adds	r1, #1
    29f6:	1049      	asrs	r1, r1, #1
    29f8:	b402      	push	{r1}
    29fa:	0142      	lsls	r2, r0, #5
    29fc:	4839      	ldr	r0, [pc, #228]	; (2ae4 <mufp_fatan2+0x72>)
    29fe:	4341      	muls	r1, r0
    2a00:	1a52      	subs	r2, r2, r1
    2a02:	4839      	ldr	r0, [pc, #228]	; (2ae8 <mufp_fatan2+0x76>)
    2a04:	2100      	movs	r1, #0
    2a06:	a348      	add	r3, pc, #288	; (adr r3, 2b28 <tab_ch>)
    2a08:	43cc      	mvns	r4, r1
    2a0a:	f7ff ff90 	bl	292e <cordic_rot>
    2a0e:	4408      	add	r0, r1
    2a10:	bc04      	pop	{r2}
    2a12:	e764      	b.n	28de <packretns>

00002a14 <mufp_fsqrt_ln>:
    2a14:	b530      	push	{r4, r5, lr}
    2a16:	f7ff fea3 	bl	2760 <unpackx>
    2a1a:	0001      	movs	r1, r0
    2a1c:	d415      	bmi.n	2a4a <mufp_fsqrt_ln+0x36>
    2a1e:	4933      	ldr	r1, [pc, #204]	; (2aec <mufp_fatan2+0x7a>)
    2a20:	f7ff fede 	bl	27e0 <mul0>
    2a24:	1051      	asrs	r1, r2, #1
    2a26:	d301      	bcc.n	2a2c <mufp_fsqrt_ln+0x18>
    2a28:	3101      	adds	r1, #1
    2a2a:	1040      	asrs	r0, r0, #1
    2a2c:	b402      	push	{r1}
    2a2e:	4601      	mov	r1, r0
    2a30:	4b2e      	ldr	r3, [pc, #184]	; (2aec <mufp_fatan2+0x7a>)
    2a32:	009b      	lsls	r3, r3, #2
    2a34:	18c0      	adds	r0, r0, r3
    2a36:	1ac9      	subs	r1, r1, r3
    2a38:	2200      	movs	r2, #0
    2a3a:	a33b      	add	r3, pc, #236	; (adr r3, 2b28 <tab_ch>)
    2a3c:	43d4      	mvns	r4, r2
    2a3e:	f7ff ff88 	bl	2952 <cordic_vec>
    2a42:	4611      	mov	r1, r2
    2a44:	bc04      	pop	{r2}
    2a46:	0013      	movs	r3, r2
    2a48:	e749      	b.n	28de <packretns>
    2a4a:	22ff      	movs	r2, #255	; 0xff
    2a4c:	e7fb      	b.n	2a46 <mufp_fsqrt_ln+0x32>

00002a4e <mufp_fln>:
    2a4e:	b530      	push	{r4, r5, lr}
    2a50:	f7ff ffe0 	bl	2a14 <mufp_fsqrt_ln>
    2a54:	2b46      	cmp	r3, #70	; 0x46
    2a56:	dc0a      	bgt.n	2a6e <mufp_fln+0x20>
    2a58:	425b      	negs	r3, r3
    2a5a:	2b46      	cmp	r3, #70	; 0x46
    2a5c:	dc06      	bgt.n	2a6c <mufp_fln+0x1e>
    2a5e:	4824      	ldr	r0, [pc, #144]	; (2af0 <mufp_fatan2+0x7e>)
    2a60:	4358      	muls	r0, r3
    2a62:	3108      	adds	r1, #8
    2a64:	1109      	asrs	r1, r1, #4
    2a66:	1a08      	subs	r0, r1, r0
    2a68:	2205      	movs	r2, #5
    2a6a:	e738      	b.n	28de <packretns>
    2a6c:	43c0      	mvns	r0, r0
    2a6e:	22ff      	movs	r2, #255	; 0xff
    2a70:	e735      	b.n	28de <packretns>

00002a72 <mufp_fatan2>:
    2a72:	b530      	push	{r4, r5, lr}
    2a74:	f7ff fe74 	bl	2760 <unpackx>
    2a78:	f7ff fe6e 	bl	2758 <mufp_lib_start>
    2a7c:	f7ff fe70 	bl	2760 <unpackx>
    2a80:	0140      	lsls	r0, r0, #5
    2a82:	0149      	lsls	r1, r1, #5
    2a84:	18d4      	adds	r4, r2, r3
    2a86:	1264      	asrs	r4, r4, #9
    2a88:	3401      	adds	r4, #1
    2a8a:	d40a      	bmi.n	2aa2 <mufp_fatan2+0x30>
    2a8c:	1ad4      	subs	r4, r2, r3
    2a8e:	da05      	bge.n	2a9c <mufp_fatan2+0x2a>
    2a90:	4264      	negs	r4, r4
    2a92:	4120      	asrs	r0, r4
    2a94:	2c1c      	cmp	r4, #28
    2a96:	d30c      	bcc.n	2ab2 <mufp_fatan2+0x40>
    2a98:	17c0      	asrs	r0, r0, #31
    2a9a:	e00a      	b.n	2ab2 <mufp_fatan2+0x40>
    2a9c:	4121      	asrs	r1, r4
    2a9e:	2c1c      	cmp	r4, #28
    2aa0:	d307      	bcc.n	2ab2 <mufp_fatan2+0x40>
    2aa2:	2800      	cmp	r0, #0
    2aa4:	da03      	bge.n	2aae <mufp_fatan2+0x3c>
    2aa6:	4813      	ldr	r0, [pc, #76]	; (2af4 <pi_q29>)
    2aa8:	17c9      	asrs	r1, r1, #31
    2aaa:	4048      	eors	r0, r1
    2aac:	e013      	b.n	2ad6 <mufp_fatan2+0x64>
    2aae:	17c8      	asrs	r0, r1, #31
    2ab0:	e011      	b.n	2ad6 <mufp_fatan2+0x64>
    2ab2:	2200      	movs	r2, #0
    2ab4:	2800      	cmp	r0, #0
    2ab6:	da02      	bge.n	2abe <mufp_fatan2+0x4c>
    2ab8:	4240      	negs	r0, r0
    2aba:	4249      	negs	r1, r1
    2abc:	4a0d      	ldr	r2, [pc, #52]	; (2af4 <pi_q29>)
    2abe:	a30d      	add	r3, pc, #52	; (adr r3, 2af4 <pi_q29>)
    2ac0:	2401      	movs	r4, #1
    2ac2:	f7ff ff46 	bl	2952 <cordic_vec>
    2ac6:	4610      	mov	r0, r2
    2ac8:	4a0a      	ldr	r2, [pc, #40]	; (2af4 <pi_q29>)
    2aca:	1884      	adds	r4, r0, r2
    2acc:	d202      	bcs.n	2ad4 <mufp_fatan2+0x62>
    2ace:	1a84      	subs	r4, r0, r2
    2ad0:	d400      	bmi.n	2ad4 <mufp_fatan2+0x62>
    2ad2:	1aa0      	subs	r0, r4, r2
    2ad4:	3801      	subs	r0, #1
    2ad6:	2200      	movs	r2, #0
    2ad8:	e701      	b.n	28de <packretns>
    2ada:	46c0      	nop			; (mov r8, r8)
    2adc:	136e9db4 	.word	0x136e9db4
    2ae0:	00001715 	.word	0x00001715
    2ae4:	162e42ff 	.word	0x162e42ff
    2ae8:	2c9e15ca 	.word	0x2c9e15ca
    2aec:	0593c2b9 	.word	0x0593c2b9
    2af0:	0162e430 	.word	0x0162e430

00002af4 <pi_q29>:
    2af4:	6487ed51 	.word	0x6487ed51
    2af8:	3b58ce0c 	.word	0x3b58ce0c
    2afc:	1f5b75f8 	.word	0x1f5b75f8
    2b00:	0feadd4c 	.word	0x0feadd4c
    2b04:	07fd56ec 	.word	0x07fd56ec
    2b08:	03ffaab8 	.word	0x03ffaab8
    2b0c:	01fff554 	.word	0x01fff554
    2b10:	00fffeac 	.word	0x00fffeac
    2b14:	007fffd4 	.word	0x007fffd4
    2b18:	003ffffc 	.word	0x003ffffc
    2b1c:	001ffffc 	.word	0x001ffffc
    2b20:	00100000 	.word	0x00100000
    2b24:	00080002 	.word	0x00080002

00002b28 <tab_ch>:
    2b28:	464fa9ec 	.word	0x464fa9ec
    2b2c:	464fa9ed 	.word	0x464fa9ed
    2b30:	20b15df4 	.word	0x20b15df4
    2b34:	1015891c 	.word	0x1015891c
    2b38:	0802ac44 	.word	0x0802ac44
    2b3c:	0802ac45 	.word	0x0802ac45
    2b40:	04005564 	.word	0x04005564
    2b44:	02000aac 	.word	0x02000aac
    2b48:	01000154 	.word	0x01000154
    2b4c:	0080002c 	.word	0x0080002c
    2b50:	00400004 	.word	0x00400004
    2b54:	00200004 	.word	0x00200004
    2b58:	00100000 	.word	0x00100000
    2b5c:	00080000 	.word	0x00080000
    2b60:	00080003 	.word	0x00080003

00002b64 <mufp_fsub>:
    2b64:	4ab9      	ldr	r2, [pc, #740]	; (2e4c <mufp_lib_end>)
    2b66:	4051      	eors	r1, r2

00002b68 <mufp_fadd>:
    2b68:	b570      	push	{r4, r5, r6, lr}
    2b6a:	17c4      	asrs	r4, r0, #31
    2b6c:	0042      	lsls	r2, r0, #1
    2b6e:	0e12      	lsrs	r2, r2, #24
    2b70:	d051      	beq.n	2c16 <fa_xe0>
    2b72:	2aff      	cmp	r2, #255	; 0xff
    2b74:	d052      	beq.n	2c1c <fa_xe255>

00002b76 <fa_xe>:
    2b76:	17cd      	asrs	r5, r1, #31
    2b78:	004b      	lsls	r3, r1, #1
    2b7a:	0e1b      	lsrs	r3, r3, #24
    2b7c:	d051      	beq.n	2c22 <fa_ye0>
    2b7e:	2bff      	cmp	r3, #255	; 0xff
    2b80:	d052      	beq.n	2c28 <fa_ye255>

00002b82 <fa_ye>:
    2b82:	4eb3      	ldr	r6, [pc, #716]	; (2e50 <mufp_lib_end+0x4>)
    2b84:	4030      	ands	r0, r6
    2b86:	4031      	ands	r1, r6
    2b88:	3601      	adds	r6, #1
    2b8a:	4330      	orrs	r0, r6
    2b8c:	4331      	orrs	r1, r6
    2b8e:	4060      	eors	r0, r4
    2b90:	4069      	eors	r1, r5
    2b92:	1b00      	subs	r0, r0, r4
    2b94:	1b49      	subs	r1, r1, r5
    2b96:	1a9d      	subs	r5, r3, r2
    2b98:	1ad4      	subs	r4, r2, r3
    2b9a:	d40d      	bmi.n	2bb8 <fa_ygtx>
    2b9c:	2c1e      	cmp	r4, #30
    2b9e:	da08      	bge.n	2bb2 <fa_xmgty>
    2ba0:	3520      	adds	r5, #32
    2ba2:	0013      	movs	r3, r2
    2ba4:	000a      	movs	r2, r1
    2ba6:	40aa      	lsls	r2, r5
    2ba8:	4121      	asrs	r1, r4
    2baa:	e00b      	b.n	2bc4 <fa_0>

00002bac <fa_ymgtx>:
    2bac:	2200      	movs	r2, #0
    2bae:	0008      	movs	r0, r1
    2bb0:	e00a      	b.n	2bc8 <fa_1>

00002bb2 <fa_xmgty>:
    2bb2:	0013      	movs	r3, r2
    2bb4:	2200      	movs	r2, #0
    2bb6:	e007      	b.n	2bc8 <fa_1>

00002bb8 <fa_ygtx>:
    2bb8:	2d1e      	cmp	r5, #30
    2bba:	daf7      	bge.n	2bac <fa_ymgtx>
    2bbc:	3420      	adds	r4, #32
    2bbe:	0002      	movs	r2, r0
    2bc0:	40a2      	lsls	r2, r4
    2bc2:	4128      	asrs	r0, r5

00002bc4 <fa_0>:
    2bc4:	1840      	adds	r0, r0, r1
    2bc6:	d019      	beq.n	2bfc <fa_9>

00002bc8 <fa_1>:
    2bc8:	0fc1      	lsrs	r1, r0, #31
    2bca:	d003      	beq.n	2bd4 <fa_8>
    2bcc:	43c0      	mvns	r0, r0
    2bce:	4252      	negs	r2, r2
    2bd0:	d100      	bne.n	2bd4 <fa_8>
    2bd2:	3001      	adds	r0, #1

00002bd4 <fa_8>:
    2bd4:	19b6      	adds	r6, r6, r6
    2bd6:	42b0      	cmp	r0, r6
    2bd8:	d204      	bcs.n	2be4 <fa_2>

00002bda <fa_3>:
    2bda:	1892      	adds	r2, r2, r2
    2bdc:	4140      	adcs	r0, r0
    2bde:	3b01      	subs	r3, #1
    2be0:	42b0      	cmp	r0, r6
    2be2:	d3fa      	bcc.n	2bda <fa_3>

00002be4 <fa_2>:
    2be4:	0840      	lsrs	r0, r0, #1
    2be6:	d302      	bcc.n	2bee <fa_4>
    2be8:	3001      	adds	r0, #1
    2bea:	2a00      	cmp	r2, #0
    2bec:	d009      	beq.n	2c02 <fa_5>

00002bee <fa_4>:
    2bee:	2bfe      	cmp	r3, #254	; 0xfe
    2bf0:	d20a      	bcs.n	2c08 <fa_6>
    2bf2:	07c9      	lsls	r1, r1, #31
    2bf4:	4408      	add	r0, r1
    2bf6:	05db      	lsls	r3, r3, #23
    2bf8:	4418      	add	r0, r3

00002bfa <fa_end>:
    2bfa:	bd70      	pop	{r4, r5, r6, pc}

00002bfc <fa_9>:
    2bfc:	2a00      	cmp	r2, #0
    2bfe:	d0fc      	beq.n	2bfa <fa_end>
    2c00:	e7e2      	b.n	2bc8 <fa_1>

00002c02 <fa_5>:
    2c02:	0840      	lsrs	r0, r0, #1
    2c04:	0040      	lsls	r0, r0, #1
    2c06:	e7f2      	b.n	2bee <fa_4>

00002c08 <fa_6>:
    2c08:	da01      	bge.n	2c0e <fa_7>
    2c0a:	07c8      	lsls	r0, r1, #31
    2c0c:	bd70      	pop	{r4, r5, r6, pc}

00002c0e <fa_7>:
    2c0e:	0208      	lsls	r0, r1, #8
    2c10:	30ff      	adds	r0, #255	; 0xff
    2c12:	05c0      	lsls	r0, r0, #23
    2c14:	bd70      	pop	{r4, r5, r6, pc}

00002c16 <fa_xe0>:
    2c16:	3a20      	subs	r2, #32
    2c18:	1912      	adds	r2, r2, r4
    2c1a:	e7ac      	b.n	2b76 <fa_xe>

00002c1c <fa_xe255>:
    2c1c:	0212      	lsls	r2, r2, #8
    2c1e:	4422      	add	r2, r4
    2c20:	e7a9      	b.n	2b76 <fa_xe>

00002c22 <fa_ye0>:
    2c22:	3b20      	subs	r3, #32
    2c24:	195b      	adds	r3, r3, r5
    2c26:	e7ac      	b.n	2b82 <fa_ye>

00002c28 <fa_ye255>:
    2c28:	021b      	lsls	r3, r3, #8
    2c2a:	442b      	add	r3, r5
    2c2c:	e7a9      	b.n	2b82 <fa_ye>
    2c2e:	46c0      	nop			; (mov r8, r8)

00002c30 <mufp_fmul>:
    2c30:	b580      	push	{r7, lr}
    2c32:	4602      	mov	r2, r0
    2c34:	404a      	eors	r2, r1
    2c36:	0fd2      	lsrs	r2, r2, #31
    2c38:	07d2      	lsls	r2, r2, #31
    2c3a:	4696      	mov	lr, r2
    2c3c:	0040      	lsls	r0, r0, #1
    2c3e:	0049      	lsls	r1, r1, #1
    2c40:	0e02      	lsrs	r2, r0, #24
    2c42:	d03d      	beq.n	2cc0 <fm_xe0>
    2c44:	2aff      	cmp	r2, #255	; 0xff
    2c46:	d03c      	beq.n	2cc2 <fm_xe255>

00002c48 <fm_xe>:
    2c48:	0e0b      	lsrs	r3, r1, #24
    2c4a:	d03c      	beq.n	2cc6 <fm_ye0>
    2c4c:	2bff      	cmp	r3, #255	; 0xff
    2c4e:	d03b      	beq.n	2cc8 <fm_ye255>

00002c50 <fm_ye>:
    2c50:	18d7      	adds	r7, r2, r3
    2c52:	3f80      	subs	r7, #128	; 0x80
    2c54:	0200      	lsls	r0, r0, #8
    2c56:	0209      	lsls	r1, r1, #8
    2c58:	0a40      	lsrs	r0, r0, #9
    2c5a:	0a49      	lsrs	r1, r1, #9
    2c5c:	1842      	adds	r2, r0, r1
    2c5e:	4694      	mov	ip, r2
    2c60:	09c2      	lsrs	r2, r0, #7
    2c62:	09cb      	lsrs	r3, r1, #7
    2c64:	435a      	muls	r2, r3
    2c66:	4348      	muls	r0, r1
    2c68:	0c92      	lsrs	r2, r2, #18
    2c6a:	d302      	bcc.n	2c72 <fm_ye+0x22>
    2c6c:	2800      	cmp	r0, #0
    2c6e:	d400      	bmi.n	2c72 <fm_ye+0x22>
    2c70:	3201      	adds	r2, #1
    2c72:	0243      	lsls	r3, r0, #9
    2c74:	0dc0      	lsrs	r0, r0, #23
    2c76:	0252      	lsls	r2, r2, #9
    2c78:	1880      	adds	r0, r0, r2
    2c7a:	4460      	add	r0, ip
    2c7c:	0dc1      	lsrs	r1, r0, #23
    2c7e:	d10e      	bne.n	2c9e <fm_0>
    2c80:	2ffe      	cmp	r7, #254	; 0xfe
    2c82:	d22b      	bcs.n	2cdc <fm_3a>
    2c84:	005b      	lsls	r3, r3, #1
    2c86:	d301      	bcc.n	2c8c <fm_1>
    2c88:	d005      	beq.n	2c96 <fm_2>
    2c8a:	3001      	adds	r0, #1

00002c8c <fm_1>:
    2c8c:	3701      	adds	r7, #1
    2c8e:	05ff      	lsls	r7, r7, #23
    2c90:	4438      	add	r0, r7
    2c92:	4470      	add	r0, lr
    2c94:	bd80      	pop	{r7, pc}

00002c96 <fm_2>:
    2c96:	3001      	adds	r0, #1

00002c98 <fm_3>:
    2c98:	0840      	lsrs	r0, r0, #1
    2c9a:	0040      	lsls	r0, r0, #1
    2c9c:	e7f6      	b.n	2c8c <fm_1>

00002c9e <fm_0>:
    2c9e:	3701      	adds	r7, #1
    2ca0:	2ffe      	cmp	r7, #254	; 0xfe
    2ca2:	d213      	bcs.n	2ccc <fm_3b>
    2ca4:	0840      	lsrs	r0, r0, #1
    2ca6:	d302      	bcc.n	2cae <fm_1a>
    2ca8:	3001      	adds	r0, #1
    2caa:	2b00      	cmp	r3, #0
    2cac:	d005      	beq.n	2cba <fm_3c>

00002cae <fm_1a>:
    2cae:	19ff      	adds	r7, r7, r7
    2cb0:	3701      	adds	r7, #1
    2cb2:	05bf      	lsls	r7, r7, #22
    2cb4:	4438      	add	r0, r7
    2cb6:	4470      	add	r0, lr
    2cb8:	bd80      	pop	{r7, pc}

00002cba <fm_3c>:
    2cba:	0840      	lsrs	r0, r0, #1
    2cbc:	0040      	lsls	r0, r0, #1
    2cbe:	e7f6      	b.n	2cae <fm_1a>

00002cc0 <fm_xe0>:
    2cc0:	3a10      	subs	r2, #16

00002cc2 <fm_xe255>:
    2cc2:	0212      	lsls	r2, r2, #8
    2cc4:	e7c0      	b.n	2c48 <fm_xe>

00002cc6 <fm_ye0>:
    2cc6:	3b10      	subs	r3, #16

00002cc8 <fm_ye255>:
    2cc8:	021b      	lsls	r3, r3, #8
    2cca:	e7c1      	b.n	2c50 <fm_ye>

00002ccc <fm_3b>:
    2ccc:	da12      	bge.n	2cf4 <fm_4>
    2cce:	3701      	adds	r7, #1
    2cd0:	d10e      	bne.n	2cf0 <fm_5>
    2cd2:	3002      	adds	r0, #2
    2cd4:	0dc0      	lsrs	r0, r0, #23
    2cd6:	2803      	cmp	r0, #3
    2cd8:	d10a      	bne.n	2cf0 <fm_5>
    2cda:	e005      	b.n	2ce8 <fm_6>

00002cdc <fm_3a>:
    2cdc:	da0a      	bge.n	2cf4 <fm_4>
    2cde:	3701      	adds	r7, #1
    2ce0:	d106      	bne.n	2cf0 <fm_5>
    2ce2:	3001      	adds	r0, #1
    2ce4:	0dc0      	lsrs	r0, r0, #23
    2ce6:	d003      	beq.n	2cf0 <fm_5>

00002ce8 <fm_6>:
    2ce8:	2001      	movs	r0, #1
    2cea:	05c0      	lsls	r0, r0, #23
    2cec:	4470      	add	r0, lr
    2cee:	bd80      	pop	{r7, pc}

00002cf0 <fm_5>:
    2cf0:	4670      	mov	r0, lr
    2cf2:	bd80      	pop	{r7, pc}

00002cf4 <fm_4>:
    2cf4:	20ff      	movs	r0, #255	; 0xff
    2cf6:	05c0      	lsls	r0, r0, #23
    2cf8:	4470      	add	r0, lr
    2cfa:	bd80      	pop	{r7, pc}

00002cfc <mufp_fdiv>:
    2cfc:	b570      	push	{r4, r5, r6, lr}

00002cfe <fdiv_n>:
    2cfe:	2401      	movs	r4, #1
    2d00:	4266      	negs	r6, r4
    2d02:	05e4      	lsls	r4, r4, #23
    2d04:	024a      	lsls	r2, r1, #9
    2d06:	0a52      	lsrs	r2, r2, #9
    2d08:	4322      	orrs	r2, r4
    2d0a:	09d3      	lsrs	r3, r2, #7
    2d0c:	25d0      	movs	r5, #208	; 0xd0
    2d0e:	062d      	lsls	r5, r5, #24
    2d10:	662e      	str	r6, [r5, #96]	; 0x60
    2d12:	666b      	str	r3, [r5, #100]	; 0x64
    2d14:	0dc6      	lsrs	r6, r0, #23
    2d16:	b2f3      	uxtb	r3, r6
    2d18:	0240      	lsls	r0, r0, #9
    2d1a:	0a40      	lsrs	r0, r0, #9
    2d1c:	4320      	orrs	r0, r4
    2d1e:	0dc9      	lsrs	r1, r1, #23
    2d20:	404e      	eors	r6, r1
    2d22:	0a36      	lsrs	r6, r6, #8
    2d24:	07f6      	lsls	r6, r6, #31
    2d26:	6f2d      	ldr	r5, [r5, #112]	; 0x70
    2d28:	b2c9      	uxtb	r1, r1
    2d2a:	2900      	cmp	r1, #0
    2d2c:	d030      	beq.n	2d90 <retinf>
    2d2e:	29ff      	cmp	r1, #255	; 0xff
    2d30:	d02c      	beq.n	2d8c <fdiv_n+0x8e>
    2d32:	2b00      	cmp	r3, #0
    2d34:	d039      	beq.n	2daa <retzero>
    2d36:	2bff      	cmp	r3, #255	; 0xff
    2d38:	d02a      	beq.n	2d90 <retinf>
    2d3a:	1a5b      	subs	r3, r3, r1
    2d3c:	337d      	adds	r3, #125	; 0x7d
    2d3e:	0a01      	lsrs	r1, r0, #8
    2d40:	4369      	muls	r1, r5
    2d42:	0c09      	lsrs	r1, r1, #16
    2d44:	03c0      	lsls	r0, r0, #15
    2d46:	0014      	movs	r4, r2
    2d48:	434c      	muls	r4, r1
    2d4a:	1b04      	subs	r4, r0, r4
    2d4c:	12a4      	asrs	r4, r4, #10
    2d4e:	436c      	muls	r4, r5
    2d50:	1424      	asrs	r4, r4, #16
    2d52:	0349      	lsls	r1, r1, #13
    2d54:	1909      	adds	r1, r1, r4
    2d56:	0f0c      	lsrs	r4, r1, #28
    2d58:	d108      	bne.n	2d6c <fdiv_n+0x6e>
    2d5a:	3105      	adds	r1, #5
    2d5c:	090c      	lsrs	r4, r1, #4
    2d5e:	d30f      	bcc.n	2d80 <fdiv_n+0x82>
    2d60:	08c9      	lsrs	r1, r1, #3
    2d62:	0280      	lsls	r0, r0, #10
    2d64:	4351      	muls	r1, r2
    2d66:	1a40      	subs	r0, r0, r1
    2d68:	d40a      	bmi.n	2d80 <fdiv_n+0x82>
    2d6a:	e008      	b.n	2d7e <fdiv_n+0x80>
    2d6c:	3301      	adds	r3, #1
    2d6e:	3109      	adds	r1, #9
    2d70:	094c      	lsrs	r4, r1, #5
    2d72:	d305      	bcc.n	2d80 <fdiv_n+0x82>
    2d74:	0909      	lsrs	r1, r1, #4
    2d76:	0240      	lsls	r0, r0, #9
    2d78:	4351      	muls	r1, r2
    2d7a:	1a40      	subs	r0, r0, r1
    2d7c:	d400      	bmi.n	2d80 <fdiv_n+0x82>
    2d7e:	3401      	adds	r4, #1
    2d80:	2bfe      	cmp	r3, #254	; 0xfe
    2d82:	d209      	bcs.n	2d98 <retinf+0x8>
    2d84:	05d9      	lsls	r1, r3, #23
    2d86:	1860      	adds	r0, r4, r1
    2d88:	1980      	adds	r0, r0, r6
    2d8a:	bd70      	pop	{r4, r5, r6, pc}
    2d8c:	2bff      	cmp	r3, #255	; 0xff
    2d8e:	d10c      	bne.n	2daa <retzero>

00002d90 <retinf>:
    2d90:	20ff      	movs	r0, #255	; 0xff
    2d92:	05c0      	lsls	r0, r0, #23
    2d94:	4330      	orrs	r0, r6
    2d96:	bd70      	pop	{r4, r5, r6, pc}
    2d98:	dafa      	bge.n	2d90 <retinf>
    2d9a:	1c59      	adds	r1, r3, #1
    2d9c:	d105      	bne.n	2daa <retzero>
    2d9e:	0e61      	lsrs	r1, r4, #25
    2da0:	d303      	bcc.n	2daa <retzero>
    2da2:	2001      	movs	r0, #1
    2da4:	05c0      	lsls	r0, r0, #23
    2da6:	4330      	orrs	r0, r6
    2da8:	bd70      	pop	{r4, r5, r6, pc}

00002daa <retzero>:
    2daa:	0030      	movs	r0, r6
    2dac:	bd70      	pop	{r4, r5, r6, pc}
    2dae:	46c0      	nop			; (mov r8, r8)

00002db0 <mufp_fsqrt>:
    2db0:	b410      	push	{r4}
    2db2:	0041      	lsls	r1, r0, #1
    2db4:	d23a      	bcs.n	2e2c <sq_0>
    2db6:	0209      	lsls	r1, r1, #8
    2db8:	0a49      	lsrs	r1, r1, #9
    2dba:	2201      	movs	r2, #1
    2dbc:	05d2      	lsls	r2, r2, #23
    2dbe:	1889      	adds	r1, r1, r2
    2dc0:	0dc2      	lsrs	r2, r0, #23
    2dc2:	d03a      	beq.n	2e3a <sq_2>
    2dc4:	2aff      	cmp	r2, #255	; 0xff
    2dc6:	d036      	beq.n	2e36 <sq_1>
    2dc8:	327d      	adds	r2, #125	; 0x7d
    2dca:	1052      	asrs	r2, r2, #1
    2dcc:	d300      	bcc.n	2dd0 <mufp_fsqrt+0x20>
    2dce:	0049      	lsls	r1, r1, #1
    2dd0:	a41a      	add	r4, pc, #104	; (adr r4, 2e3c <sq_2+0x2>)
    2dd2:	0d4b      	lsrs	r3, r1, #21
    2dd4:	5ce4      	ldrb	r4, [r4, r3]
    2dd6:	09c8      	lsrs	r0, r1, #7
    2dd8:	4360      	muls	r0, r4
    2dda:	4360      	muls	r0, r4
    2ddc:	1300      	asrs	r0, r0, #12
    2dde:	4360      	muls	r0, r4
    2de0:	1340      	asrs	r0, r0, #13
    2de2:	0224      	lsls	r4, r4, #8
    2de4:	1a24      	subs	r4, r4, r0
    2de6:	34aa      	adds	r4, #170	; 0xaa
    2de8:	0020      	movs	r0, r4
    2dea:	4340      	muls	r0, r0
    2dec:	0bc0      	lsrs	r0, r0, #15
    2dee:	0a0b      	lsrs	r3, r1, #8
    2df0:	4358      	muls	r0, r3
    2df2:	1300      	asrs	r0, r0, #12
    2df4:	4360      	muls	r0, r4
    2df6:	1540      	asrs	r0, r0, #21
    2df8:	1a24      	subs	r4, r4, r0
    2dfa:	4363      	muls	r3, r4
    2dfc:	0bdb      	lsrs	r3, r3, #15
    2dfe:	0018      	movs	r0, r3
    2e00:	4340      	muls	r0, r0
    2e02:	0249      	lsls	r1, r1, #9
    2e04:	1a08      	subs	r0, r1, r0
    2e06:	1140      	asrs	r0, r0, #5
    2e08:	4344      	muls	r4, r0
    2e0a:	01db      	lsls	r3, r3, #7
    2e0c:	13e0      	asrs	r0, r4, #15
    2e0e:	3010      	adds	r0, #16
    2e10:	1180      	asrs	r0, r0, #6
    2e12:	4403      	add	r3, r0
    2e14:	d306      	bcc.n	2e24 <sq_3>
    2e16:	461c      	mov	r4, r3
    2e18:	4164      	adcs	r4, r4
    2e1a:	4364      	muls	r4, r4
    2e1c:	0409      	lsls	r1, r1, #16
    2e1e:	1b09      	subs	r1, r1, r4
    2e20:	d400      	bmi.n	2e24 <sq_3>
    2e22:	3301      	adds	r3, #1

00002e24 <sq_3>:
    2e24:	05d2      	lsls	r2, r2, #23
    2e26:	18d0      	adds	r0, r2, r3

00002e28 <sq_6>:
    2e28:	bc10      	pop	{r4}
    2e2a:	4770      	bx	lr

00002e2c <sq_0>:
    2e2c:	0e09      	lsrs	r1, r1, #24
    2e2e:	d004      	beq.n	2e3a <sq_2>
    2e30:	17c0      	asrs	r0, r0, #31

00002e32 <sq_5>:
    2e32:	05c0      	lsls	r0, r0, #23
    2e34:	e7f8      	b.n	2e28 <sq_6>

00002e36 <sq_1>:
    2e36:	0dc0      	lsrs	r0, r0, #23
    2e38:	e7fb      	b.n	2e32 <sq_5>

00002e3a <sq_2>:
    2e3a:	0fc0      	lsrs	r0, r0, #31
    2e3c:	07c0      	lsls	r0, r0, #31
    2e3e:	e7f3      	b.n	2e28 <sq_6>

00002e40 <rsqrtapp>:
    2e40:	bbc9daf1 	.word	0xbbc9daf1
    2e44:	979ea6b0 	.word	0x979ea6b0
    2e48:	82868b91 	.word	0x82868b91

00002e4c <mufp_lib_end>:
    2e4c:	80000000 	.word	0x80000000
    2e50:	007fffff 	.word	0x007fffff

00002e54 <mufp_dsub>:
    2e54:	b5f0      	push	{r4, r5, r6, r7, lr}
    2e56:	2401      	movs	r4, #1
    2e58:	07e4      	lsls	r4, r4, #31
    2e5a:	4063      	eors	r3, r4
    2e5c:	e001      	b.n	2e62 <da_entry>
    2e5e:	46c0      	nop			; (mov r8, r8)

00002e60 <mufp_dadd>:
    2e60:	b5f0      	push	{r4, r5, r6, r7, lr}

00002e62 <da_entry>:
    2e62:	0d0c      	lsrs	r4, r1, #20
    2e64:	0fcf      	lsrs	r7, r1, #31
    2e66:	1e66      	subs	r6, r4, #1
    2e68:	0536      	lsls	r6, r6, #20
    2e6a:	1b89      	subs	r1, r1, r6
    2e6c:	0564      	lsls	r4, r4, #21
    2e6e:	d303      	bcc.n	2e78 <l0_1>
    2e70:	43c9      	mvns	r1, r1
    2e72:	4240      	negs	r0, r0
    2e74:	d300      	bcc.n	2e78 <l0_1>
    2e76:	3101      	adds	r1, #1

00002e78 <l0_1>:
    2e78:	0d64      	lsrs	r4, r4, #21
    2e7a:	d003      	beq.n	2e84 <l0_2>
    2e7c:	1c66      	adds	r6, r4, #1
    2e7e:	0af6      	lsrs	r6, r6, #11
    2e80:	d007      	beq.n	2e92 <l0_3>
    2e82:	1be4      	subs	r4, r4, r7

00002e84 <l0_2>:
    2e84:	2000      	movs	r0, #0
    2e86:	007f      	lsls	r7, r7, #1
    2e88:	1c79      	adds	r1, r7, #1
    2e8a:	0789      	lsls	r1, r1, #30
    2e8c:	1289      	asrs	r1, r1, #10
    2e8e:	3c80      	subs	r4, #128	; 0x80
    2e90:	0324      	lsls	r4, r4, #12

00002e92 <l0_3>:
    2e92:	0d1d      	lsrs	r5, r3, #20
    2e94:	0fdf      	lsrs	r7, r3, #31
    2e96:	1e6e      	subs	r6, r5, #1
    2e98:	0536      	lsls	r6, r6, #20
    2e9a:	1b9b      	subs	r3, r3, r6
    2e9c:	056d      	lsls	r5, r5, #21
    2e9e:	d303      	bcc.n	2ea8 <l1_1>
    2ea0:	43db      	mvns	r3, r3
    2ea2:	4252      	negs	r2, r2
    2ea4:	d300      	bcc.n	2ea8 <l1_1>
    2ea6:	3301      	adds	r3, #1

00002ea8 <l1_1>:
    2ea8:	0d6d      	lsrs	r5, r5, #21
    2eaa:	d003      	beq.n	2eb4 <l1_2>
    2eac:	1c6e      	adds	r6, r5, #1
    2eae:	0af6      	lsrs	r6, r6, #11
    2eb0:	d007      	beq.n	2ec2 <l1_3>
    2eb2:	1bed      	subs	r5, r5, r7

00002eb4 <l1_2>:
    2eb4:	2200      	movs	r2, #0
    2eb6:	007f      	lsls	r7, r7, #1
    2eb8:	1c7b      	adds	r3, r7, #1
    2eba:	079b      	lsls	r3, r3, #30
    2ebc:	129b      	asrs	r3, r3, #10
    2ebe:	3d80      	subs	r5, #128	; 0x80
    2ec0:	032d      	lsls	r5, r5, #12

00002ec2 <l1_3>:
    2ec2:	1b2f      	subs	r7, r5, r4
    2ec4:	1b66      	subs	r6, r4, r5
    2ec6:	d458      	bmi.n	2f7a <da_ygtx>
    2ec8:	46a4      	mov	ip, r4
    2eca:	2e20      	cmp	r6, #32
    2ecc:	da46      	bge.n	2f5c <da_xrgty>
    2ece:	3720      	adds	r7, #32
    2ed0:	0014      	movs	r4, r2
    2ed2:	40bc      	lsls	r4, r7

00002ed4 <da_xgty0>:
    2ed4:	001d      	movs	r5, r3
    2ed6:	40bd      	lsls	r5, r7
    2ed8:	40f2      	lsrs	r2, r6
    2eda:	4133      	asrs	r3, r6
    2edc:	432a      	orrs	r2, r5

00002ede <da_add>:
    2ede:	1880      	adds	r0, r0, r2
    2ee0:	4159      	adcs	r1, r3

00002ee2 <da_pack>:
    2ee2:	0fcb      	lsrs	r3, r1, #31
    2ee4:	d005      	beq.n	2ef2 <da_pack+0x10>
    2ee6:	43c9      	mvns	r1, r1
    2ee8:	43c0      	mvns	r0, r0
    2eea:	2200      	movs	r2, #0
    2eec:	4264      	negs	r4, r4
    2eee:	4150      	adcs	r0, r2
    2ef0:	4151      	adcs	r1, r2
    2ef2:	4662      	mov	r2, ip
    2ef4:	0d4d      	lsrs	r5, r1, #21
    2ef6:	d128      	bne.n	2f4a <da_0>
    2ef8:	0d0d      	lsrs	r5, r1, #20
    2efa:	d107      	bne.n	2f0c <da_1>
    2efc:	2800      	cmp	r0, #0
    2efe:	d01f      	beq.n	2f40 <da_5>

00002f00 <da_2>:
    2f00:	1924      	adds	r4, r4, r4
    2f02:	4140      	adcs	r0, r0
    2f04:	4149      	adcs	r1, r1
    2f06:	3a01      	subs	r2, #1
    2f08:	0d0d      	lsrs	r5, r1, #20
    2f0a:	d0f9      	beq.n	2f00 <da_2>

00002f0c <da_1>:
    2f0c:	0064      	lsls	r4, r4, #1
    2f0e:	d306      	bcc.n	2f1e <da_3>

00002f10 <da_4>:
    2f10:	3001      	adds	r0, #1
    2f12:	d300      	bcc.n	2f16 <da_4+0x6>
    2f14:	3101      	adds	r1, #1
    2f16:	2c00      	cmp	r4, #0
    2f18:	d101      	bne.n	2f1e <da_3>
    2f1a:	0840      	lsrs	r0, r0, #1
    2f1c:	0040      	lsls	r0, r0, #1

00002f1e <da_3>:
    2f1e:	3a01      	subs	r2, #1
    2f20:	d40b      	bmi.n	2f3a <da_6>
    2f22:	1c94      	adds	r4, r2, #2
    2f24:	0ae4      	lsrs	r4, r4, #11
    2f26:	d104      	bne.n	2f32 <da_7>
    2f28:	0512      	lsls	r2, r2, #20
    2f2a:	4411      	add	r1, r2
    2f2c:	07db      	lsls	r3, r3, #31
    2f2e:	4419      	add	r1, r3
    2f30:	bdf0      	pop	{r4, r5, r6, r7, pc}

00002f32 <da_7>:
    2f32:	07d9      	lsls	r1, r3, #31
    2f34:	4b20      	ldr	r3, [pc, #128]	; (2fb8 <da_xmgty+0x4>)
    2f36:	4319      	orrs	r1, r3
    2f38:	e000      	b.n	2f3c <da_6+0x2>

00002f3a <da_6>:
    2f3a:	07d9      	lsls	r1, r3, #31
    2f3c:	2000      	movs	r0, #0
    2f3e:	bdf0      	pop	{r4, r5, r6, r7, pc}

00002f40 <da_5>:
    2f40:	2900      	cmp	r1, #0
    2f42:	d1dd      	bne.n	2f00 <da_2>
    2f44:	2c00      	cmp	r4, #0
    2f46:	d1db      	bne.n	2f00 <da_2>
    2f48:	bdf0      	pop	{r4, r5, r6, r7, pc}

00002f4a <da_0>:
    2f4a:	3201      	adds	r2, #1
    2f4c:	07c6      	lsls	r6, r0, #31
    2f4e:	0840      	lsrs	r0, r0, #1
    2f50:	07cd      	lsls	r5, r1, #31
    2f52:	4328      	orrs	r0, r5
    2f54:	0849      	lsrs	r1, r1, #1
    2f56:	2e00      	cmp	r6, #0
    2f58:	d0e1      	beq.n	2f1e <da_3>
    2f5a:	e7d9      	b.n	2f10 <da_4>

00002f5c <da_xrgty>:
    2f5c:	2e3c      	cmp	r6, #60	; 0x3c
    2f5e:	da29      	bge.n	2fb4 <da_xmgty>
    2f60:	3e20      	subs	r6, #32
    2f62:	3740      	adds	r7, #64	; 0x40
    2f64:	0014      	movs	r4, r2
    2f66:	40bc      	lsls	r4, r7
    2f68:	d000      	beq.n	2f6c <da_xrgty+0x10>
    2f6a:	2401      	movs	r4, #1
    2f6c:	40f2      	lsrs	r2, r6
    2f6e:	4314      	orrs	r4, r2
    2f70:	001a      	movs	r2, r3
    2f72:	40bb      	lsls	r3, r7
    2f74:	431c      	orrs	r4, r3
    2f76:	17d3      	asrs	r3, r2, #31
    2f78:	e7ac      	b.n	2ed4 <da_xgty0>

00002f7a <da_ygtx>:
    2f7a:	46ac      	mov	ip, r5
    2f7c:	2f20      	cmp	r7, #32
    2f7e:	da08      	bge.n	2f92 <da_yrgtx>
    2f80:	3620      	adds	r6, #32
    2f82:	0004      	movs	r4, r0
    2f84:	40b4      	lsls	r4, r6

00002f86 <da_ygtx0>:
    2f86:	000d      	movs	r5, r1
    2f88:	40b5      	lsls	r5, r6
    2f8a:	40f8      	lsrs	r0, r7
    2f8c:	4139      	asrs	r1, r7
    2f8e:	4328      	orrs	r0, r5
    2f90:	e7a5      	b.n	2ede <da_add>

00002f92 <da_yrgtx>:
    2f92:	2f3c      	cmp	r7, #60	; 0x3c
    2f94:	da0c      	bge.n	2fb0 <da_ymgtx>
    2f96:	3f20      	subs	r7, #32
    2f98:	3640      	adds	r6, #64	; 0x40
    2f9a:	0004      	movs	r4, r0
    2f9c:	40b4      	lsls	r4, r6
    2f9e:	d000      	beq.n	2fa2 <da_yrgtx+0x10>
    2fa0:	2401      	movs	r4, #1
    2fa2:	40f8      	lsrs	r0, r7
    2fa4:	4304      	orrs	r4, r0
    2fa6:	0008      	movs	r0, r1
    2fa8:	40b1      	lsls	r1, r6
    2faa:	430c      	orrs	r4, r1
    2fac:	17c1      	asrs	r1, r0, #31
    2fae:	e7ea      	b.n	2f86 <da_ygtx0>

00002fb0 <da_ymgtx>:
    2fb0:	0010      	movs	r0, r2
    2fb2:	0019      	movs	r1, r3

00002fb4 <da_xmgty>:
    2fb4:	2400      	movs	r4, #0
    2fb6:	e794      	b.n	2ee2 <da_pack>
    2fb8:	7ff00000 	.word	0x7ff00000

00002fbc <mufp_dmul>:
    2fbc:	b5f0      	push	{r4, r5, r6, r7, lr}
    2fbe:	0d0c      	lsrs	r4, r1, #20
    2fc0:	1e66      	subs	r6, r4, #1
    2fc2:	0536      	lsls	r6, r6, #20
    2fc4:	1b89      	subs	r1, r1, r6
    2fc6:	0ae6      	lsrs	r6, r4, #11
    2fc8:	0564      	lsls	r4, r4, #21
    2fca:	0d64      	lsrs	r4, r4, #21
    2fcc:	d002      	beq.n	2fd4 <l2_1>
    2fce:	1c65      	adds	r5, r4, #1
    2fd0:	0aed      	lsrs	r5, r5, #11
    2fd2:	d004      	beq.n	2fde <l2_2>

00002fd4 <l2_1>:
    2fd4:	2000      	movs	r0, #0
    2fd6:	2101      	movs	r1, #1
    2fd8:	0509      	lsls	r1, r1, #20
    2fda:	3c80      	subs	r4, #128	; 0x80
    2fdc:	0324      	lsls	r4, r4, #12

00002fde <l2_2>:
    2fde:	46a4      	mov	ip, r4
    2fe0:	0d1c      	lsrs	r4, r3, #20
    2fe2:	1e67      	subs	r7, r4, #1
    2fe4:	053f      	lsls	r7, r7, #20
    2fe6:	1bdb      	subs	r3, r3, r7
    2fe8:	0ae7      	lsrs	r7, r4, #11
    2fea:	0564      	lsls	r4, r4, #21
    2fec:	0d64      	lsrs	r4, r4, #21
    2fee:	d002      	beq.n	2ff6 <l3_1>
    2ff0:	1c65      	adds	r5, r4, #1
    2ff2:	0aed      	lsrs	r5, r5, #11
    2ff4:	d004      	beq.n	3000 <l3_2>

00002ff6 <l3_1>:
    2ff6:	2200      	movs	r2, #0
    2ff8:	2301      	movs	r3, #1
    2ffa:	051b      	lsls	r3, r3, #20
    2ffc:	3c80      	subs	r4, #128	; 0x80
    2ffe:	0324      	lsls	r4, r4, #12

00003000 <l3_2>:
    3000:	4077      	eors	r7, r6
    3002:	4464      	add	r4, ip
    3004:	b497      	push	{r0, r1, r2, r4, r7}
    3006:	b284      	uxth	r4, r0
    3008:	b296      	uxth	r6, r2
    300a:	4374      	muls	r4, r6
    300c:	0c07      	lsrs	r7, r0, #16
    300e:	437e      	muls	r6, r7
    3010:	0c15      	lsrs	r5, r2, #16
    3012:	436f      	muls	r7, r5
    3014:	b280      	uxth	r0, r0
    3016:	4368      	muls	r0, r5
    3018:	1836      	adds	r6, r6, r0
    301a:	d302      	bcc.n	3022 <l4_1>
    301c:	2001      	movs	r0, #1
    301e:	0400      	lsls	r0, r0, #16
    3020:	183f      	adds	r7, r7, r0

00003022 <l4_1>:
    3022:	0430      	lsls	r0, r6, #16
    3024:	0c35      	lsrs	r5, r6, #16
    3026:	1900      	adds	r0, r0, r4
    3028:	417d      	adcs	r5, r7
    302a:	4684      	mov	ip, r0
    302c:	b288      	uxth	r0, r1
    302e:	b29a      	uxth	r2, r3
    3030:	4350      	muls	r0, r2
    3032:	0c0c      	lsrs	r4, r1, #16
    3034:	4362      	muls	r2, r4
    3036:	0c1f      	lsrs	r7, r3, #16
    3038:	437c      	muls	r4, r7
    303a:	b28e      	uxth	r6, r1
    303c:	437e      	muls	r6, r7
    303e:	1992      	adds	r2, r2, r6
    3040:	d302      	bcc.n	3048 <l5_1>
    3042:	2601      	movs	r6, #1
    3044:	0436      	lsls	r6, r6, #16
    3046:	19a4      	adds	r4, r4, r6

00003048 <l5_1>:
    3048:	0416      	lsls	r6, r2, #16
    304a:	0c17      	lsrs	r7, r2, #16
    304c:	1836      	adds	r6, r6, r0
    304e:	4167      	adcs	r7, r4
    3050:	bc01      	pop	{r0}
    3052:	b281      	uxth	r1, r0
    3054:	b29a      	uxth	r2, r3
    3056:	4351      	muls	r1, r2
    3058:	0c04      	lsrs	r4, r0, #16
    305a:	4362      	muls	r2, r4
    305c:	0c1b      	lsrs	r3, r3, #16
    305e:	435c      	muls	r4, r3
    3060:	b280      	uxth	r0, r0
    3062:	4358      	muls	r0, r3
    3064:	1812      	adds	r2, r2, r0
    3066:	d302      	bcc.n	306e <l6_1>
    3068:	2001      	movs	r0, #1
    306a:	0400      	lsls	r0, r0, #16
    306c:	1824      	adds	r4, r4, r0

0000306e <l6_1>:
    306e:	0410      	lsls	r0, r2, #16
    3070:	0c13      	lsrs	r3, r2, #16
    3072:	1840      	adds	r0, r0, r1
    3074:	4163      	adcs	r3, r4
    3076:	182d      	adds	r5, r5, r0
    3078:	415e      	adcs	r6, r3
    307a:	2000      	movs	r0, #0
    307c:	4147      	adcs	r7, r0
    307e:	bc06      	pop	{r1, r2}
    3080:	b288      	uxth	r0, r1
    3082:	b293      	uxth	r3, r2
    3084:	4358      	muls	r0, r3
    3086:	0c0c      	lsrs	r4, r1, #16
    3088:	4363      	muls	r3, r4
    308a:	0c12      	lsrs	r2, r2, #16
    308c:	4354      	muls	r4, r2
    308e:	b289      	uxth	r1, r1
    3090:	4351      	muls	r1, r2
    3092:	185b      	adds	r3, r3, r1
    3094:	d302      	bcc.n	309c <l7_1>
    3096:	2101      	movs	r1, #1
    3098:	0409      	lsls	r1, r1, #16
    309a:	1864      	adds	r4, r4, r1

0000309c <l7_1>:
    309c:	0419      	lsls	r1, r3, #16
    309e:	0c1a      	lsrs	r2, r3, #16
    30a0:	1809      	adds	r1, r1, r0
    30a2:	4162      	adcs	r2, r4
    30a4:	186d      	adds	r5, r5, r1
    30a6:	4156      	adcs	r6, r2
    30a8:	2000      	movs	r0, #0
    30aa:	4147      	adcs	r7, r0
    30ac:	bc18      	pop	{r3, r4}
    30ae:	02f9      	lsls	r1, r7, #11
    30b0:	0d72      	lsrs	r2, r6, #21
    30b2:	4311      	orrs	r1, r2
    30b4:	02f0      	lsls	r0, r6, #11
    30b6:	0d6a      	lsrs	r2, r5, #21
    30b8:	4310      	orrs	r0, r2
    30ba:	02ed      	lsls	r5, r5, #11
    30bc:	0d0a      	lsrs	r2, r1, #20
    30be:	d103      	bne.n	30c8 <l7_1+0x2c>
    30c0:	196d      	adds	r5, r5, r5
    30c2:	4140      	adcs	r0, r0
    30c4:	4149      	adcs	r1, r1
    30c6:	3b01      	subs	r3, #1
    30c8:	4e12      	ldr	r6, [pc, #72]	; (3114 <dm_1+0xa>)
    30ca:	1b9b      	subs	r3, r3, r6
    30cc:	0076      	lsls	r6, r6, #1
    30ce:	42b3      	cmp	r3, r6
    30d0:	d20e      	bcs.n	30f0 <dm_0>
    30d2:	006d      	lsls	r5, r5, #1
    30d4:	d307      	bcc.n	30e6 <l7_1+0x4a>
    30d6:	3001      	adds	r0, #1
    30d8:	2600      	movs	r6, #0
    30da:	4171      	adcs	r1, r6
    30dc:	4666      	mov	r6, ip
    30de:	4335      	orrs	r5, r6
    30e0:	d101      	bne.n	30e6 <l7_1+0x4a>
    30e2:	0840      	lsrs	r0, r0, #1
    30e4:	0040      	lsls	r0, r0, #1
    30e6:	051b      	lsls	r3, r3, #20
    30e8:	18c9      	adds	r1, r1, r3

000030ea <dm_2>:
    30ea:	07e4      	lsls	r4, r4, #31
    30ec:	4421      	add	r1, r4
    30ee:	bdf0      	pop	{r4, r5, r6, r7, pc}

000030f0 <dm_0>:
    30f0:	da0b      	bge.n	310a <dm_1>
    30f2:	3301      	adds	r3, #1
    30f4:	d106      	bne.n	3104 <dm_0+0x14>
    30f6:	3001      	adds	r0, #1
    30f8:	d104      	bne.n	3104 <dm_0+0x14>
    30fa:	3101      	adds	r1, #1
    30fc:	0d4f      	lsrs	r7, r1, #21
    30fe:	d001      	beq.n	3104 <dm_0+0x14>
    3100:	0849      	lsrs	r1, r1, #1
    3102:	e7f2      	b.n	30ea <dm_2>
    3104:	07e1      	lsls	r1, r4, #31
    3106:	2000      	movs	r0, #0
    3108:	bdf0      	pop	{r4, r5, r6, r7, pc}

0000310a <dm_1>:
    310a:	3601      	adds	r6, #1
    310c:	0531      	lsls	r1, r6, #20
    310e:	2000      	movs	r0, #0
    3110:	e7eb      	b.n	30ea <dm_2>
    3112:	0000      	.short	0x0000
    3114:	000003ff 	.word	0x000003ff

00003118 <mufp_ddiv>:
    3118:	b5f0      	push	{r4, r5, r6, r7, lr}

0000311a <ddiv0>:
    311a:	0d1c      	lsrs	r4, r3, #20
    311c:	1e67      	subs	r7, r4, #1
    311e:	053f      	lsls	r7, r7, #20
    3120:	1bdb      	subs	r3, r3, r7
    3122:	0ae7      	lsrs	r7, r4, #11
    3124:	0564      	lsls	r4, r4, #21
    3126:	0d64      	lsrs	r4, r4, #21
    3128:	d002      	beq.n	3130 <l8_1>
    312a:	1c66      	adds	r6, r4, #1
    312c:	0af6      	lsrs	r6, r6, #11
    312e:	d004      	beq.n	313a <l8_2>

00003130 <l8_1>:
    3130:	2200      	movs	r2, #0
    3132:	2301      	movs	r3, #1
    3134:	051b      	lsls	r3, r3, #20
    3136:	3c80      	subs	r4, #128	; 0x80
    3138:	0324      	lsls	r4, r4, #12

0000313a <l8_2>:
    313a:	25d0      	movs	r5, #208	; 0xd0
    313c:	062d      	lsls	r5, r5, #24
    313e:	2600      	movs	r6, #0
    3140:	43f6      	mvns	r6, r6
    3142:	662e      	str	r6, [r5, #96]	; 0x60
    3144:	091e      	lsrs	r6, r3, #4
    3146:	666e      	str	r6, [r5, #100]	; 0x64
    3148:	0fce      	lsrs	r6, r1, #31
    314a:	19f6      	adds	r6, r6, r7
    314c:	46b4      	mov	ip, r6
    314e:	0049      	lsls	r1, r1, #1
    3150:	0d4f      	lsrs	r7, r1, #21
    3152:	d002      	beq.n	315a <l8_2+0x20>
    3154:	1c7e      	adds	r6, r7, #1
    3156:	0af6      	lsrs	r6, r6, #11
    3158:	d003      	beq.n	3162 <l8_2+0x28>
    315a:	2000      	movs	r0, #0
    315c:	2100      	movs	r1, #0
    315e:	3f40      	subs	r7, #64	; 0x40
    3160:	033f      	lsls	r7, r7, #12
    3162:	1b3e      	subs	r6, r7, r4
    3164:	00b6      	lsls	r6, r6, #2
    3166:	44b4      	add	ip, r6
    3168:	3f01      	subs	r7, #1
    316a:	057f      	lsls	r7, r7, #21
    316c:	1bc9      	subs	r1, r1, r7
    316e:	0849      	lsrs	r1, r1, #1
    3170:	6f2e      	ldr	r6, [r5, #112]	; 0x70
    3172:	3601      	adds	r6, #1
    3174:	0876      	lsrs	r6, r6, #1
    3176:	029c      	lsls	r4, r3, #10
    3178:	0d95      	lsrs	r5, r2, #22
    317a:	4325      	orrs	r5, r4
    317c:	4375      	muls	r5, r6
    317e:	13ed      	asrs	r5, r5, #15
    3180:	4375      	muls	r5, r6
    3182:	13ad      	asrs	r5, r5, #14
    3184:	3501      	adds	r5, #1
    3186:	106d      	asrs	r5, r5, #1
    3188:	03f6      	lsls	r6, r6, #15
    318a:	1b76      	subs	r6, r6, r5
    318c:	b40c      	push	{r2, r3}
    318e:	02cc      	lsls	r4, r1, #11
    3190:	0d45      	lsrs	r5, r0, #21
    3192:	432c      	orrs	r4, r5
    3194:	b2a2      	uxth	r2, r4
    3196:	b2b3      	uxth	r3, r6
    3198:	435a      	muls	r2, r3
    319a:	0c27      	lsrs	r7, r4, #16
    319c:	437b      	muls	r3, r7
    319e:	0c35      	lsrs	r5, r6, #16
    31a0:	436f      	muls	r7, r5
    31a2:	b2a4      	uxth	r4, r4
    31a4:	436c      	muls	r4, r5
    31a6:	191b      	adds	r3, r3, r4
    31a8:	d302      	bcc.n	31b0 <l9_1>
    31aa:	2401      	movs	r4, #1
    31ac:	0424      	lsls	r4, r4, #16
    31ae:	193f      	adds	r7, r7, r4

000031b0 <l9_1>:
    31b0:	041c      	lsls	r4, r3, #16
    31b2:	0c1d      	lsrs	r5, r3, #16
    31b4:	18a4      	adds	r4, r4, r2
    31b6:	417d      	adcs	r5, r7
    31b8:	1924      	adds	r4, r4, r4
    31ba:	416d      	adcs	r5, r5
    31bc:	9a00      	ldr	r2, [sp, #0]
    31be:	b291      	uxth	r1, r2
    31c0:	b2ac      	uxth	r4, r5
    31c2:	4361      	muls	r1, r4
    31c4:	0c17      	lsrs	r7, r2, #16
    31c6:	437c      	muls	r4, r7
    31c8:	0c2b      	lsrs	r3, r5, #16
    31ca:	435f      	muls	r7, r3
    31cc:	b292      	uxth	r2, r2
    31ce:	435a      	muls	r2, r3
    31d0:	18a4      	adds	r4, r4, r2
    31d2:	d302      	bcc.n	31da <l10_1>
    31d4:	2201      	movs	r2, #1
    31d6:	0412      	lsls	r2, r2, #16
    31d8:	18bf      	adds	r7, r7, r2

000031da <l10_1>:
    31da:	0422      	lsls	r2, r4, #16
    31dc:	0c23      	lsrs	r3, r4, #16
    31de:	1852      	adds	r2, r2, r1
    31e0:	417b      	adcs	r3, r7
    31e2:	9c01      	ldr	r4, [sp, #4]
    31e4:	436c      	muls	r4, r5
    31e6:	191b      	adds	r3, r3, r4
    31e8:	0e52      	lsrs	r2, r2, #25
    31ea:	01d9      	lsls	r1, r3, #7
    31ec:	430a      	orrs	r2, r1
    31ee:	0144      	lsls	r4, r0, #5
    31f0:	1aa0      	subs	r0, r4, r2
    31f2:	b281      	uxth	r1, r0
    31f4:	b2b2      	uxth	r2, r6
    31f6:	4351      	muls	r1, r2
    31f8:	1403      	asrs	r3, r0, #16
    31fa:	435a      	muls	r2, r3
    31fc:	0c36      	lsrs	r6, r6, #16
    31fe:	4373      	muls	r3, r6
    3200:	b287      	uxth	r7, r0
    3202:	4377      	muls	r7, r6
    3204:	17d6      	asrs	r6, r2, #31
    3206:	19d2      	adds	r2, r2, r7
    3208:	2700      	movs	r7, #0
    320a:	417e      	adcs	r6, r7
    320c:	0436      	lsls	r6, r6, #16
    320e:	199b      	adds	r3, r3, r6
    3210:	0417      	lsls	r7, r2, #16
    3212:	0c16      	lsrs	r6, r2, #16
    3214:	187f      	adds	r7, r7, r1
    3216:	415e      	adcs	r6, r3
    3218:	1673      	asrs	r3, r6, #25
    321a:	18ed      	adds	r5, r5, r3
    321c:	01f3      	lsls	r3, r6, #7
    321e:	2600      	movs	r6, #0
    3220:	3380      	adds	r3, #128	; 0x80
    3222:	4175      	adcs	r5, r6
    3224:	0fa9      	lsrs	r1, r5, #30
    3226:	d106      	bne.n	3236 <dd_0>
    3228:	0064      	lsls	r4, r4, #1
    322a:	0a69      	lsrs	r1, r5, #9
    322c:	05e8      	lsls	r0, r5, #23
    322e:	0a5b      	lsrs	r3, r3, #9
    3230:	4318      	orrs	r0, r3
    3232:	d209      	bcs.n	3248 <dd_1>
    3234:	e02f      	b.n	3296 <dd_2>

00003236 <dd_0>:
    3236:	2204      	movs	r2, #4
    3238:	4494      	add	ip, r2
    323a:	3380      	adds	r3, #128	; 0x80
    323c:	4175      	adcs	r5, r6
    323e:	0aa9      	lsrs	r1, r5, #10
    3240:	05a8      	lsls	r0, r5, #22
    3242:	0a9b      	lsrs	r3, r3, #10
    3244:	4318      	orrs	r0, r3
    3246:	d326      	bcc.n	3296 <dd_2>

00003248 <dd_1>:
    3248:	4140      	adcs	r0, r0
    324a:	4149      	adcs	r1, r1
    324c:	0424      	lsls	r4, r4, #16
    324e:	9a00      	ldr	r2, [sp, #0]
    3250:	9b01      	ldr	r3, [sp, #4]
    3252:	000d      	movs	r5, r1
    3254:	4355      	muls	r5, r2
    3256:	1b64      	subs	r4, r4, r5
    3258:	4343      	muls	r3, r0
    325a:	1ae4      	subs	r4, r4, r3
    325c:	b295      	uxth	r5, r2
    325e:	b286      	uxth	r6, r0
    3260:	4375      	muls	r5, r6
    3262:	0c17      	lsrs	r7, r2, #16
    3264:	437e      	muls	r6, r7
    3266:	0c03      	lsrs	r3, r0, #16
    3268:	435f      	muls	r7, r3
    326a:	b292      	uxth	r2, r2
    326c:	435a      	muls	r2, r3
    326e:	18b6      	adds	r6, r6, r2
    3270:	d302      	bcc.n	3278 <l12_1>
    3272:	2201      	movs	r2, #1
    3274:	0412      	lsls	r2, r2, #16
    3276:	18bf      	adds	r7, r7, r2

00003278 <l12_1>:
    3278:	0432      	lsls	r2, r6, #16
    327a:	0c33      	lsrs	r3, r6, #16
    327c:	1952      	adds	r2, r2, r5
    327e:	417b      	adcs	r3, r7
    3280:	4252      	negs	r2, r2
    3282:	419c      	sbcs	r4, r3
    3284:	2c00      	cmp	r4, #0
    3286:	d402      	bmi.n	328e <l12_1+0x16>
    3288:	2200      	movs	r2, #0
    328a:	3001      	adds	r0, #1
    328c:	4151      	adcs	r1, r2
    328e:	0840      	lsrs	r0, r0, #1
    3290:	07ca      	lsls	r2, r1, #31
    3292:	4310      	orrs	r0, r2
    3294:	0849      	lsrs	r1, r1, #1

00003296 <dd_2>:
    3296:	b002      	add	sp, #8
    3298:	4662      	mov	r2, ip
    329a:	07d7      	lsls	r7, r2, #31
    329c:	1092      	asrs	r2, r2, #2
    329e:	4b59      	ldr	r3, [pc, #356]	; (3404 <l14_1+0x70>)
    32a0:	18d2      	adds	r2, r2, r3
    32a2:	4b59      	ldr	r3, [pc, #356]	; (3408 <l14_1+0x74>)
    32a4:	429a      	cmp	r2, r3
    32a6:	d203      	bcs.n	32b0 <dd_3>
    32a8:	0512      	lsls	r2, r2, #20
    32aa:	1889      	adds	r1, r1, r2

000032ac <dd_5>:
    32ac:	19c9      	adds	r1, r1, r7
    32ae:	bdf0      	pop	{r4, r5, r6, r7, pc}

000032b0 <dd_3>:
    32b0:	2000      	movs	r0, #0
    32b2:	2a00      	cmp	r2, #0
    32b4:	dc01      	bgt.n	32ba <dd_4>
    32b6:	0039      	movs	r1, r7
    32b8:	bdf0      	pop	{r4, r5, r6, r7, pc}

000032ba <dd_4>:
    32ba:	3301      	adds	r3, #1
    32bc:	0519      	lsls	r1, r3, #20
    32be:	e7f5      	b.n	32ac <dd_5>

000032c0 <dq_2>:
    32c0:	da07      	bge.n	32d2 <dq_3>
    32c2:	2100      	movs	r1, #0
    32c4:	e007      	b.n	32d6 <dq_4>

000032c6 <dq_0>:
    32c6:	0fc9      	lsrs	r1, r1, #31
    32c8:	07c9      	lsls	r1, r1, #31
    32ca:	0d52      	lsrs	r2, r2, #21
    32cc:	d003      	beq.n	32d6 <dq_4>
    32ce:	12c9      	asrs	r1, r1, #11
    32d0:	e001      	b.n	32d6 <dq_4>

000032d2 <dq_3>:
    32d2:	494e      	ldr	r1, [pc, #312]	; (340c <l14_1+0x78>)
    32d4:	0509      	lsls	r1, r1, #20

000032d6 <dq_4>:
    32d6:	2000      	movs	r0, #0

000032d8 <dq_1>:
    32d8:	4770      	bx	lr
    32da:	46c0      	nop			; (mov r8, r8)

000032dc <mufp_dsqrt>:
    32dc:	004a      	lsls	r2, r1, #1
    32de:	d2f2      	bcs.n	32c6 <dq_0>
    32e0:	0d52      	lsrs	r2, r2, #21
    32e2:	3a01      	subs	r2, #1
    32e4:	4b48      	ldr	r3, [pc, #288]	; (3408 <l14_1+0x74>)
    32e6:	429a      	cmp	r2, r3
    32e8:	d2ea      	bcs.n	32c0 <dq_2>
    32ea:	b5f0      	push	{r4, r5, r6, r7, lr}
    32ec:	0514      	lsls	r4, r2, #20
    32ee:	1b09      	subs	r1, r1, r4
    32f0:	0852      	lsrs	r2, r2, #1
    32f2:	d301      	bcc.n	32f8 <mufp_dsqrt+0x1c>
    32f4:	1800      	adds	r0, r0, r0
    32f6:	4149      	adcs	r1, r1
    32f8:	089b      	lsrs	r3, r3, #2
    32fa:	18d2      	adds	r2, r2, r3
    32fc:	0512      	lsls	r2, r2, #20
    32fe:	4694      	mov	ip, r2
    3300:	a441      	add	r4, pc, #260	; (adr r4, 3408 <l14_1+0x74>)
    3302:	0c4a      	lsrs	r2, r1, #17
    3304:	5ca2      	ldrb	r2, [r4, r2]
    3306:	090b      	lsrs	r3, r1, #4
    3308:	4353      	muls	r3, r2
    330a:	4353      	muls	r3, r2
    330c:	131b      	asrs	r3, r3, #12
    330e:	4353      	muls	r3, r2
    3310:	135b      	asrs	r3, r3, #13
    3312:	0212      	lsls	r2, r2, #8
    3314:	1ad2      	subs	r2, r2, r3
    3316:	0013      	movs	r3, r2
    3318:	435b      	muls	r3, r3
    331a:	0b5b      	lsrs	r3, r3, #13
    331c:	084c      	lsrs	r4, r1, #1
    331e:	4363      	muls	r3, r4
    3320:	13db      	asrs	r3, r3, #15
    3322:	4353      	muls	r3, r2
    3324:	15db      	asrs	r3, r3, #23
    3326:	3301      	adds	r3, #1
    3328:	105b      	asrs	r3, r3, #1
    332a:	1ad2      	subs	r2, r2, r3
    332c:	0c13      	lsrs	r3, r2, #16
    332e:	1ad2      	subs	r2, r2, r3
    3330:	0013      	movs	r3, r2
    3332:	435b      	muls	r3, r3
    3334:	0289      	lsls	r1, r1, #10
    3336:	0d84      	lsrs	r4, r0, #22
    3338:	4321      	orrs	r1, r4
    333a:	b28d      	uxth	r5, r1
    333c:	b29e      	uxth	r6, r3
    333e:	4375      	muls	r5, r6
    3340:	0c0f      	lsrs	r7, r1, #16
    3342:	437e      	muls	r6, r7
    3344:	0c1b      	lsrs	r3, r3, #16
    3346:	435f      	muls	r7, r3
    3348:	b28c      	uxth	r4, r1
    334a:	435c      	muls	r4, r3
    334c:	1936      	adds	r6, r6, r4
    334e:	d302      	bcc.n	3356 <l13_1>
    3350:	2401      	movs	r4, #1
    3352:	0424      	lsls	r4, r4, #16
    3354:	193f      	adds	r7, r7, r4

00003356 <l13_1>:
    3356:	0434      	lsls	r4, r6, #16
    3358:	0c33      	lsrs	r3, r6, #16
    335a:	1964      	adds	r4, r4, r5
    335c:	417b      	adcs	r3, r7
    335e:	019d      	lsls	r5, r3, #6
    3360:	0ea4      	lsrs	r4, r4, #26
    3362:	432c      	orrs	r4, r5
    3364:	3420      	adds	r4, #32
    3366:	b2a5      	uxth	r5, r4
    3368:	4355      	muls	r5, r2
    336a:	1424      	asrs	r4, r4, #16
    336c:	4354      	muls	r4, r2
    336e:	0c2d      	lsrs	r5, r5, #16
    3370:	1964      	adds	r4, r4, r5
    3372:	11a4      	asrs	r4, r4, #6
    3374:	03d2      	lsls	r2, r2, #15
    3376:	1b12      	subs	r2, r2, r4
    3378:	b295      	uxth	r5, r2
    337a:	b28e      	uxth	r6, r1
    337c:	4375      	muls	r5, r6
    337e:	0c17      	lsrs	r7, r2, #16
    3380:	437e      	muls	r6, r7
    3382:	0c0c      	lsrs	r4, r1, #16
    3384:	4367      	muls	r7, r4
    3386:	b293      	uxth	r3, r2
    3388:	4363      	muls	r3, r4
    338a:	18f6      	adds	r6, r6, r3
    338c:	d302      	bcc.n	3394 <l14_1>
    338e:	2301      	movs	r3, #1
    3390:	041b      	lsls	r3, r3, #16
    3392:	18ff      	adds	r7, r7, r3

00003394 <l14_1>:
    3394:	0433      	lsls	r3, r6, #16
    3396:	0c34      	lsrs	r4, r6, #16
    3398:	195b      	adds	r3, r3, r5
    339a:	417c      	adcs	r4, r7
    339c:	18db      	adds	r3, r3, r3
    339e:	4164      	adcs	r4, r4
    33a0:	18db      	adds	r3, r3, r3
    33a2:	2300      	movs	r3, #0
    33a4:	4163      	adcs	r3, r4
    33a6:	b29e      	uxth	r6, r3
    33a8:	4376      	muls	r6, r6
    33aa:	b29d      	uxth	r5, r3
    33ac:	0c1f      	lsrs	r7, r3, #16
    33ae:	437d      	muls	r5, r7
    33b0:	437f      	muls	r7, r7
    33b2:	046c      	lsls	r4, r5, #17
    33b4:	0bed      	lsrs	r5, r5, #15
    33b6:	19a4      	adds	r4, r4, r6
    33b8:	417d      	adcs	r5, r7
    33ba:	0206      	lsls	r6, r0, #8
    33bc:	088f      	lsrs	r7, r1, #2
    33be:	1b36      	subs	r6, r6, r4
    33c0:	41af      	sbcs	r7, r5
    33c2:	077d      	lsls	r5, r7, #29
    33c4:	08f6      	lsrs	r6, r6, #3
    33c6:	416e      	adcs	r6, r5
    33c8:	b2b4      	uxth	r4, r6
    33ca:	b295      	uxth	r5, r2
    33cc:	436c      	muls	r4, r5
    33ce:	1437      	asrs	r7, r6, #16
    33d0:	437d      	muls	r5, r7
    33d2:	0c12      	lsrs	r2, r2, #16
    33d4:	4357      	muls	r7, r2
    33d6:	b2b6      	uxth	r6, r6
    33d8:	4356      	muls	r6, r2
    33da:	17ea      	asrs	r2, r5, #31
    33dc:	19ad      	adds	r5, r5, r6
    33de:	2600      	movs	r6, #0
    33e0:	4172      	adcs	r2, r6
    33e2:	0412      	lsls	r2, r2, #16
    33e4:	18bf      	adds	r7, r7, r2
    33e6:	042e      	lsls	r6, r5, #16
    33e8:	0c2a      	lsrs	r2, r5, #16
    33ea:	1936      	adds	r6, r6, r4
    33ec:	417a      	adcs	r2, r7
    33ee:	3208      	adds	r2, #8
    33f0:	1152      	asrs	r2, r2, #5
    33f2:	d219      	bcs.n	3428 <dq_5>
    33f4:	0a9d      	lsrs	r5, r3, #10
    33f6:	059c      	lsls	r4, r3, #22
    33f8:	17d1      	asrs	r1, r2, #31
    33fa:	1910      	adds	r0, r2, r4
    33fc:	4169      	adcs	r1, r5
    33fe:	4461      	add	r1, ip
    3400:	bdf0      	pop	{r4, r5, r6, r7, pc}
    3402:	0000      	.short	0x0000
    3404:	000003fd 	.word	0x000003fd
    3408:	000007fe 	.word	0x000007fe
    340c:	000007ff 	.word	0x000007ff

00003410 <drsqrtapp>:
    3410:	d6dfebf8 	.word	0xd6dfebf8
    3414:	b8bec5cd 	.word	0xb8bec5cd
    3418:	a4a8adb2 	.word	0xa4a8adb2
    341c:	95999ca0 	.word	0x95999ca0
    3420:	8a8d8f92 	.word	0x8a8d8f92
    3424:	81838588 	.word	0x81838588

00003428 <dq_5>:
    3428:	4152      	adcs	r2, r2
    342a:	0a5d      	lsrs	r5, r3, #9
    342c:	05dc      	lsls	r4, r3, #23
    342e:	17d1      	asrs	r1, r2, #31
    3430:	1914      	adds	r4, r2, r4
    3432:	414d      	adcs	r5, r1
    3434:	002b      	movs	r3, r5
    3436:	4363      	muls	r3, r4
    3438:	b2a6      	uxth	r6, r4
    343a:	4376      	muls	r6, r6
    343c:	b2a2      	uxth	r2, r4
    343e:	0c27      	lsrs	r7, r4, #16
    3440:	437a      	muls	r2, r7
    3442:	437f      	muls	r7, r7
    3444:	0451      	lsls	r1, r2, #17
    3446:	0bd2      	lsrs	r2, r2, #15
    3448:	1989      	adds	r1, r1, r6
    344a:	417a      	adcs	r2, r7
    344c:	18d2      	adds	r2, r2, r3
    344e:	18d2      	adds	r2, r2, r3
    3450:	0580      	lsls	r0, r0, #22
    3452:	4249      	negs	r1, r1
    3454:	4190      	sbcs	r0, r2
    3456:	d402      	bmi.n	345e <dq_5+0x36>
    3458:	2300      	movs	r3, #0
    345a:	3401      	adds	r4, #1
    345c:	415d      	adcs	r5, r3
    345e:	0860      	lsrs	r0, r4, #1
    3460:	0869      	lsrs	r1, r5, #1
    3462:	07ed      	lsls	r5, r5, #31
    3464:	4328      	orrs	r0, r5
    3466:	4461      	add	r1, ip
    3468:	bdf0      	pop	{r4, r5, r6, r7, pc}

0000346a <mufp_dcmp_fast>:
    346a:	b5d0      	push	{r4, r6, r7, lr}
    346c:	e011      	b.n	3492 <dcmp_fast_entry>

0000346e <mufp_dcmp_combined>:
    346e:	b5d0      	push	{r4, r6, r7, lr}
    3470:	4fb3      	ldr	r7, [pc, #716]	; (3740 <uf2d+0x64>)
    3472:	004c      	lsls	r4, r1, #1
    3474:	0d64      	lsrs	r4, r4, #21
    3476:	d001      	beq.n	347c <mufp_dcmp_combined+0xe>
    3478:	42bc      	cmp	r4, r7
    347a:	d102      	bne.n	3482 <mufp_dcmp_combined+0x14>
    347c:	2000      	movs	r0, #0
    347e:	0d09      	lsrs	r1, r1, #20
    3480:	0509      	lsls	r1, r1, #20
    3482:	005c      	lsls	r4, r3, #1
    3484:	0d64      	lsrs	r4, r4, #21
    3486:	d001      	beq.n	348c <mufp_dcmp_combined+0x1e>
    3488:	42bc      	cmp	r4, r7
    348a:	d102      	bne.n	3492 <dcmp_fast_entry>
    348c:	2200      	movs	r2, #0
    348e:	0d1b      	lsrs	r3, r3, #20
    3490:	051b      	lsls	r3, r3, #20

00003492 <dcmp_fast_entry>:
    3492:	2601      	movs	r6, #1
    3494:	404b      	eors	r3, r1
    3496:	d40c      	bmi.n	34b2 <dcmp_fast_entry+0x20>
    3498:	404b      	eors	r3, r1
    349a:	d500      	bpl.n	349e <dcmp_fast_entry+0xc>
    349c:	4276      	negs	r6, r6
    349e:	4299      	cmp	r1, r3
    34a0:	d103      	bne.n	34aa <dcmp_fast_entry+0x18>
    34a2:	4290      	cmp	r0, r2
    34a4:	d803      	bhi.n	34ae <dcmp_fast_entry+0x1c>
    34a6:	d301      	bcc.n	34ac <dcmp_fast_entry+0x1a>
    34a8:	2600      	movs	r6, #0
    34aa:	dc00      	bgt.n	34ae <dcmp_fast_entry+0x1c>
    34ac:	4276      	negs	r6, r6
    34ae:	1e30      	subs	r0, r6, #0
    34b0:	bdd0      	pop	{r4, r6, r7, pc}
    34b2:	430b      	orrs	r3, r1
    34b4:	18db      	adds	r3, r3, r3
    34b6:	4303      	orrs	r3, r0
    34b8:	4313      	orrs	r3, r2
    34ba:	d0f5      	beq.n	34a8 <dcmp_fast_entry+0x16>
    34bc:	2900      	cmp	r1, #0
    34be:	daf6      	bge.n	34ae <dcmp_fast_entry+0x1c>
    34c0:	e7f4      	b.n	34ac <dcmp_fast_entry+0x1a>

000034c2 <push_r8_r11>:
    34c2:	4644      	mov	r4, r8
    34c4:	464d      	mov	r5, r9
    34c6:	4656      	mov	r6, sl
    34c8:	465f      	mov	r7, fp
    34ca:	b4f0      	push	{r4, r5, r6, r7}
    34cc:	4770      	bx	lr

000034ce <pop_r8_r11>:
    34ce:	bcf0      	pop	{r4, r5, r6, r7}
    34d0:	46a0      	mov	r8, r4
    34d2:	46a9      	mov	r9, r5
    34d4:	46b2      	mov	sl, r6
    34d6:	46bb      	mov	fp, r7
    34d8:	4770      	bx	lr

000034da <dcordic_vec_step>:
    34da:	4662      	mov	r2, ip
    34dc:	ca18      	ldmia	r2!, {r3, r4}
    34de:	4694      	mov	ip, r2
    34e0:	465a      	mov	r2, fp
    34e2:	2a00      	cmp	r2, #0
    34e4:	db20      	blt.n	3528 <dcordic_rot_step+0x40>
    34e6:	e004      	b.n	34f2 <dcordic_rot_step+0xa>

000034e8 <dcordic_rot_step>:
    34e8:	4662      	mov	r2, ip
    34ea:	ca18      	ldmia	r2!, {r3, r4}
    34ec:	4694      	mov	ip, r2
    34ee:	2900      	cmp	r1, #0
    34f0:	da1a      	bge.n	3528 <dcordic_rot_step+0x40>
    34f2:	18c0      	adds	r0, r0, r3
    34f4:	4161      	adcs	r1, r4
    34f6:	465b      	mov	r3, fp
    34f8:	413b      	asrs	r3, r7
    34fa:	465c      	mov	r4, fp
    34fc:	40b4      	lsls	r4, r6
    34fe:	4652      	mov	r2, sl
    3500:	40fa      	lsrs	r2, r7
    3502:	4322      	orrs	r2, r4
    3504:	4644      	mov	r4, r8
    3506:	464d      	mov	r5, r9
    3508:	4162      	adcs	r2, r4
    350a:	416b      	adcs	r3, r5
    350c:	4690      	mov	r8, r2
    350e:	4699      	mov	r9, r3
    3510:	462b      	mov	r3, r5
    3512:	40b3      	lsls	r3, r6
    3514:	413d      	asrs	r5, r7
    3516:	40fc      	lsrs	r4, r7
    3518:	431c      	orrs	r4, r3
    351a:	4652      	mov	r2, sl
    351c:	465b      	mov	r3, fp
    351e:	41a2      	sbcs	r2, r4
    3520:	41ab      	sbcs	r3, r5
    3522:	4692      	mov	sl, r2
    3524:	469b      	mov	fp, r3
    3526:	4770      	bx	lr
    3528:	1ac0      	subs	r0, r0, r3
    352a:	41a1      	sbcs	r1, r4
    352c:	464b      	mov	r3, r9
    352e:	413b      	asrs	r3, r7
    3530:	464c      	mov	r4, r9
    3532:	40b4      	lsls	r4, r6
    3534:	4642      	mov	r2, r8
    3536:	40fa      	lsrs	r2, r7
    3538:	4322      	orrs	r2, r4
    353a:	4654      	mov	r4, sl
    353c:	465d      	mov	r5, fp
    353e:	4162      	adcs	r2, r4
    3540:	416b      	adcs	r3, r5
    3542:	4692      	mov	sl, r2
    3544:	469b      	mov	fp, r3
    3546:	462b      	mov	r3, r5
    3548:	40b3      	lsls	r3, r6
    354a:	413d      	asrs	r5, r7
    354c:	40fc      	lsrs	r4, r7
    354e:	431c      	orrs	r4, r3
    3550:	4642      	mov	r2, r8
    3552:	464b      	mov	r3, r9
    3554:	41a2      	sbcs	r2, r4
    3556:	41ab      	sbcs	r3, r5
    3558:	4690      	mov	r8, r2
    355a:	4699      	mov	r9, r3
    355c:	4770      	bx	lr

0000355e <ret_dzero>:
    355e:	2000      	movs	r0, #0
    3560:	2100      	movs	r1, #0
    3562:	4770      	bx	lr

00003564 <mufp_double2int>:
    3564:	2200      	movs	r2, #0

00003566 <mufp_double2fix>:
    3566:	b500      	push	{lr}
    3568:	3220      	adds	r2, #32
    356a:	f000 f82a 	bl	35c2 <mufp_double2fix64>
    356e:	0008      	movs	r0, r1
    3570:	bd00      	pop	{pc}

00003572 <mufp_double2uint>:
    3572:	2200      	movs	r2, #0

00003574 <mufp_double2ufix>:
    3574:	b500      	push	{lr}
    3576:	3220      	adds	r2, #32
    3578:	f000 f830 	bl	35dc <mufp_double2ufix64>
    357c:	0008      	movs	r0, r1
    357e:	bd00      	pop	{pc}

00003580 <mufp_float2int64>:
    3580:	2100      	movs	r1, #0

00003582 <mufp_float2fix64>:
    3582:	b500      	push	{lr}
    3584:	f000 f804 	bl	3590 <f2fix>
    3588:	e01e      	b.n	35c8 <d2f64_a>

0000358a <mufp_float2uint64>:
    358a:	2100      	movs	r1, #0

0000358c <mufp_float2ufix64>:
    358c:	15c3      	asrs	r3, r0, #23
    358e:	d4e6      	bmi.n	355e <ret_dzero>

00003590 <f2fix>:
    3590:	b510      	push	{r4, lr}
    3592:	468c      	mov	ip, r1
    3594:	17c3      	asrs	r3, r0, #31
    3596:	0040      	lsls	r0, r0, #1
    3598:	0e02      	lsrs	r2, r0, #24
    359a:	d00a      	beq.n	35b2 <f2fix+0x22>
    359c:	2aff      	cmp	r2, #255	; 0xff
    359e:	d00c      	beq.n	35ba <f2fix+0x2a>
    35a0:	1e51      	subs	r1, r2, #1
    35a2:	3a7f      	subs	r2, #127	; 0x7f
    35a4:	0609      	lsls	r1, r1, #24
    35a6:	1a40      	subs	r0, r0, r1
    35a8:	4058      	eors	r0, r3
    35aa:	1ac0      	subs	r0, r0, r3
    35ac:	1101      	asrs	r1, r0, #4
    35ae:	0700      	lsls	r0, r0, #28
    35b0:	e01f      	b.n	35f2 <d2fix_a>
    35b2:	2000      	movs	r0, #0
    35b4:	0001      	movs	r1, r0
    35b6:	0003      	movs	r3, r0
    35b8:	bd10      	pop	{r4, pc}
    35ba:	43d8      	mvns	r0, r3
    35bc:	43d9      	mvns	r1, r3
    35be:	bd10      	pop	{r4, pc}

000035c0 <mufp_double2int64>:
    35c0:	2200      	movs	r2, #0

000035c2 <mufp_double2fix64>:
    35c2:	b500      	push	{lr}
    35c4:	f000 f80c 	bl	35e0 <d2fix>

000035c8 <d2f64_a>:
    35c8:	17ca      	asrs	r2, r1, #31
    35ca:	429a      	cmp	r2, r3
    35cc:	d100      	bne.n	35d0 <d2f64_a+0x8>
    35ce:	bd00      	pop	{pc}
    35d0:	43d8      	mvns	r0, r3
    35d2:	2101      	movs	r1, #1
    35d4:	07c9      	lsls	r1, r1, #31
    35d6:	4041      	eors	r1, r0
    35d8:	bd00      	pop	{pc}

000035da <mufp_double2uint64>:
    35da:	2200      	movs	r2, #0

000035dc <mufp_double2ufix64>:
    35dc:	150b      	asrs	r3, r1, #20
    35de:	d4be      	bmi.n	355e <ret_dzero>

000035e0 <d2fix>:
    35e0:	b510      	push	{r4, lr}
    35e2:	4694      	mov	ip, r2
    35e4:	f000 f8b8 	bl	3758 <dunpacks>
    35e8:	1414      	asrs	r4, r2, #16
    35ea:	3401      	adds	r4, #1
    35ec:	da00      	bge.n	35f0 <d2fix+0x10>
    35ee:	2100      	movs	r1, #0
    35f0:	17cb      	asrs	r3, r1, #31

000035f2 <d2fix_a>:
    35f2:	4462      	add	r2, ip
    35f4:	3a34      	subs	r2, #52	; 0x34
    35f6:	d40c      	bmi.n	3612 <d2fix_a+0x20>
    35f8:	2a0c      	cmp	r2, #12
    35fa:	da07      	bge.n	360c <d2fix_a+0x1a>
    35fc:	0004      	movs	r4, r0
    35fe:	4091      	lsls	r1, r2
    3600:	4090      	lsls	r0, r2
    3602:	4252      	negs	r2, r2
    3604:	3220      	adds	r2, #32
    3606:	40d4      	lsrs	r4, r2
    3608:	4321      	orrs	r1, r4
    360a:	bd10      	pop	{r4, pc}
    360c:	43d8      	mvns	r0, r3
    360e:	43d9      	mvns	r1, r3
    3610:	bd10      	pop	{r4, pc}
    3612:	3220      	adds	r2, #32
    3614:	d407      	bmi.n	3626 <d2fix_a+0x34>
    3616:	460c      	mov	r4, r1
    3618:	4094      	lsls	r4, r2
    361a:	4252      	negs	r2, r2
    361c:	3220      	adds	r2, #32
    361e:	4111      	asrs	r1, r2
    3620:	40d0      	lsrs	r0, r2
    3622:	4320      	orrs	r0, r4
    3624:	bd10      	pop	{r4, pc}
    3626:	0008      	movs	r0, r1
    3628:	17c9      	asrs	r1, r1, #31
    362a:	3220      	adds	r2, #32
    362c:	d403      	bmi.n	3636 <d2fix_a+0x44>
    362e:	4252      	negs	r2, r2
    3630:	3220      	adds	r2, #32
    3632:	4110      	asrs	r0, r2
    3634:	bd10      	pop	{r4, pc}
    3636:	0018      	movs	r0, r3
    3638:	0019      	movs	r1, r3
    363a:	bd10      	pop	{r4, pc}

0000363c <mufp_float2double>:
    363c:	0fc3      	lsrs	r3, r0, #31
    363e:	07db      	lsls	r3, r3, #31
    3640:	0041      	lsls	r1, r0, #1
    3642:	0e0a      	lsrs	r2, r1, #24
    3644:	d007      	beq.n	3656 <mufp_float2double+0x1a>
    3646:	2aff      	cmp	r2, #255	; 0xff
    3648:	d008      	beq.n	365c <mufp_float2double+0x20>
    364a:	0909      	lsrs	r1, r1, #4
    364c:	4a3d      	ldr	r2, [pc, #244]	; (3744 <uf2d+0x68>)
    364e:	1889      	adds	r1, r1, r2
    3650:	4319      	orrs	r1, r3
    3652:	0740      	lsls	r0, r0, #29
    3654:	4770      	bx	lr
    3656:	0019      	movs	r1, r3
    3658:	2000      	movs	r0, #0
    365a:	4770      	bx	lr
    365c:	493a      	ldr	r1, [pc, #232]	; (3748 <uf2d+0x6c>)
    365e:	18c9      	adds	r1, r1, r3
    3660:	e7fa      	b.n	3658 <mufp_float2double+0x1c>

00003662 <mufp_double2float>:
    3662:	004a      	lsls	r2, r1, #1
    3664:	0d52      	lsrs	r2, r2, #21
    3666:	4b39      	ldr	r3, [pc, #228]	; (374c <uf2d+0x70>)
    3668:	1ad2      	subs	r2, r2, r3
    366a:	dd13      	ble.n	3694 <mufp_double2float+0x32>
    366c:	2aff      	cmp	r2, #255	; 0xff
    366e:	da1e      	bge.n	36ae <mufp_double2float+0x4c>
    3670:	05d2      	lsls	r2, r2, #23
    3672:	0fcb      	lsrs	r3, r1, #31
    3674:	07db      	lsls	r3, r3, #31
    3676:	431a      	orrs	r2, r3
    3678:	00c3      	lsls	r3, r0, #3
    367a:	0f40      	lsrs	r0, r0, #29
    367c:	0309      	lsls	r1, r1, #12
    367e:	0a49      	lsrs	r1, r1, #9
    3680:	4308      	orrs	r0, r1
    3682:	4310      	orrs	r0, r2
    3684:	005b      	lsls	r3, r3, #1
    3686:	d301      	bcc.n	368c <mufp_double2float+0x2a>
    3688:	d001      	beq.n	368e <mufp_double2float+0x2c>
    368a:	3001      	adds	r0, #1
    368c:	4770      	bx	lr
    368e:	0843      	lsrs	r3, r0, #1
    3690:	d2fb      	bcs.n	368a <mufp_double2float+0x28>
    3692:	4770      	bx	lr
    3694:	d002      	beq.n	369c <mufp_double2float+0x3a>
    3696:	0fc8      	lsrs	r0, r1, #31
    3698:	07c0      	lsls	r0, r0, #31
    369a:	4770      	bx	lr
    369c:	030a      	lsls	r2, r1, #12
    369e:	1312      	asrs	r2, r2, #12
    36a0:	3201      	adds	r2, #1
    36a2:	d1f8      	bne.n	3696 <mufp_double2float+0x34>
    36a4:	0f42      	lsrs	r2, r0, #29
    36a6:	2a07      	cmp	r2, #7
    36a8:	d1f5      	bne.n	3696 <mufp_double2float+0x34>
    36aa:	2201      	movs	r2, #1
    36ac:	e000      	b.n	36b0 <mufp_double2float+0x4e>
    36ae:	22ff      	movs	r2, #255	; 0xff
    36b0:	0fc8      	lsrs	r0, r1, #31
    36b2:	0200      	lsls	r0, r0, #8
    36b4:	1880      	adds	r0, r0, r2
    36b6:	05c0      	lsls	r0, r0, #23
    36b8:	4770      	bx	lr

000036ba <mufp_uint2double>:
    36ba:	2100      	movs	r1, #0

000036bc <mufp_ufix2double>:
    36bc:	000a      	movs	r2, r1
    36be:	2100      	movs	r1, #0
    36c0:	e004      	b.n	36cc <mufp_ufix642double>

000036c2 <mufp_int2double>:
    36c2:	2100      	movs	r1, #0

000036c4 <mufp_fix2double>:
    36c4:	000a      	movs	r2, r1
    36c6:	17c1      	asrs	r1, r0, #31
    36c8:	e003      	b.n	36d2 <mufp_fix642double>

000036ca <mufp_uint642double>:
    36ca:	2200      	movs	r2, #0

000036cc <mufp_ufix642double>:
    36cc:	2300      	movs	r3, #0
    36ce:	e005      	b.n	36dc <uf2d>

000036d0 <mufp_int642double>:
    36d0:	2200      	movs	r2, #0

000036d2 <mufp_fix642double>:
    36d2:	17cb      	asrs	r3, r1, #31
    36d4:	4058      	eors	r0, r3
    36d6:	4059      	eors	r1, r3
    36d8:	1ac0      	subs	r0, r0, r3
    36da:	4199      	sbcs	r1, r3

000036dc <uf2d>:
    36dc:	b530      	push	{r4, r5, lr}
    36de:	4c1c      	ldr	r4, [pc, #112]	; (3750 <uf2d+0x74>)
    36e0:	1aa2      	subs	r2, r4, r2
    36e2:	2900      	cmp	r1, #0
    36e4:	d103      	bne.n	36ee <uf2d+0x12>
    36e6:	0001      	movs	r1, r0
    36e8:	d010      	beq.n	370c <uf2d+0x30>
    36ea:	2000      	movs	r0, #0
    36ec:	3a20      	subs	r2, #32
    36ee:	154c      	asrs	r4, r1, #21
    36f0:	d112      	bne.n	3718 <uf2d+0x3c>
    36f2:	d204      	bcs.n	36fe <uf2d+0x22>
    36f4:	3a01      	subs	r2, #1
    36f6:	1800      	adds	r0, r0, r0
    36f8:	4149      	adcs	r1, r1
    36fa:	0d4c      	lsrs	r4, r1, #21
    36fc:	d3fa      	bcc.n	36f4 <uf2d+0x18>
    36fe:	4c15      	ldr	r4, [pc, #84]	; (3754 <uf2d+0x78>)
    3700:	42a2      	cmp	r2, r4
    3702:	d204      	bcs.n	370e <uf2d+0x32>
    3704:	0512      	lsls	r2, r2, #20
    3706:	1889      	adds	r1, r1, r2
    3708:	07db      	lsls	r3, r3, #31
    370a:	18c9      	adds	r1, r1, r3
    370c:	bd30      	pop	{r4, r5, pc}
    370e:	43d2      	mvns	r2, r2
    3710:	0d52      	lsrs	r2, r2, #21
    3712:	2000      	movs	r0, #0
    3714:	2100      	movs	r1, #0
    3716:	e7f5      	b.n	3704 <uf2d+0x28>
    3718:	d403      	bmi.n	3722 <uf2d+0x46>
    371a:	3a01      	subs	r2, #1
    371c:	1800      	adds	r0, r0, r0
    371e:	4149      	adcs	r1, r1
    3720:	d5fb      	bpl.n	371a <uf2d+0x3e>
    3722:	320b      	adds	r2, #11
    3724:	0544      	lsls	r4, r0, #21
    3726:	0ac0      	lsrs	r0, r0, #11
    3728:	054d      	lsls	r5, r1, #21
    372a:	4328      	orrs	r0, r5
    372c:	0ac9      	lsrs	r1, r1, #11
    372e:	0064      	lsls	r4, r4, #1
    3730:	d003      	beq.n	373a <uf2d+0x5e>
    3732:	2400      	movs	r4, #0
    3734:	4160      	adcs	r0, r4
    3736:	4161      	adcs	r1, r4
    3738:	e7e1      	b.n	36fe <uf2d+0x22>
    373a:	d3e0      	bcc.n	36fe <uf2d+0x22>
    373c:	0844      	lsrs	r4, r0, #1
    373e:	e7f8      	b.n	3732 <uf2d+0x56>
    3740:	000007ff 	.word	0x000007ff
    3744:	38000000 	.word	0x38000000
    3748:	7ff00000 	.word	0x7ff00000
    374c:	00000380 	.word	0x00000380
    3750:	00000432 	.word	0x00000432
    3754:	000007fe 	.word	0x000007fe

00003758 <dunpacks>:
    3758:	0d0a      	lsrs	r2, r1, #20
    375a:	0fcc      	lsrs	r4, r1, #31
    375c:	1e53      	subs	r3, r2, #1
    375e:	051b      	lsls	r3, r3, #20
    3760:	1ac9      	subs	r1, r1, r3
    3762:	0552      	lsls	r2, r2, #21
    3764:	d303      	bcc.n	376e <l18_1>
    3766:	43c9      	mvns	r1, r1
    3768:	4240      	negs	r0, r0
    376a:	d300      	bcc.n	376e <l18_1>
    376c:	3101      	adds	r1, #1

0000376e <l18_1>:
    376e:	0d52      	lsrs	r2, r2, #21
    3770:	d003      	beq.n	377a <l18_2>
    3772:	1c53      	adds	r3, r2, #1
    3774:	0adb      	lsrs	r3, r3, #11
    3776:	d007      	beq.n	3788 <l18_3>
    3778:	1b12      	subs	r2, r2, r4

0000377a <l18_2>:
    377a:	2000      	movs	r0, #0
    377c:	0064      	lsls	r4, r4, #1
    377e:	1c61      	adds	r1, r4, #1
    3780:	0789      	lsls	r1, r1, #30
    3782:	1289      	asrs	r1, r1, #10
    3784:	3a80      	subs	r2, #128	; 0x80
    3786:	0312      	lsls	r2, r2, #12

00003788 <l18_3>:
    3788:	4b62      	ldr	r3, [pc, #392]	; (3914 <l20_1+0x20>)
    378a:	1ad2      	subs	r2, r2, r3
    378c:	4770      	bx	lr

0000378e <dreduce>:
    378e:	3202      	adds	r2, #2
    3790:	d425      	bmi.n	37de <dreduce+0x50>
    3792:	2a0c      	cmp	r2, #12
    3794:	da1c      	bge.n	37d0 <dreduce+0x42>
    3796:	2511      	movs	r5, #17
    3798:	1aad      	subs	r5, r5, r2
    379a:	000b      	movs	r3, r1
    379c:	412b      	asrs	r3, r5
    379e:	3208      	adds	r2, #8
    37a0:	3507      	adds	r5, #7
    37a2:	0006      	movs	r6, r0
    37a4:	40ee      	lsrs	r6, r5
    37a6:	4090      	lsls	r0, r2
    37a8:	4091      	lsls	r1, r2
    37aa:	4331      	orrs	r1, r6
    37ac:	ccf0      	ldmia	r4, {r4, r5, r6, r7}
    37ae:	4363      	muls	r3, r4
    37b0:	151a      	asrs	r2, r3, #20
    37b2:	2300      	movs	r3, #0
    37b4:	415a      	adcs	r2, r3
    37b6:	4355      	muls	r5, r2
    37b8:	4356      	muls	r6, r2
    37ba:	4357      	muls	r7, r2
    37bc:	02bf      	lsls	r7, r7, #10
    37be:	12f4      	asrs	r4, r6, #11
    37c0:	0576      	lsls	r6, r6, #21
    37c2:	1976      	adds	r6, r6, r5
    37c4:	4167      	adcs	r7, r4
    37c6:	17ed      	asrs	r5, r5, #31
    37c8:	197f      	adds	r7, r7, r5
    37ca:	1b80      	subs	r0, r0, r6
    37cc:	41b9      	sbcs	r1, r7
    37ce:	4770      	bx	lr
    37d0:	220c      	movs	r2, #12
    37d2:	2000      	movs	r0, #0
    37d4:	17c9      	asrs	r1, r1, #31
    37d6:	0049      	lsls	r1, r1, #1
    37d8:	3101      	adds	r1, #1
    37da:	0509      	lsls	r1, r1, #20
    37dc:	e7db      	b.n	3796 <dreduce+0x8>
    37de:	0209      	lsls	r1, r1, #8
    37e0:	0e03      	lsrs	r3, r0, #24
    37e2:	4319      	orrs	r1, r3
    37e4:	0200      	lsls	r0, r0, #8
    37e6:	4253      	negs	r3, r2
    37e8:	3220      	adds	r2, #32
    37ea:	d408      	bmi.n	37fe <dreduce+0x70>
    37ec:	000c      	movs	r4, r1
    37ee:	4119      	asrs	r1, r3
    37f0:	4094      	lsls	r4, r2
    37f2:	40d8      	lsrs	r0, r3
    37f4:	4320      	orrs	r0, r4
    37f6:	2200      	movs	r2, #0
    37f8:	4150      	adcs	r0, r2
    37fa:	4151      	adcs	r1, r2
    37fc:	4770      	bx	lr
    37fe:	0008      	movs	r0, r1
    3800:	17c9      	asrs	r1, r1, #31
    3802:	3b20      	subs	r3, #32
    3804:	3220      	adds	r2, #32
    3806:	d5f1      	bpl.n	37ec <dreduce+0x5e>
    3808:	2000      	movs	r0, #0
    380a:	2100      	movs	r1, #0
    380c:	2200      	movs	r2, #0
    380e:	4770      	bx	lr

00003810 <mufp_dtan>:
    3810:	b5f0      	push	{r4, r5, r6, r7, lr}
    3812:	f7ff fe56 	bl	34c2 <push_r8_r11>
    3816:	f000 f81d 	bl	3854 <dsincos>
    381a:	4684      	mov	ip, r0
    381c:	f000 f83e 	bl	389c <dcos_finish>
    3820:	b403      	push	{r0, r1}
    3822:	4660      	mov	r0, ip
    3824:	f000 f858 	bl	38d8 <dsin_finish>
    3828:	bc0c      	pop	{r2, r3}
    382a:	f7ff fe50 	bl	34ce <pop_r8_r11>
    382e:	e474      	b.n	311a <ddiv0>

00003830 <mufp_dcos>:
    3830:	b5f0      	push	{r4, r5, r6, r7, lr}
    3832:	f7ff fe46 	bl	34c2 <push_r8_r11>
    3836:	f000 f80d 	bl	3854 <dsincos>
    383a:	f000 f82f 	bl	389c <dcos_finish>
    383e:	e006      	b.n	384e <mufp_dsin+0xe>

00003840 <mufp_dsin>:
    3840:	b5f0      	push	{r4, r5, r6, r7, lr}
    3842:	f7ff fe3e 	bl	34c2 <push_r8_r11>
    3846:	f000 f805 	bl	3854 <dsincos>
    384a:	f000 f845 	bl	38d8 <dsin_finish>
    384e:	f7ff fe3e 	bl	34ce <pop_r8_r11>
    3852:	bdf0      	pop	{r4, r5, r6, r7, pc}

00003854 <dsincos>:
    3854:	b500      	push	{lr}
    3856:	f7ff ff7f 	bl	3758 <dunpacks>
    385a:	a431      	add	r4, pc, #196	; (adr r4, 3920 <dreddata0>)
    385c:	f7ff ff97 	bl	378e <dreduce>
    3860:	2400      	movs	r4, #0
    3862:	4d2d      	ldr	r5, [pc, #180]	; (3918 <l20_1+0x24>)
    3864:	4e2d      	ldr	r6, [pc, #180]	; (391c <l20_1+0x28>)
    3866:	07d2      	lsls	r2, r2, #31
    3868:	d302      	bcc.n	3870 <dsincos+0x1c>
    386a:	43f6      	mvns	r6, r6
    386c:	426d      	negs	r5, r5
    386e:	4166      	adcs	r6, r4
    3870:	0052      	lsls	r2, r2, #1
    3872:	d204      	bcs.n	387e <dsincos+0x2a>
    3874:	46a2      	mov	sl, r4
    3876:	46a3      	mov	fp, r4
    3878:	46a8      	mov	r8, r5
    387a:	46b1      	mov	r9, r6
    387c:	e003      	b.n	3886 <dsincos+0x32>
    387e:	46a0      	mov	r8, r4
    3880:	46a1      	mov	r9, r4
    3882:	46aa      	mov	sl, r5
    3884:	46b3      	mov	fp, r6
    3886:	a46f      	add	r4, pc, #444	; (adr r4, 3a44 <dtab_cc>)
    3888:	46a4      	mov	ip, r4
    388a:	2701      	movs	r7, #1
    388c:	261f      	movs	r6, #31
    388e:	f7ff fe2b 	bl	34e8 <dcordic_rot_step>
    3892:	3701      	adds	r7, #1
    3894:	3e01      	subs	r6, #1
    3896:	2f21      	cmp	r7, #33	; 0x21
    3898:	d1f9      	bne.n	388e <dsincos+0x3a>
    389a:	bd00      	pop	{pc}

0000389c <dcos_finish>:
    389c:	4659      	mov	r1, fp
    389e:	b284      	uxth	r4, r0
    38a0:	b28d      	uxth	r5, r1
    38a2:	436c      	muls	r4, r5
    38a4:	1406      	asrs	r6, r0, #16
    38a6:	4375      	muls	r5, r6
    38a8:	140b      	asrs	r3, r1, #16
    38aa:	435e      	muls	r6, r3
    38ac:	b282      	uxth	r2, r0
    38ae:	435a      	muls	r2, r3
    38b0:	18ad      	adds	r5, r5, r2
    38b2:	17ea      	asrs	r2, r5, #31
    38b4:	d700      	bvc.n	38b8 <l19_1>
    38b6:	43d2      	mvns	r2, r2

000038b8 <l19_1>:
    38b8:	0412      	lsls	r2, r2, #16
    38ba:	18b6      	adds	r6, r6, r2
    38bc:	042a      	lsls	r2, r5, #16
    38be:	0c2b      	lsrs	r3, r5, #16
    38c0:	1912      	adds	r2, r2, r4
    38c2:	4173      	adcs	r3, r6
    38c4:	4640      	mov	r0, r8
    38c6:	4649      	mov	r1, r9
    38c8:	009d      	lsls	r5, r3, #2
    38ca:	179b      	asrs	r3, r3, #30
    38cc:	0f92      	lsrs	r2, r2, #30
    38ce:	432a      	orrs	r2, r5
    38d0:	4190      	sbcs	r0, r2
    38d2:	4199      	sbcs	r1, r3
    38d4:	223e      	movs	r2, #62	; 0x3e
    38d6:	e6fc      	b.n	36d2 <mufp_fix642double>

000038d8 <dsin_finish>:
    38d8:	4649      	mov	r1, r9
    38da:	b284      	uxth	r4, r0
    38dc:	b28d      	uxth	r5, r1
    38de:	436c      	muls	r4, r5
    38e0:	1406      	asrs	r6, r0, #16
    38e2:	4375      	muls	r5, r6
    38e4:	140b      	asrs	r3, r1, #16
    38e6:	435e      	muls	r6, r3
    38e8:	b282      	uxth	r2, r0
    38ea:	435a      	muls	r2, r3
    38ec:	18ad      	adds	r5, r5, r2
    38ee:	17ea      	asrs	r2, r5, #31
    38f0:	d700      	bvc.n	38f4 <l20_1>
    38f2:	43d2      	mvns	r2, r2

000038f4 <l20_1>:
    38f4:	0412      	lsls	r2, r2, #16
    38f6:	18b6      	adds	r6, r6, r2
    38f8:	042a      	lsls	r2, r5, #16
    38fa:	0c2b      	lsrs	r3, r5, #16
    38fc:	1912      	adds	r2, r2, r4
    38fe:	4173      	adcs	r3, r6
    3900:	4650      	mov	r0, sl
    3902:	4659      	mov	r1, fp
    3904:	009d      	lsls	r5, r3, #2
    3906:	179b      	asrs	r3, r3, #30
    3908:	0f92      	lsrs	r2, r2, #30
    390a:	432a      	orrs	r2, r5
    390c:	4150      	adcs	r0, r2
    390e:	4159      	adcs	r1, r3
    3910:	223e      	movs	r2, #62	; 0x3e
    3912:	e6de      	b.n	36d2 <mufp_fix642double>
    3914:	000003ff 	.word	0x000003ff
    3918:	9df04dbb 	.word	0x9df04dbb
    391c:	36f656c5 	.word	0x36f656c5

00003920 <dreddata0>:
    3920:	0000517d 	.word	0x0000517d
    3924:	0014611a 	.word	0x0014611a
    3928:	000a8885 	.word	0x000a8885
    392c:	001921fb 	.word	0x001921fb

00003930 <mufp_datan2>:
    3930:	b5f0      	push	{r4, r5, r6, r7, lr}
    3932:	f7ff fdc6 	bl	34c2 <push_r8_r11>
    3936:	4d40      	ldr	r5, [pc, #256]	; (3a38 <mufp_datan2+0x108>)
    3938:	000c      	movs	r4, r1
    393a:	402c      	ands	r4, r5
    393c:	d001      	beq.n	3942 <mufp_datan2+0x12>
    393e:	42ac      	cmp	r4, r5
    3940:	d102      	bne.n	3948 <mufp_datan2+0x18>
    3942:	0d09      	lsrs	r1, r1, #20
    3944:	0509      	lsls	r1, r1, #20
    3946:	2000      	movs	r0, #0
    3948:	001c      	movs	r4, r3
    394a:	402c      	ands	r4, r5
    394c:	d001      	beq.n	3952 <mufp_datan2+0x22>
    394e:	42ac      	cmp	r4, r5
    3950:	d102      	bne.n	3958 <mufp_datan2+0x28>
    3952:	0d1b      	lsrs	r3, r3, #20
    3954:	051b      	lsls	r3, r3, #20
    3956:	2200      	movs	r2, #0
    3958:	2600      	movs	r6, #0
    395a:	02ed      	lsls	r5, r5, #11
    395c:	2b00      	cmp	r3, #0
    395e:	d504      	bpl.n	396a <mufp_datan2+0x3a>
    3960:	2602      	movs	r6, #2
    3962:	406b      	eors	r3, r5
    3964:	4069      	eors	r1, r5
    3966:	d400      	bmi.n	396a <mufp_datan2+0x3a>
    3968:	4276      	negs	r6, r6
    396a:	194f      	adds	r7, r1, r5
    396c:	d504      	bpl.n	3978 <mufp_datan2+0x48>
    396e:	4299      	cmp	r1, r3
    3970:	dd0c      	ble.n	398c <mufp_datan2+0x5c>
    3972:	3601      	adds	r6, #1
    3974:	4069      	eors	r1, r5
    3976:	e003      	b.n	3980 <mufp_datan2+0x50>
    3978:	42bb      	cmp	r3, r7
    397a:	da07      	bge.n	398c <mufp_datan2+0x5c>
    397c:	3e01      	subs	r6, #1
    397e:	406b      	eors	r3, r5
    3980:	0007      	movs	r7, r0
    3982:	0010      	movs	r0, r2
    3984:	003a      	movs	r2, r7
    3986:	000f      	movs	r7, r1
    3988:	0019      	movs	r1, r3
    398a:	003b      	movs	r3, r7
    398c:	b440      	push	{r6}
    398e:	2a00      	cmp	r2, #0
    3990:	d10f      	bne.n	39b2 <mufp_datan2+0x82>
    3992:	2b00      	cmp	r3, #0
    3994:	d00a      	beq.n	39ac <mufp_datan2+0x7c>
    3996:	005c      	lsls	r4, r3, #1
    3998:	1564      	asrs	r4, r4, #21
    399a:	3401      	adds	r4, #1
    399c:	d109      	bne.n	39b2 <mufp_datan2+0x82>
    399e:	004c      	lsls	r4, r1, #1
    39a0:	1564      	asrs	r4, r4, #21
    39a2:	3401      	adds	r4, #1
    39a4:	d102      	bne.n	39ac <mufp_datan2+0x7c>
    39a6:	3901      	subs	r1, #1
    39a8:	3b01      	subs	r3, #1
    39aa:	e002      	b.n	39b2 <mufp_datan2+0x82>
    39ac:	2000      	movs	r0, #0
    39ae:	2100      	movs	r1, #0
    39b0:	e02e      	b.n	3a10 <mufp_datan2+0xe0>
    39b2:	f7ff fbb1 	bl	3118 <mufp_ddiv>
    39b6:	223e      	movs	r2, #62	; 0x3e
    39b8:	f7ff fe03 	bl	35c2 <mufp_double2fix64>
    39bc:	4682      	mov	sl, r0
    39be:	468b      	mov	fp, r1
    39c0:	2000      	movs	r0, #0
    39c2:	2100      	movs	r1, #0
    39c4:	4680      	mov	r8, r0
    39c6:	2201      	movs	r2, #1
    39c8:	0792      	lsls	r2, r2, #30
    39ca:	4691      	mov	r9, r2
    39cc:	a41d      	add	r4, pc, #116	; (adr r4, 3a44 <dtab_cc>)
    39ce:	46a4      	mov	ip, r4
    39d0:	2701      	movs	r7, #1
    39d2:	261f      	movs	r6, #31
    39d4:	f7ff fd81 	bl	34da <dcordic_vec_step>
    39d8:	3701      	adds	r7, #1
    39da:	3e01      	subs	r6, #1
    39dc:	2f21      	cmp	r7, #33	; 0x21
    39de:	d1f9      	bne.n	39d4 <mufp_datan2+0xa4>
    39e0:	464a      	mov	r2, r9
    39e2:	4653      	mov	r3, sl
    39e4:	3a0c      	subs	r2, #12
    39e6:	2401      	movs	r4, #1
    39e8:	0764      	lsls	r4, r4, #29
    39ea:	2700      	movs	r7, #0
    39ec:	0852      	lsrs	r2, r2, #1
    39ee:	001b      	movs	r3, r3
    39f0:	d405      	bmi.n	39fe <mufp_datan2+0xce>
    39f2:	4193      	sbcs	r3, r2
    39f4:	1900      	adds	r0, r0, r4
    39f6:	4179      	adcs	r1, r7
    39f8:	0864      	lsrs	r4, r4, #1
    39fa:	d1f7      	bne.n	39ec <mufp_datan2+0xbc>
    39fc:	e004      	b.n	3a08 <mufp_datan2+0xd8>
    39fe:	4153      	adcs	r3, r2
    3a00:	1b00      	subs	r0, r0, r4
    3a02:	41b9      	sbcs	r1, r7
    3a04:	0864      	lsrs	r4, r4, #1
    3a06:	d1f1      	bne.n	39ec <mufp_datan2+0xbc>
    3a08:	07ce      	lsls	r6, r1, #31
    3a0a:	1049      	asrs	r1, r1, #1
    3a0c:	0840      	lsrs	r0, r0, #1
    3a0e:	4330      	orrs	r0, r6
    3a10:	bc40      	pop	{r6}
    3a12:	2e00      	cmp	r6, #0
    3a14:	d00a      	beq.n	3a2c <mufp_datan2+0xfc>
    3a16:	4c09      	ldr	r4, [pc, #36]	; (3a3c <mufp_datan2+0x10c>)
    3a18:	4d09      	ldr	r5, [pc, #36]	; (3a40 <mufp_datan2+0x110>)
    3a1a:	d501      	bpl.n	3a20 <mufp_datan2+0xf0>
    3a1c:	43e4      	mvns	r4, r4
    3a1e:	43ed      	mvns	r5, r5
    3a20:	07f6      	lsls	r6, r6, #31
    3a22:	d101      	bne.n	3a28 <mufp_datan2+0xf8>
    3a24:	1900      	adds	r0, r0, r4
    3a26:	4169      	adcs	r1, r5
    3a28:	1900      	adds	r0, r0, r4
    3a2a:	4169      	adcs	r1, r5
    3a2c:	223d      	movs	r2, #61	; 0x3d
    3a2e:	f7ff fe50 	bl	36d2 <mufp_fix642double>
    3a32:	f7ff fd4c 	bl	34ce <pop_r8_r11>
    3a36:	bdf0      	pop	{r4, r5, r6, r7, pc}
    3a38:	7ff00000 	.word	0x7ff00000
    3a3c:	885a308d 	.word	0x885a308d
    3a40:	3243f6a8 	.word	0x3243f6a8

00003a44 <dtab_cc>:
    3a44:	61bb4f69 	.word	0x61bb4f69
    3a48:	1dac6705 	.word	0x1dac6705
    3a4c:	96406eb1 	.word	0x96406eb1
    3a50:	0fadbafc 	.word	0x0fadbafc
    3a54:	ab0bdb72 	.word	0xab0bdb72
    3a58:	07f56ea6 	.word	0x07f56ea6
    3a5c:	e59fbd39 	.word	0xe59fbd39
    3a60:	03feab76 	.word	0x03feab76
    3a64:	ba97624b 	.word	0xba97624b
    3a68:	01ffd55b 	.word	0x01ffd55b
    3a6c:	dddb94d6 	.word	0xdddb94d6
    3a70:	00fffaaa 	.word	0x00fffaaa
    3a74:	56eeea5d 	.word	0x56eeea5d
    3a78:	007fff55 	.word	0x007fff55
    3a7c:	aab7776e 	.word	0xaab7776e
    3a80:	003fffea 	.word	0x003fffea
    3a84:	5555bbbc 	.word	0x5555bbbc
    3a88:	001ffffd 	.word	0x001ffffd
    3a8c:	aaaaadde 	.word	0xaaaaadde
    3a90:	000fffff 	.word	0x000fffff
    3a94:	f555556f 	.word	0xf555556f
    3a98:	0007ffff 	.word	0x0007ffff
    3a9c:	feaaaaab 	.word	0xfeaaaaab
    3aa0:	0003ffff 	.word	0x0003ffff
    3aa4:	ffd55555 	.word	0xffd55555
    3aa8:	0001ffff 	.word	0x0001ffff
    3aac:	fffaaaab 	.word	0xfffaaaab
    3ab0:	0000ffff 	.word	0x0000ffff
    3ab4:	ffff5555 	.word	0xffff5555
    3ab8:	00007fff 	.word	0x00007fff
    3abc:	ffffeaab 	.word	0xffffeaab
    3ac0:	00003fff 	.word	0x00003fff
    3ac4:	fffffd55 	.word	0xfffffd55
    3ac8:	00001fff 	.word	0x00001fff
    3acc:	ffffffab 	.word	0xffffffab
    3ad0:	00000fff 	.word	0x00000fff
    3ad4:	fffffff5 	.word	0xfffffff5
    3ad8:	000007ff 	.word	0x000007ff
    3adc:	ffffffff 	.word	0xffffffff
    3ae0:	000003ff 	.word	0x000003ff
    3ae4:	00000000 	.word	0x00000000
    3ae8:	00000200 	.word	0x00000200
    3aec:	00000000 	.word	0x00000000
    3af0:	00000100 	.word	0x00000100
    3af4:	00000000 	.word	0x00000000
    3af8:	00000080 	.word	0x00000080
    3afc:	00000000 	.word	0x00000000
    3b00:	00000040 	.word	0x00000040
    3b04:	00000000 	.word	0x00000000
    3b08:	00000020 	.word	0x00000020
    3b0c:	00000000 	.word	0x00000000
    3b10:	00000010 	.word	0x00000010
    3b14:	00000000 	.word	0x00000000
    3b18:	00000008 	.word	0x00000008
    3b1c:	00000000 	.word	0x00000000
    3b20:	00000004 	.word	0x00000004
    3b24:	00000000 	.word	0x00000000
    3b28:	00000002 	.word	0x00000002
    3b2c:	00000000 	.word	0x00000000
    3b30:	00000001 	.word	0x00000001
    3b34:	80000000 	.word	0x80000000
    3b38:	00000000 	.word	0x00000000
    3b3c:	40000000 	.word	0x40000000
    3b40:	00000000 	.word	0x00000000

00003b44 <mufp_dexp>:
    3b44:	b5f0      	push	{r4, r5, r6, r7, lr}
    3b46:	f7ff fe07 	bl	3758 <dunpacks>
    3b4a:	a454      	add	r4, pc, #336	; (adr r4, 3c9c <dreddata1>)
    3b4c:	f7ff fe1f 	bl	378e <dreduce>
    3b50:	2900      	cmp	r1, #0
    3b52:	da04      	bge.n	3b5e <mufp_dexp+0x1a>
    3b54:	4c20      	ldr	r4, [pc, #128]	; (3bd8 <mufp_dexp+0x94>)
    3b56:	4d21      	ldr	r5, [pc, #132]	; (3bdc <mufp_dexp+0x98>)
    3b58:	1900      	adds	r0, r0, r4
    3b5a:	4169      	adcs	r1, r5
    3b5c:	3a01      	subs	r2, #1
    3b5e:	b404      	push	{r2}
    3b60:	2701      	movs	r7, #1
    3b62:	a652      	add	r6, pc, #328	; (adr r6, 3cac <dtab_exp>)
    3b64:	2200      	movs	r2, #0
    3b66:	2301      	movs	r3, #1
    3b68:	079b      	lsls	r3, r3, #30
    3b6a:	ce30      	ldmia	r6!, {r4, r5}
    3b6c:	46b4      	mov	ip, r6
    3b6e:	1b00      	subs	r0, r0, r4
    3b70:	41a9      	sbcs	r1, r5
    3b72:	d40b      	bmi.n	3b8c <mufp_dexp+0x48>
    3b74:	427e      	negs	r6, r7
    3b76:	3620      	adds	r6, #32
    3b78:	001d      	movs	r5, r3
    3b7a:	413d      	asrs	r5, r7
    3b7c:	001c      	movs	r4, r3
    3b7e:	40b4      	lsls	r4, r6
    3b80:	0016      	movs	r6, r2
    3b82:	40fe      	lsrs	r6, r7
    3b84:	4334      	orrs	r4, r6
    3b86:	4162      	adcs	r2, r4
    3b88:	416b      	adcs	r3, r5
    3b8a:	e001      	b.n	3b90 <mufp_dexp+0x4c>
    3b8c:	1900      	adds	r0, r0, r4
    3b8e:	4169      	adcs	r1, r5
    3b90:	4666      	mov	r6, ip
    3b92:	3701      	adds	r7, #1
    3b94:	2f21      	cmp	r7, #33	; 0x21
    3b96:	d1e8      	bne.n	3b6a <mufp_dexp+0x26>
    3b98:	b285      	uxth	r5, r0
    3b9a:	b29e      	uxth	r6, r3
    3b9c:	4375      	muls	r5, r6
    3b9e:	1407      	asrs	r7, r0, #16
    3ba0:	437e      	muls	r6, r7
    3ba2:	0c19      	lsrs	r1, r3, #16
    3ba4:	434f      	muls	r7, r1
    3ba6:	b284      	uxth	r4, r0
    3ba8:	434c      	muls	r4, r1
    3baa:	17f1      	asrs	r1, r6, #31
    3bac:	1936      	adds	r6, r6, r4
    3bae:	2400      	movs	r4, #0
    3bb0:	4161      	adcs	r1, r4
    3bb2:	0409      	lsls	r1, r1, #16
    3bb4:	187f      	adds	r7, r7, r1
    3bb6:	0434      	lsls	r4, r6, #16
    3bb8:	0c31      	lsrs	r1, r6, #16
    3bba:	1964      	adds	r4, r4, r5
    3bbc:	4179      	adcs	r1, r7
    3bbe:	0fa4      	lsrs	r4, r4, #30
    3bc0:	0088      	lsls	r0, r1, #2
    3bc2:	4320      	orrs	r0, r4
    3bc4:	1789      	asrs	r1, r1, #30
    3bc6:	1880      	adds	r0, r0, r2
    3bc8:	4159      	adcs	r1, r3
    3bca:	bc04      	pop	{r2}
    3bcc:	4252      	negs	r2, r2
    3bce:	323e      	adds	r2, #62	; 0x3e
    3bd0:	f7ff fd7f 	bl	36d2 <mufp_fix642double>
    3bd4:	bdf0      	pop	{r4, r5, r6, r7, pc}
    3bd6:	0000      	.short	0x0000
    3bd8:	f473de6b 	.word	0xf473de6b
    3bdc:	2c5c85fd 	.word	0x2c5c85fd

00003be0 <mufp_dln>:
    3be0:	b5f0      	push	{r4, r5, r6, r7, lr}
    3be2:	004f      	lsls	r7, r1, #1
    3be4:	d250      	bcs.n	3c88 <mufp_dln+0xa8>
    3be6:	157f      	asrs	r7, r7, #21
    3be8:	d04e      	beq.n	3c88 <mufp_dln+0xa8>
    3bea:	3701      	adds	r7, #1
    3bec:	d04f      	beq.n	3c8e <mufp_dln+0xae>
    3bee:	f7ff fdb3 	bl	3758 <dunpacks>
    3bf2:	b404      	push	{r2}
    3bf4:	0249      	lsls	r1, r1, #9
    3bf6:	0dc2      	lsrs	r2, r0, #23
    3bf8:	4311      	orrs	r1, r2
    3bfa:	0240      	lsls	r0, r0, #9
    3bfc:	2701      	movs	r7, #1
    3bfe:	a62b      	add	r6, pc, #172	; (adr r6, 3cac <dtab_exp>)
    3c00:	46b4      	mov	ip, r6
    3c02:	2200      	movs	r2, #0
    3c04:	2300      	movs	r3, #0
    3c06:	427e      	negs	r6, r7
    3c08:	3620      	adds	r6, #32
    3c0a:	000d      	movs	r5, r1
    3c0c:	413d      	asrs	r5, r7
    3c0e:	000c      	movs	r4, r1
    3c10:	40b4      	lsls	r4, r6
    3c12:	0006      	movs	r6, r0
    3c14:	40fe      	lsrs	r6, r7
    3c16:	4334      	orrs	r4, r6
    3c18:	4144      	adcs	r4, r0
    3c1a:	414d      	adcs	r5, r1
    3c1c:	0fae      	lsrs	r6, r5, #30
    3c1e:	d105      	bne.n	3c2c <mufp_dln+0x4c>
    3c20:	0020      	movs	r0, r4
    3c22:	0029      	movs	r1, r5
    3c24:	4666      	mov	r6, ip
    3c26:	ce30      	ldmia	r6!, {r4, r5}
    3c28:	1b12      	subs	r2, r2, r4
    3c2a:	41ab      	sbcs	r3, r5
    3c2c:	2408      	movs	r4, #8
    3c2e:	44a4      	add	ip, r4
    3c30:	3701      	adds	r7, #1
    3c32:	2f21      	cmp	r7, #33	; 0x21
    3c34:	d1e7      	bne.n	3c06 <mufp_dln+0x26>
    3c36:	0089      	lsls	r1, r1, #2
    3c38:	1089      	asrs	r1, r1, #2
    3c3a:	1812      	adds	r2, r2, r0
    3c3c:	414b      	adcs	r3, r1
    3c3e:	bc80      	pop	{r7}
    3c40:	a417      	add	r4, pc, #92	; (adr r4, 3ca0 <dreddata1+0x4>)
    3c42:	cc13      	ldmia	r4, {r0, r1, r4}
    3c44:	3701      	adds	r7, #1
    3c46:	4378      	muls	r0, r7
    3c48:	4379      	muls	r1, r7
    3c4a:	437c      	muls	r4, r7
    3c4c:	054f      	lsls	r7, r1, #21
    3c4e:	12c9      	asrs	r1, r1, #11
    3c50:	17cd      	asrs	r5, r1, #31
    3c52:	19c0      	adds	r0, r0, r7
    3c54:	4169      	adcs	r1, r5
    3c56:	02a7      	lsls	r7, r4, #10
    3c58:	15a4      	asrs	r4, r4, #22
    3c5a:	17cd      	asrs	r5, r1, #31
    3c5c:	19c9      	adds	r1, r1, r7
    3c5e:	416c      	adcs	r4, r5
    3c60:	17dd      	asrs	r5, r3, #31
    3c62:	1880      	adds	r0, r0, r2
    3c64:	4159      	adcs	r1, r3
    3c66:	416c      	adcs	r4, r5
    3c68:	223e      	movs	r2, #62	; 0x3e
    3c6a:	17cd      	asrs	r5, r1, #31
    3c6c:	42ac      	cmp	r4, r5
    3c6e:	d008      	beq.n	3c82 <mufp_dln+0xa2>
    3c70:	0900      	lsrs	r0, r0, #4
    3c72:	070e      	lsls	r6, r1, #28
    3c74:	4330      	orrs	r0, r6
    3c76:	0909      	lsrs	r1, r1, #4
    3c78:	0726      	lsls	r6, r4, #28
    3c7a:	4331      	orrs	r1, r6
    3c7c:	1124      	asrs	r4, r4, #4
    3c7e:	3a04      	subs	r2, #4
    3c80:	e7f3      	b.n	3c6a <mufp_dln+0x8a>
    3c82:	f7ff fd26 	bl	36d2 <mufp_fix642double>
    3c86:	bdf0      	pop	{r4, r5, r6, r7, pc}
    3c88:	4902      	ldr	r1, [pc, #8]	; (3c94 <mufp_dln+0xb4>)
    3c8a:	2000      	movs	r0, #0
    3c8c:	bdf0      	pop	{r4, r5, r6, r7, pc}
    3c8e:	4902      	ldr	r1, [pc, #8]	; (3c98 <mufp_dln+0xb8>)
    3c90:	2000      	movs	r0, #0
    3c92:	bdf0      	pop	{r4, r5, r6, r7, pc}
    3c94:	fff00000 	.word	0xfff00000
    3c98:	7ff00000 	.word	0x7ff00000

00003c9c <dreddata1>:
    3c9c:	0000b8aa 	.word	0x0000b8aa
    3ca0:	0013de6b 	.word	0x0013de6b
    3ca4:	000fefa3 	.word	0x000fefa3
    3ca8:	000b1721 	.word	0x000b1721

00003cac <dtab_exp>:
    3cac:	bf984bf3 	.word	0xbf984bf3
    3cb0:	19f323ec 	.word	0x19f323ec
    3cb4:	cd4d10d6 	.word	0xcd4d10d6
    3cb8:	0e47fbe3 	.word	0x0e47fbe3
    3cbc:	8abcb97a 	.word	0x8abcb97a
    3cc0:	0789c1db 	.word	0x0789c1db
    3cc4:	022c54cc 	.word	0x022c54cc
    3cc8:	03e14618 	.word	0x03e14618
    3ccc:	e7833005 	.word	0xe7833005
    3cd0:	01f829b0 	.word	0x01f829b0
    3cd4:	87e01f1e 	.word	0x87e01f1e
    3cd8:	00fe0545 	.word	0x00fe0545
    3cdc:	ac419e24 	.word	0xac419e24
    3ce0:	007f80a9 	.word	0x007f80a9
    3ce4:	45621781 	.word	0x45621781
    3ce8:	003fe015 	.word	0x003fe015
    3cec:	a9ab10e6 	.word	0xa9ab10e6
    3cf0:	001ff802 	.word	0x001ff802
    3cf4:	55455888 	.word	0x55455888
    3cf8:	000ffe00 	.word	0x000ffe00
    3cfc:	0aa9aac4 	.word	0x0aa9aac4
    3d00:	0007ff80 	.word	0x0007ff80
    3d04:	01554556 	.word	0x01554556
    3d08:	0003ffe0 	.word	0x0003ffe0
    3d0c:	002aa9ab 	.word	0x002aa9ab
    3d10:	0001fff8 	.word	0x0001fff8
    3d14:	00055545 	.word	0x00055545
    3d18:	0000fffe 	.word	0x0000fffe
    3d1c:	8000aaaa 	.word	0x8000aaaa
    3d20:	00007fff 	.word	0x00007fff
    3d24:	e0001555 	.word	0xe0001555
    3d28:	00003fff 	.word	0x00003fff
    3d2c:	f80002ab 	.word	0xf80002ab
    3d30:	00001fff 	.word	0x00001fff
    3d34:	fe000055 	.word	0xfe000055
    3d38:	00000fff 	.word	0x00000fff
    3d3c:	ff80000b 	.word	0xff80000b
    3d40:	000007ff 	.word	0x000007ff
    3d44:	ffe00001 	.word	0xffe00001
    3d48:	000003ff 	.word	0x000003ff
    3d4c:	fff80000 	.word	0xfff80000
    3d50:	000001ff 	.word	0x000001ff
    3d54:	fffe0000 	.word	0xfffe0000
    3d58:	000000ff 	.word	0x000000ff
    3d5c:	ffff8000 	.word	0xffff8000
    3d60:	0000007f 	.word	0x0000007f
    3d64:	ffffe000 	.word	0xffffe000
    3d68:	0000003f 	.word	0x0000003f
    3d6c:	fffff800 	.word	0xfffff800
    3d70:	0000001f 	.word	0x0000001f
    3d74:	fffffe00 	.word	0xfffffe00
    3d78:	0000000f 	.word	0x0000000f
    3d7c:	ffffff80 	.word	0xffffff80
    3d80:	00000007 	.word	0x00000007
    3d84:	ffffffe0 	.word	0xffffffe0
    3d88:	00000003 	.word	0x00000003
    3d8c:	fffffff8 	.word	0xfffffff8
    3d90:	00000001 	.word	0x00000001
    3d94:	fffffffe 	.word	0xfffffffe
    3d98:	00000000 	.word	0x00000000
    3d9c:	80000000 	.word	0x80000000
    3da0:	00000000 	.word	0x00000000
    3da4:	40000000 	.word	0x40000000
    3da8:	00000000 	.word	0x00000000

00003dac <mufp_lib_double_end>:
    3dac:	45444e49 	.word	0x45444e49
    3db0:	20202058 	.word	0x20202058
    3db4:	004d5448 	.word	0x004d5448
    3db8:	4f464e49 	.word	0x4f464e49
    3dbc:	3246555f 	.word	0x3246555f
    3dc0:	00545854 	.word	0x00545854
    3dc4:	70736152 	.word	0x70736152
    3dc8:	72726562 	.word	0x72726562
    3dcc:	69502079 	.word	0x69502079
    3dd0:	32505200 	.word	0x32505200
    3dd4:	6f6f4220 	.word	0x6f6f4220
    3dd8:	0074      	.short	0x0074

00003dda <_msc_cmd_transfer_type>:
    3dda:	0106                                        ..

00003ddc <_msc_endpoints.4957>:
    3ddc:	0dc0 5010 0dec 5010                         ...P...P

00003de4 <_msc_sector_funcs>:
    3de4:	044d 0000 000a 0000                         M.......

00003dec <_picoboot_cmd_transfer_type>:
    3dec:	0104 be00                                   ....

00003df0 <_picoboot_stream_funcs.4929>:
    3df0:	004f 0000 000c 0000                         O.......

00003df8 <_ptable_data4.4907>:
    3df8:	000e 0000 0001 0000 ffff                     ...........

00003e03 <_resp.5028>:
    3e03:	0300 ffff 0000 0002                         ........

00003e0b <_resp.5037>:
    3e0b:	0000 0000 0300 ffff 0002 0002               ............

00003e17 <_usb_stream_transfer_type>:
    3e17:	0008                                        ..

00003e19 <boot_device_config>:
    3e19:	0209 0037 0102 8000 09fa 0004 0200 0608     ..7.............
    3e29:	0050 0507 0281 0040 0700 0205 4002 0000     P.....@......@..
    3e39:	0409 0001 ff02 0000 0700 0305 4002 0000     .............@..
    3e49:	0507 0284 0040                               ....@..

00003e50 <boot_device_descriptor>:
    3e50:	0112 0110 0000 4000 2e8a 0003 0100 0201     .......@........
    3e60:	0103 be00                                   ....

00003e64 <boot_device_interfaces.4960>:
    3e64:	0e18 5010 0e50 5010                         ...PP..P

00003e6c <boot_sector>:
    3e6c:	3ceb 4d90 5753 4e49 2e34 0031 0802 0001     .<.MSWIN4.1.....
    3e7c:	0002 0002 f800 0081 0001 0001 0001 0000     ................
    3e8c:	ffff 0003 0000 0029 0000 5200 4950 522d     ......)....RPI-R
    3e9c:	3250 2020 2020 4146 3154 2036 2020 feeb     P2    FAT16   ..

00003eac <cmd_mapping.4925>:
    3eac:	0000 0100 1000 000c 0800 0200 8008 0804     ................
    3ebc:	0880 0000 0001 2000 0004 0440 8000 be00     ....... ..@.....

00003ecc <default_flash_funcs>:
    3ecc:	001c 0000 2355 0000 24c9 0000 188d 0000     ....U#...$......
    3edc:	0aa9 0000 18c5 0000 17fd 0000               ............

00003ee8 <descriptor_strings>:
    3ee8:	3dc4 0000 3dd1 0000 0eb5 5010               .=...=.....P

00003ef4 <info_uf2_txt>:
    3ef4:	4655 2032 6f42 746f 6f6c 6461 7265 7620     UF2 Bootloader v
    3f04:	2e32 0a30 6f4d 6564 3a6c 5220 7361 6270     2.0.Model: Raspb
    3f14:	7265 7972 5020 2069 5052 0a32 6f42 7261     erry Pi RP2.Boar
    3f24:	2d64 4449 203a 5052 2d49 5052 0a32          d-ID: RPI-RP2.

00003f32 <lang_descriptor.4949>:
    3f32:	0304 0409 be00                              ......

00003f38 <picoboot_endpoints.4958>:
    3f38:	0e58 5010 0e24 5010                         X..P$..P

00003f40 <scsi_ir_z>:
    3f40:	0000 0202 0020 0000 5052 2049 01fc 5052     .... ...RPI ..RP
    3f50:	fb32 2008 06f9 fd32                          2.. ..2..

00003f59 <usb_current_packet_only_transfer_type>:
    3f59:	0102                                        ..

00003f5b <welcome_html_z>:
    3f5b:	683c 6d74 3e6c 683c 6165 3e64 6d3c 7465     <html><head><met
    3f6b:	2061 7468 7074 652d 7571 7669 223d 6572     a http-equiv="re
    3f7b:	7266 7365 2268 6320 6e6f 6574 746e 223d     fresh" content="
    3f8b:	3b30 5255 3d4c fc27 7325 2f3a 722f 7361     0;URL='.%s://ras
    3f9b:	6270 7265 7972 6970 632e 6d6f 642f 7665     pberrypi.com/dev
    3fab:	6369 2f65 5052 3f32 6576 7372 6f69 3d6e     ice/RP2?version=
    3fbb:	6161 6262 6363 6464 6565 6666 2227 3e2f     aabbccddeeff'"/>
    3fcb:	2f3c 6dfa 6f62 7964 523e 6465 7269 6365     </.mbody>Redirec
    3fdb:	6974 676e 7420 206f fd3c 727f 6665 60c6     ting to <..ref.`
    3feb:	f13e 3c91 612f 71fd fc62 3c6b fb2f           >..</a.qb.k</..

00003ffa <this_is_the_end_my_only_friend_the_end>:
    3ffa:	be00      	.short	0xbe00
    3ffc:	be00be00 	.word	0xbe00be00
