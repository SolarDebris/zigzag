[org 0x7C00]
bits 16

start:
    ; Set DS = CS so data labels are valid for LODSB
    push cs
    pop ax
    mov ds, ax
    mov es, ax
    
    ; Setup stack to 0x8000
    xor ax, ax
    mov ss, ax

    mov sp, 0x8000
    mov bp, sp

    ; mov bx, 0x9000 ;
    ; mov dh, 2 ; read 2 sectors

    ;call disk_load
    
    ; mov dx, [0x9000]
    ; call print_hex
    xor ax, ax
    mov es, ax           ; ES = 0x0000
    mov bx, 0x1000       ; ES:BX = 0000:1000 (physical 0x1000)

    mov dh, 4            ; number of sectors for second stage
    mov dl, [boot_drive] ; drive number from BIOS
    call disk_load       ; reads sectors 2..5 into 0x1000

    ; Now jump to second-stage entry (real mode)
    jmp 0x0000:0x1000    ; far jump, but near works if CS=0 and within range
        
print_startup:
    mov si, startup_string
    call print_string

loop:
    jmp loop

boot_drive db 0


%include "src/common.asm"
%include "src/disk.asm"

startup_string db "[*] Starting up zigzag kernel bootloader", 10, 0

times 510-($-$$) db 0

dw 0xaa55

