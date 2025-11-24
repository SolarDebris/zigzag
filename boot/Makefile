

all:
	nasm -fbin src/boot_sector.asm -o build/boot_sector.bin
	nasm -fbin src/stage2.asm -o build/stage2.bin
	cat build/boot_sector.bin build/stage2.bin > build/disk.img

clean:
	rm -rf build/*

	

