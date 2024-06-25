.model small
.stack 100h

.data


.code
main proc
   
    mov ah,1
    int 21h 
    mov dl,al
    
    cmp dl,'A'
    jge l1 
    jmp Exit
     
    l1: 
    cmp dl,'Z'
    jle Print 
    jmp Exit
    
    Print:
    mov ah,2
    int 21h 
    
    Exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main

