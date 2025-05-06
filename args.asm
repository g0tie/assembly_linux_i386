%include './mylibs/strings.asm'

SECTION .text
global _start

_start:
pop ecx

readArgs:
cmp ecx, 0h
jz noArgs
dec ecx
pop eax
call sprintLF
jmp readArgs


noArgs:
call exit
