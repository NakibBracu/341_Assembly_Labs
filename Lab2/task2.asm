.MODEL SMALL

.STACK 100H

.DATA


       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; taking lowercase input from user
MOV AH,1
INT 21H
MOV BL,AL

;GIVING NEW LINE
MOV AH,2
MOV DL,10 
INT 21H
MOV DL,13
INT 21H

;DISPLAY CORRESPONDING UPPERCASE LETTER 
MOV AH,2
SUB BL,32;NORMAL ASCI (a-A)=32 BA HEXA TE LIKLE (a-A)=20H LIKTE HOBE 
MOV DL,BL
INT 21H


 



;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN