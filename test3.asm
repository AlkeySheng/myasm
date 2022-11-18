assume cs:code
code segment
start:
      mov bl,0h
      mov bh,1h
      mov dx,0h
a0:   inc bl
      mov bh,bl
      inc bh
      mov al,bh
      mul bl
      cmp ax,200
      ja a1
      add dx,ax
      jmp a0
      
a1: mov ah,4ch
      int 21h
code ends
end start