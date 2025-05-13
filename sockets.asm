%include './mylibs/strings.asm'
%include './mylibs/numbers.asm'

SECTION .data
response db 'HTTP/1.1 200 OK',0Dh,0Ah,'Content-Type: text/html',0Dh,0Ah,'Content-Lenght: 14',0Dh,0Ah,0Dh,0Ah,'Hello World!',0Dh,0Ah,0h
msg2 db '',0


SECTION .bss
buffer resb 255,

SECTION .text
global _start

_start:
	xor eax,eax
	xor ebx,ebx
	xor edi,edi
	xor esi,esi

_socket:
	push byte 6 ;IPROTO_TCP
	push byte 1 ;SOCK_STREAM
	push byte 2 ;AF_INET

	mov ecx, esp
	mov ebx, 1
	mov eax, 102 ;syscall socketcall
	int 80h

_bind:
	mov edi, eax ;put fd
	push dword 0x00000000
	push word 0x2923 ;
	push word 2 ; AF_INET TCP


;it push 3 args for bind (fd, args[], sizeof args)
	mov ecx, esp
	push byte 16 ; size of all args (4 octets + 2octet + 2ocyey)
	push ecx
	push edi

	mov ecx, esp
	mov ebx, 2 ;invoke Binf from socket()
	mov eax, 102 ;invoket socket()
	int 80h
	

_listen:
	push byte 1
	push edi

	mov ecx, esp
	mov ebx, 4 ;listen subroutine from socket()
	mov eax, 102 
	int 80h

_accept:
	push byte 0
	push byte 0
	push edi

	mov ecx, esp
	mov ebx, 5 ;accept() from socket()
	mov eax, 102
	int 80h

_fork:
	mov esi, eax
	mov eax, 2
	int 80h

	cmp eax,0
	jz _read

	jmp _accept

_read:
	mov edx, 255
	mov ecx, buffer
	mov ebx, esi
	mov eax, 3
	int 80h

	mov eax, buffer
	call sprintLF

_write:
	mov edx, 78
	mov ecx, response
	mov ebx, esi ;client fd from accept
	mov eax, 4 ; write syscall
	int 80h

_close:
	mov ebx, esi
	mov eax, 6 ;sysclose
	int 80h
_exit:
	call exit	
