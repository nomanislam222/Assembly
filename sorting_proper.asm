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
    
    ; Read first character
    mov ah,1
    int 21h
    mov a,al
    
    ; Read second character
    mov ah,1
    int 21h
    mov b,al

    ; Validate first character
    mov al,a
    cmp al,'A'
    jl Invalid
    cmp al,'Z'
    jle checksec
    cmp al,'a'
    jl Invalid
    cmp al,'z'
    jle checksec
    
Invalid:
    ; Display invalid character message
    mov ah,9
    lea dx, msg2
    int 21h
    jmp Exit
    
checksec:
    ; Validate second character
    mov al,b
    cmp al,'A'
    jl Invalid
    cmp al,'Z'
    jle Valid
    cmp al,'a'
    jl Invalid
    cmp al,'z'
    jle Valid
    
Valid:
    ; Display input message
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

    ; Convert both characters to uppercase for comparison
    mov al, a
    cmp al, 'a'
    jl Char1Upper
    sub al, 20h  ; Convert to uppercase if it is lowercase

Char1Upper:
    mov bl, b
    cmp bl, 'a'
    jl Char2Upper
    sub bl, 20h  ; Convert to uppercase if it is lowercase

Char2Upper:
    ; Compare and swap if necessary
    cmp al, bl
    jle NoSwap
   
    ; Swap characters if needed
    mov al, a 
    mov bl, b
    mov a, bl
    mov b, al 

NoSwap:
    ; Display sorted message
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
    mov dl, b
    int 21h

    jmp Exit 

Exit:
    mov ah, 4ch
    int 21h
    
main endp
end main
