%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'

SECTION .data
command db '/bin/ls',0
arg1	db	'-l',0
arguments	dd	command
	dd	arg1
	dd	0h
environment dd 0h
	

SECTION .text
global _start

_start:

mov edx, environment
mov ecx, arguments
mov ebx, command
mov eax, 11 ;SYS_EXECVE

int 0x80
call exit
