/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Boot Gate - BIOS supported x86 Startup Code 
 *
 * Utils defs
 *
 * (C) Copyright 2018
 * Matheus Castello <matheus@castello.eng.br>
 */

.code16
.text

/* functions */
#define DISPLAY_CHAR 	0x0e 
#define TEXT_MODE	3

/* interrupts */
#define BIOS_CALLS 	1
#define	VIDEO_INT 	0x10
