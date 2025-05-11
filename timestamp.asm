%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'

SECTION .data
msg1 db 'Seconds since January 1st : ',0
msg2 db '',0

SECTION .bss


SECTION .text
global _start

_start:
mov eax, msg1
call sprint

mov eax, 13
int 0x80

call iprintLF

call exit
