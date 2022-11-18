assume cs:code,ds:DATA,ss:stack

stack segment
    db 100 dup (?)
stack ENDS

data SEGMENT
    db 3h,'Hello Chen Xiu qi',3h
data ENDS

code segment
start:
    mov ax,data 
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov ax,0b800h
    mov es,ax
    mov si,0
    mov di,160*24+80-18
    mov cx,19
w:  mov al,[si]
    mov es:[di],al
    inc di
    mov al,89h
    mov es:[di],al
    inc si
    inc di
    loop w

    mov ax,4c00h
    int 21H
code ENDS
end start

    


