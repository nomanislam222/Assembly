.model small
.stack 100h

.data
msg1 db "Capital$"
msg2 db "Small$"
msg3 db "Unknown Character$"

.code
main proc
    mov ax, @data
    mov ds, ax 

    mov ah, 1
    int 21h

    cmp al, 'A'
    jl l3
    cmp al, 'Z'
    jg checkSmall
    jmp l1

checkSmall:
    cmp al, 'a'
    jl l3
    cmp al, 'z'
    jg l3
    jmp l2

l1:
    mov ah, 9
    lea dx, msg1
    int 21h
    jmp Exit

l2:
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp Exit

l3:
    mov ah, 9
    lea dx, msg3
    int 21h

Exit:
    mov ah, 4Ch
    int 21h

main endp
end main
