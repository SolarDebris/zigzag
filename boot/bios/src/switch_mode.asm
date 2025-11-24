[org 0x1000]
bits 16

second_stage_start:
    ; Make sure DS points to our code segment (assume same as CS)
    push cs
    pop ds

    mov si, msg
    call print_string

loop:
    jmp loop

msg db "Hello from second stage!", 10, 13, 0

; reuse print_string/print_char by including same common.asm
%include "src/common.asm"
