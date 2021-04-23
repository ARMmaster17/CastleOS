SOURCES=boot.o main.o monitor.o common.o descriptor_tables.o isr.o interrupt.o gdt.o timer.o paging.o kheap.o
CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector -m32
LDFLAGS=-Tlink.ld -melf_i386
ASFLAGS=-felf32

all:
	$(MAKE) clean
	$(MAKE) assembly
	$(SOURCES) link

clean:
	-rm obj/*.o bin/kernel.bin iso/boot/kernel.bin

link:
	ld $(LDFLAGS) -o bin/kernel.bin $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<

assembly:
	as src/boot.s -o obj/boot.o

cpp:
	gcc -c src/kernel.c -o obj/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra -nostdlib -fno-builtin -fno-stack-protector -m32

iso:
	cp bin/kernel.bin iso/boot/kernel.bin
	grub-mkrescue -o castleos_v0.iso ../iso