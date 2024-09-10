.model small
.stack 100h
.data
.code
main proc
    mov cx, 16
    xor bx,bx
    mov ax, 3A2Bh
    
    Reverse:
    shl ax,1
    rcr bx,1
    loop Reverse
    mov ax,bx