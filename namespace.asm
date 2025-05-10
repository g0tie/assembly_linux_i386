%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'

SECTION .data
msg1 db 'hello ',0
msg2 db 'daaaamn ',0
msg3 db 'pk chef'

SECTION .bss


SECTION .text
global _start

_start:

subroutineOne:
mov eax, msg1
call sprint
jmp .finish

.finish:
mov eax, msg2
call sprint
mov eax, 1
call iprintLF

subroutineTwo:
mov eax, msg1
call sprint
jmp .finish

.finish:
mov eax, msg2
call sprint
mov eax, 2
call iprintLF

mov eax, msg1
call sprintLF
jmp finish


finish:
mov eax, msg3
call sprintLF
call exit


