data segment
    org 3000h
    score db 10 dup (?)
    org 3100h
    sorted db 10 dup (?)
data ends

assume ds:data,cs:code

code segment
start:
    mov ax,data
    mov ds,ax
    mov dx,2

    mov si,score
    mov di,sorted
a0: mov cx,count
    mov si,cx
    dec si
    dec si
    shr cx,1
    mov bx,cx
a1: mov ax,[si]
    mov bx,[si - 2]
    cmp ax,bx
    jle a2
    xchg ax,[si-2]
    mov [si],bx
    mov bx,cx
a2: dec si
    dec si
	dec cx                 	
   	cmp cx,dx
    jge a1
    cmp  bx,count/2
    je a3
    inc dx
    jmp a0

a3: mov ah,4ch
    int 21h
code ends
end start

