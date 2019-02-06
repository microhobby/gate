VERSION = 0
PATCHLEVEL = 0
SUBLEVEL = 0
EXTRAVERSION = beta
NAME = Begin

DEBUG ?= false

ifneq ($(DEBUG),true)
NOECHO := @
endif

export

x86:
	$(NOECHO)cd arch/x86 && $(MAKE)
	@echo "Thanks to build The Castle Gate"

qemux86:
	gcc -c -g -Os -ffreestanding -Wall -Werror -I arch/x86/ arch/x86/boot.S -o bootgate.o
	ld -static -nostdlib --nmagic -o bootgate.elf bootgate.o -Ttext 0x7c00
	objcopy -O binary -j .text bootgate.elf bootgate.out
	dd if=/dev/zero of=bootgate.img ibs=1k count=1440
	dd if=bootgate.out of=bootgate.img conv=notrunc
	qemu-system-i386 bootgate.img

clean:
	@echo "Cleanning ..."
	$(NOECHO)find . -name "*.img" -type f -delete
	$(NOECHO)find . -name "*.o" -type f -delete
	$(NOECHO)find . -name "*.out" -type f -delete
	$(NOECHO)find . -name "*.elf" -type f -delete	
	$(NOECHO)echo "Done"
