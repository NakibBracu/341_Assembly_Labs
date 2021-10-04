.MODEL SMALL

.STACK 100H

.DATA
a db 5
b db 1
c db 7

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX              
;A=C-(A+B)
; enter your code here
mov AL,a ;2
mov BL,b ;4
mov CL,c ;7
add AL,BL ;AL=(a+b)=(4+2)=6
sub CL,AL ;CL=(CL-AL)=(7-6)=1
add CL,48 ;Adding 48 will show the actual value as expected(watch ascii codes table)
mov AL,CL ;AL=CL

mov AH,2
mov DL,AL; this will show the output
int 21h




;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN