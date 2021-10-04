.MODEL SMALL

.STACK 100H

.DATA
x db 2
y db 4
z db 4

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here
mov AL,x;2
mov BL,y;4
mov CL,z;4
mul BL ;AL= AL*BL=2*4=8
div CL;AL= AL/CL =8/4=2
add AL,48;for seeing the output in the expected form           

;display output code
mov AH,2
mov DL,AL
int 21h



;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN