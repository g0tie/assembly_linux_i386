%include './mylibs/strings.asm'

SECTION .data
parentMsg db 'parent process',0
childMsg db 'child process',0


SECTION .text
global _start

_start:

mov eax, 2 ;SYS_fork
int 0x80

cmp eax, 0
jz child

parent:
mov eax, parentMsg
call sprintLF

call exit


child:
mov eax, childMsg
call sprintLF

call exit
