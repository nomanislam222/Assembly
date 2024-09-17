.model small
.stack 100h
.data
msg1 db "Enter Hexa input : $"
msg2 db "Hexa Output: $"
.code
main proc
    
    mov ax, @data
    mov ds,ax
    mov ah,9
    lea dx, msg1
    int 21h
    
    mov ah,1
    mov cx,4
    
    input:
    int 21h
    cmp al,0Dh
    je output
    cmp al,41h
    jge Char
    jl digi 
    
    
    Char:
    sub al,37h
    shl bx,4
    or bl,al
    jmp loop1   
    
    digi:
    sub al,30h
    shl bx,4
    or bl, al
    jmp loop1
    
    loop1:
    loop input
    
    Output: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov ah,9
    lea dx, msg2
    int 21h
    mov cx,4
    
    check:
    mov dl, bh
    shr dl,4
    rsol bx,4 
    cmp dl, 0Ah
    jge great
    jl less
    
    great:
    mov ah,2
    add dl, 37h
    int 21h 
    jmp loop_
    
    less:
    mov ah,2
    add dl,30h
    int 21h
    jmp loop_
    
    loop_:
    loop check
