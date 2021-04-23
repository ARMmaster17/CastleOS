SOURCES=boot.o main.o monitor.o common.o descriptor_tables.o isr.o interrupt.o gdt.o timer.o paging.o kheap.o
CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector -m32
LDFLAGS=-Tlink.ld -melf_i386
ASFLAGS=-felf32

all: $(SOURCES) link 

clean:
	-rm *.o kernel.bin ../iso/boot/kernel.bin

link:
	ld $(LDFLAGS) -o kernel.bin $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<

iso:
	cp kernel.bin ../iso/boot/kernel.bin
	grub-mkrescue -o castleos_v0.iso ../iso