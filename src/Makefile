SOURCES=boot.o main.o
CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector -m32
LDFLAGS=-Tlink.ld -melf_i386
ASFLAGS=-felf32

all: $(SOURCES) link 

clean:
	-rm *.o kernel.bin

link:
	ld $(LDFLAGS) -o kernel.bin $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<

iso:
	cp kernel.bin ../iso/boot/kernel.bin
	grub-mkrescue -o castleos_v0.iso ../iso