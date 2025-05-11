%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'


SECTION .data
filename db 'filecreate.txt',0
mot db 'hello',0


SECTION .bss
fileContent resb 255,

SECTION .text
global _start

_start:

mov ecx, 0777o
mov ebx, filename
mov eax, 8 ;file create syscall
int 0x80

mov edx, 6
mov ecx, mot
mov ebx, eax ;file creta put file descriptor to eax when int
mov eax, 4 ; filewrite
int 0x80

mov ecx, 0
mov ebx, filename
mov eax, 5 ;file open
int 80h

call iprintLF

mov edx, 6;nb bytes to read
mov ecx, fileContent ;where to store 
mov ebx, eax ;get file desceiptor from prebious sysopen
mov eax, 3 ;syscall read
int 80h

mov eax, fileContent
call sprintLF

mov ebx,ebx
mov eax, 6
int 80h

call exit
