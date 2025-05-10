%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'
%include './mylibs/atoi.asm'

SECTION .data
msg1 db '',0
msg2 db '',0

SECTION .bss


SECTION .text
global _start

_start:
pop ecx
pop edx

sub ecx,1
mov edx, 0

nextArg:
cmp ecx, 0h
jz noMoreArgs

pop eax
call atoi
add edx, eax

dec ecx
jmp nextArg

noMoreArgs:

mov eax, edx
call iprintLF
call exit
