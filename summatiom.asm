.model small
.stack 100h

.data
    msg1 db "Enter 1st Number: $"
    msg2 db "Enter 2nd Number: $"
    msg3 db "Enter 3rd Number: $"
    msg4 db "Summation of $"  
    msg5 db " and $" 
    msg6 db " is $"
    msg7 db ", $"
    a db ?
    b db ?
    c db ? 
    r db ?

.code

main proc
    mov ax, @data
    mov ds, ax

    ;1st line
    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    mov a, al

    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    ;2nd line
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    mov b, al

    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    ;3rd line
    mov ah, 9
    lea dx, msg3
    int 21h

    mov ah, 1
    int 21h
    mov c, al

    mov al, a
    add al, b
    add al, c
    sub al, 60h
    mov r,al

    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h 
    
    mov ah, 9
    lea dx, msg4
    int 21h  
    
    mov ah, 2
    mov dl, a
    int 21h   
        
    mov ah, 9
    lea dx, msg7
    int 21h 
    
    mov ah, 2
    mov dl, b
    int 21h 
    
    mov ah, 9
    lea dx, msg5
    int 21h  
    
    mov ah, 2
    mov dl, c
    int 21h 
           
           
    mov ah, 9
    lea dx, msg6
    int 21h
    
    mov ah, 2
    mov dl, r
    int 21h

    main endp
end main