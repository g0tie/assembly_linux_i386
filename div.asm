%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'

SECTION .data
msg1 db ' remainder ',0
msg2 db '',0

SECTION .bss


SECTION .text
global _start

_start:
mov eax, 90
mov ebx, 9
div ebx
call iprint

mov eax, msg1
call sprint

mov eax, edx
call iprintLF

call exit
