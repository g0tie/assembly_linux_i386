
%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'

SECTION .data

SECTION .bss


SECTION .text
global _start

_start:
mov ecx,0


nextNumber:
inc ecx
mov eax, ecx
call iprint
cmp ecx, 9
jnz nextNumber

call exit

