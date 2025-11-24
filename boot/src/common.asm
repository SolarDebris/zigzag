;[org 0x7C00]
bits 16

print_string:
    cld

print_string_loop:
    lodsb 
    or al, al
    jz loop

    call print_char

    jmp print_string_loop

print_char:
    mov ah, 0x0e
    int 0x10

    ret


