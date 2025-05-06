SECTION .text
global _start

exit:
    xor ebx,ebx
        mov eax,1
            int 0x80

            strlen:
                push ebx
                    mov ebx,eax
                    nextchar:
                        cmp byte [eax],0
                            jz finished
                                inc eax
                                    jmp nextchar
                                    finished:
                                        sub eax,ebx
                                            pop ebx
                                                ret

                                                sprint:
                                                    push edx
                                                        push ecx
                                                            push ebx
                                                                push eax
                                                                    call strlen
                                                                        mov edx,eax
                                                                            pop eax

                                                                                mov ecx, eax
                                                                                    mov ebx, 1
                                                                                        mov eax, 4
                                                                                            int 0x80
                                                                                                pop ecx
                                                                                                    pop ebx
                                                                                                        pop edx
                                                                                                            ret

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
                                                                                                                                                    add edx, 48           ; correct, keep it

                                                                                                                                                        ; changed from just `push edx` to two pushes to ensure null-terminated string
                                                                                                                                                            push 0                ; <-- added null terminator
                                                                                                                                                                push edx              ; <-- change: now digit is followed by null for sprint

                                                                                                                                                                    cmp eax,0
                                                                                                                                                                        jnz convertNbToUnit

                                                                                                                                                                        printLoop:
                                                                                                                                                                            dec ecx
                                                                                                                                                                                mov eax, esp
                                                                                                                                                                                    call sprint
                                                                                                                                                                                        add esp, 8            ; <-- change: clean up 2 pushes (digit + null)
                                                                                                                                                                                            cmp ecx,0
                                                                                                                                                                                                jnz printLoop

                                                                                                                                                                                                    pop esi
                                                                                                                                                                                                        pop edx
                                                                                                                                                                                                            pop ecx
                                                                                                                                                                                                                pop eax
                                                                                                                                                                                                                    ret

                                                                                                                                                                                                                    _start:
                                                                                                                                                                                                                        mov ecx,0
                                                                                                                                                                                                                        nextNumber:
                                                                                                                                                                                                                            inc ecx
                                                                                                                                                                                                                                mov eax, ecx
                                                                                                                                                                                                                                    call iprint
                                                                                                                                                                                                                                        cmp ecx, 10
                                                                                                                                                                                                                                            jne nextNumber
                                                                                                                                                                                                                                                call exit
