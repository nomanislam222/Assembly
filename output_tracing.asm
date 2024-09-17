.model small
.stack 100h
.data
.code
main proc  
      mov ah,2
      mov bl, 04h
      mov cx, 4
      
      l1:
      shl bl,1
      loop l1
      inc bl
      mov dl,bl
      int 21h
      cmp bl,40h
      jg l3 
      
      l2:
      inc bl
      mov dl,bl
      int 21h
      jmp exit
      
      l3:
      rcr bl,2
      rcl bl,1
      shl bl,1
      inc bl
      jmp l2 
      
      exit:
      