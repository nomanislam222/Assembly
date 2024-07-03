.model small
.stack 100h
.data 
msg1 db "Your Input: $"
msg2 db "Invalid Character$" 
msg3 db "Sorted: $"
a db ?
b db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,1
    int 21h
    mov a,al
    
    mov ah,1
    int 21h
    mov b,al
    
    
    mov al,a
    cmp al,'A'
    jl Invalid
    cmp al,'Z'
    jl checksec
    cmp al,'a'
    jl Invalid
    cmp al,'z'
    jg Invalid 
    
checksec:
    mov al,b
    cmp al,'A'
    jl Invalid
    cmp al,'Z'
    jl Valid
    cmp al,'a'
    jl Invalid
    cmp al,'z'
    jg Invalid
    
Valid: 
   mov ah,2
   mov dl, 0dh
   int 21h
   mov dl, 0ah
   int 21h
   
   
   mov ah,9
   lea dx, msg1
   int 21h
   
   mov ah,2
   mov dl,a
   int 21h
   mov dl,b
   int 21h 
   
   mov al,a
   cmp al,b
   jle NoSwap
   
   mov al,a 
   mov bl,b
   mov a,bl
   mov b,al 


NoSwap: 
   mov ah,2
   mov dl, 0dh
   int 21h
   mov dl, 0ah
   int 21h
   
   mov ah,9
   lea dx, msg3
   int 21h
   
     
   mov ah,2
    mov dl, a
   int 21h 
   mov dl,b
   int 21h
   jmp Exit 
       
    
    
Invalid:
    mov ah,2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah,9
    lea dx, msg2
    int 21h
    
Exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main