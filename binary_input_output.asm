.model small
.stack 100h
.data 
msg1 db "Enter Input: $"
msg2 db "Binary Output: $"
.code

main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, msg1
        int 21h
        
        mov ah,1
        mov cx, 16
        
        Input:
        int 21h
        cmp al, 0dh
        je output
        
        sub al, 30h
        shl bx, 1
        or bl, al
        loop input
        
        output:
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        mov ah, 9
        lea dx, msg2
        int 21h
        mov cx, 16
        
        
        Check:
        shl bx, 1
        jc ONE
        mov ah, 2
        mov dl, '0'
        int 21h  
        jmp Loop_
        
        
        ONE:
        mov ah, 2
        mov dl, '1'
        int 21h
        jmp loop_
        
        Loop_:
        loop Check
        
    
