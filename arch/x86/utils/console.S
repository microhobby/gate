/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Boot Gate - BIOS supported x86 Startup Code 
 *
 * Console functions
 *
 * (C) Copyright 2018
 * Matheus Castello <matheus@castello.eng.br>
 */

.code16
.text

ENTRY(print)
	/* set text mode */
	mov	$TEXT_MODE, %ax
	mov	$0, %bh
	int	$VIDEO_INT
	movb	$DISPLAY_CHAR, %ah

/* Load string bytes until done */
.printchar:
	lodsb
	cmp	$0, %al
	je	.done
/* Call BIOS video service */
	int	$VIDEO_INT
	jmp	.printchar

.done:
ENDPROC(print)

BOOT_GATE_VERSION:
        .ascii "Boot Gate 0.0\12\0"
	