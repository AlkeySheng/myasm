assume cs:code, ds:data

data segment
    a db dup 100 ?
data ends

code segment
start:
    mov ax,data
    mov ds,ax

    mov si,ds:0h
    mov di,ds:10h
    mov cx,10h

    cmp si,di
    ja a1

    add si,cx
    dec si
    add di,cx
    dec di
a0: mov al,[si]
    mov [di],al
    dec si
    dec di
    loop a0
    jmp a2
a1: mov al,[si]
    mov [di],ax
    inc si
    inc di
    loop a1
a2:	mov ah,4ch
	int 21h
code ends
end start