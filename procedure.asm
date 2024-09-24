.model small
.stack 100h

.data
.code

input proc
    mov ah,1
    int 21h
    mov bl,al
    ret
    input endp

newline proc
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    ret
    newline endp

display proc
    mov ah,2
    mov dl, bl
    int 21h
    ret
    display endp   

main proc
    call input
    call newline
    call display
    mov ah,4ch
    int 21h
    ret 
    main endp
end main