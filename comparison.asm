.model small
.stack 100h

.data


.code
main proc
mov bl, '6'
mov bh, '4'
cmp bl, bh
jg l1
jl l2
jmp l3

l1:
mov ah, 2
mov dl, bl
int 21h
jmp Exit

l2:
mov ah, 2
mov dl, bh
int 21h
jmp Exit

l3:
mov ah, 2
mov dl, 'e'
int 21h

Exit:
mov ah, 4ch
int 21h

main endp
end main

