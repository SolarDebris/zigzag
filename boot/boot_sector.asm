[org 0x7C00]
bits 16

start:
    ; Set DS = CS so data labels are valid for LODSB
    push cs
    pop ax
    mov ds, ax
    mov es, ax
    
    ; Setup stack to 0x7C00
    xor ax, ax
    mov ss, ax
    mov sp, 0x7C00

    cld

print_startup:
    mov si, startup_string

print_string:
    lodsb 
    or al, al
    jz loop

    call print_char

    jmp print_loop

loop:
    jmp loop

print_char:
    mov ah, 0x0e
    int 0x10

    ret

startup_string db "[*] Starting up zigzag kernel bootloader", 10, 0

times 510-($-$$) db 0

dw 0xaa55
