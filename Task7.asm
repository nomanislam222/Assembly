.model small
.stack 100h

.data 
    msgl db " o$"
    msg2 db " e$"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1   
    int 21h
    
    cmp al, '1'  
    je l1  
    
    cmp al, '2'  
    je l2  
    
    cmp al, '3'  
    je l1  
    
    cmp al, '4'  
    je l2  
    jmp exit  
    
    
l1:
    mov ah, 9   
    lea dx, msgl
    int 21h
    jmp Exit   
    
    
l2:
    mov ah, 9   
    lea dx, msg2
    int 21h
    jmp Exit 
    
    
Exit:
    mov ah, 4ch 
    int 21h

   main endp
end main
