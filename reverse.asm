.model small
.stack 100h
.data
.code
main proc
    mov cx, 8
    xor bx,bx
    mov al,0ACh
    
    Reverse:
    shl al,1
    rcr bl,1
    loop Reverse
    mov al,bl