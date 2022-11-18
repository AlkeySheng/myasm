data segment
    a db -1,-55
data ends
code segment 
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    mov ah,4ch
    int 21h
code ends
end start