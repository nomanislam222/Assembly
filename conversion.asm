.model small
.stack 100h

.data
    msg1 db "Enter a small letter: $"
    msg2 db "In capital it is: $"
    a db ?

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
    mov bl, al  

    sub bl, 32
    mov a, bl

    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    ;2nd line
    mov ah, 9
    lea dx, msg2
    int 21h 
    
    mov ah,2
    mov dl, a
    int 21h

    main endp
end main