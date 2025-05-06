iprint:
push eax
push ecx
push edx
push esi
mov ecx, 0

convertNbToUnit:
inc ecx
mov edx, 0
mov esi, 10
idiv esi
add edx, 48
push edx
cmp eax,0
jnz convertNbToUnit

printLoop:
dec ecx
mov eax, esp
call sprint
pop eax
cmp ecx,0
jnz printLoop

pop esi
pop edx
pop ecx
pop eax

ret

iprintLF:
call iprint
push eax
mov eax, 0Ah
push eax
mov eax, esp
call sprint
pop eax
pop eax
ret
