

all:
	nasm -fbin src/boot_sector.asm -o build/boot_sector.bin
	nasm -fbin src/switch_mode.asm -o build/switch_mode.bin
	cat build/boot_sector.bin build/switch_mode.bin > build/disk.img

clean:
	rm -rf build/*

	

