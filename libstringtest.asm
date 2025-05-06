%include './mylibs/strings.asm'

SECTION .data
msg db 'chihuahua', 0
msg2 db 'mc do',0

SECTION .text
global _start


_start:
mov eax, msg2
call sprintLF

mov eax, msg
call sprintLF

call exit
