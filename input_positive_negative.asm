.model small
.stack 100h

.data
msg1 db "Positive$"
msg2 db "Negative$" 
msg3 db "Zero$"

.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ah,1
    int 21h
    
    cmp al, 30h
    jg l1
    jl l2
    jmp l3 
    
    l1:
    mov ah,9
    lea dx,msg1
    int 21h 
    jmp Exit
    
    l2: 
    mov ah,1
    int 21h 
    
    mov ah,9
    lea dx,msg2
    int 21h 
    jmp Exit 
    
    l3:
    mov ah,9
    lea dx,msg3
    int 21h
    
    Exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main

