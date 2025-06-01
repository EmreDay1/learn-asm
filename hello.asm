section .data
    msg db "Hello, world!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, msg        ; message to write
    mov edx, len        ; message length
    int 0x80            ; call kernel

    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; return 0
    int 0x80
