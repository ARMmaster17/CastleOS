build:
	nasm -f elf src/boot.asm -o obj/boot.o
	g++ -c src/kernel.cpp -o obj/kernel.o -ffreestanding -fno-exceptions -fno-rtti
	gcc obj/boot.o obj/kernel.o -T src/linker.ld -o obj/kern -nostdlib -nodefaultlibs -lgcc -ffreestanding -O2
	grub-mkrescue iso --output=kern.iso

clean:
	rm -rf obj/*