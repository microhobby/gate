CFLAGS = -m32 \
	--std=gnu89 \
	-nodefaultlibs \
	-nostdinc \
	-nostdlib \
	-static \
	-fgnu89-inline \
	-ffreestanding \
	-fno-builtin \
	-fno-pie \
	-no-pie \
	-fleading-underscore \
	-fno-stack-protector \
	-s

DEFINES = 	-DGATE_VERSION=$(VERSION) \
		-DGATE_PATCHLEVEL=$(PATCHLEVEL) \
		-DGATE_SUBLEVEL=$(SUBLEVEL) \
		-DGATE_EXTRAVERSION=\"$(EXTRAVERSION)\" \
		-DGATE_NAME=\"$(NAME)\"
build:
	@echo "CC boot.S"
	$(NOECHO)gcc -c -g -Os -ffreestanding -Wall -Werror -I utils/ boot.S -o bootgate.o
	@echo "LD bootgate.img"
	$(NOECHO)ld -static -nostdlib --nmagic -o bootgate.elf bootgate.o -Ttext 0x7c00
	$(NOECHO)objcopy -O binary -j .text bootgate.elf bootgate.out
	$(NOECHO)dd if=/dev/zero of=bootgate.img ibs=1k count=1440 status=none
	$(NOECHO)dd if=bootgate.out of=bootgate.img conv=notrunc status=none
