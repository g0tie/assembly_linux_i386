%include './mylibs/strings.asm'

SECTION .data
filename db 'filecreate.txt',0
msg2 db '',0

SECTION .bss


SECTION .text
global _start

_start:
mov ebx, filename
mov eax, 10 ;syscall delete
int 80h

call exit
