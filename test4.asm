DATA	SEGMENT 
BUFFER	DW  36 ,17,90,8,80,19,125,20,00,50    
COUNT	EQU  $ - BUFFER 
DATA	ENDS
CODE	SEGMENT
START:MOV   AX,DATA
   	  MOV   DS,AX
      MOV   DX,2       ; 大循环变量I
CONT1: MOV  CX,COUNT			                  			
	  MOV SI,CX
	  DEC SI
      DEC SI 
   	  SHR CX,1	;小循环变量J
   	  MOV BX,CX	;交换标志

AGAIN:MOV AX,BUFFER[SI]
   	  CMP AX,BUFFER[SI-2]
	  JGE  NEXT
    	XCHG  AX,BUFFER[SI-2]
    	MOV  BUFFER[SI],AX
    	MOV  BX,CX  ;置交换标志为J
NEXT:DEC  SI
   	 DEC  SI
	 DEC  CX                 	
   	 CMP  CX,DX
     JGE  AGAIN
    CMP  BX,COUNT/2
    JE   DONE
    INC  DX
    JMP  CONT1
DONE:MOV AH,4CH
    INT 21H
CODE	ENDS
    END START

