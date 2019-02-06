/* SPDX-License-Identifier: GPL-3.0+ */
/*
 * Boot Gate - x86 Startup Code 
 *
 * Entry point
 *
 * (C) Copyright 2018
 * Matheus Castello <matheus@castello.eng.br>
 */

.code16
.text
.org 0x0

.global main
main:
	jmp	start;

#include "utils/linkage.h"
#include "utils/bios.S"
#include "utils/console.S"

start:
	/* clear ax and force */
	cli
	mov	%cs, %ax
	mov	%ax, %ds
	mov	%ax, %es
	mov	%ax, %ss
	mov	$0x7c00, %sp

	movl	$BOOT_GATE_VERSION, %esi
	call	print
	cli
	hlt

.fill (510-(.-main)), 1, 0
.int 0xAA55
