%include './mylibs/strings.asm'

SECTION .data
filename db 'filecreate.txt',0
msg db ' -updated-',0

SECTION .bss


SECTION .text
global _start

_start:
mov ecx, 1
mov ebx, filename
mov eax, 5
int 80h

mov edx, 2 ;go at end of file
mov ecx, 0
mov ebx, eax ;put openfile filedzscriptor to ebx
mov eax, 19 ;syscall lseek
int 80h

mov edx, 11
mov ecx, msg
mov ebx, ebx ;put previous file descriptor to ebx agaín
mov eax, 4 ;syswrite syscall
int 80h


call exit

