.model small
.stack 100h
.data
.code
main proc
    mov bx, 8bh
    xor ax,ax
    mov cx,16
    
    Loop_:
    rol bx, 1
    jnc End 
    inc ax
    
    End:
    loop Loop_