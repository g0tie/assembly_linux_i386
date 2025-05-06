%include './mylibs/strings.asm'


SECTION .data
msg1 db 'Insert your name:',0h
msg2 db 'Hello ',0h

SECTION .bss
usrinput: resb 255

SECTION .text
global _start

_start:
mov eax, msg1
call sprint

mov edx, 255
mov ecx, usrinput
mov ebx, 0
mov eax, 3
int 0x80

mov eax, msg2
call sprint

mov eax, usrinput
call sprint

call exit

