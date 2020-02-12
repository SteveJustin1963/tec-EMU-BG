.org 0000

ColdBoot:	
	LD SP,0FFFh ;Put stack at ram High
	xor a
	out (1),a
	out (2),a
	
	JP Main ;Main Program Thread
	
NMI:
.ORG 00066H ;NMI
	push AF
	push BC
	push DE
	push HL
	pop HL
	pop DE
	pop BC
	pop AF
	retn

Main:
	ld HL,100h
Main2:
	ld a,(HL)
	cp 0FFh
	jr z,Main
	out (05),a
	inc HL
	jr Main2
	
Loop:
	jp Loop
.org 100h
Table:
	.DB 0dh,17h,17h,02h,2ah,0ch,2ch,04h ;Talking
	.DB 13h,2dh,07h,29h,11h,0eh,18h,0bh,0ch,08h,37h,04h ;Electronics
	.DB 2ah,0fh,10h,00,31h,16h,0dh,33h,04h;Computer
	
	.db 3fh,18h,06h,04h ;By

	.db 0ah,18h,0bh,0bh,04; john
	.db 39h,1ah,3bh,21h,13h,04h ;Hardy
	
	.db 1ah,0bh,15h,04, ;and
	
	.db 2ah,07,07,00,0bh,24h,4h ;ken
	.db 37h,01, 0dh,20h,07h,0bh,04h;stone

	
	.db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
	
	.DB 0FFh
	
	
.END
