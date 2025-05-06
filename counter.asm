
%include './mylibs/strings.asm'

SECTION .data
msg1 db '',0
msg2 db '',0

SECTION .bss


SECTION .text
global _start

_start:
mov ecx,10

loopNb:
cmp ecx,0
jz end

dec ecx
mov eax, ecx
add eax, 48

push eax
mov eax, esp
call sprintLF

pop eax
jmp loopNb


end:
call exit
