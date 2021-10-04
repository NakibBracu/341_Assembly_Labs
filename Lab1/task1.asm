.MODEL SMALL

.STACK 100H

.DATA

a db 2
b db 4
       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here (task1)
mov AL,a
mov BL,b
add AL,2
sub BL,2 
add AL,48 ;if we want to see the actual result then add 48 with the result
add BL,48
  
mov AH,2
mov DL,AL;4 asbe
int 21h  
 
mov AH,2
mov DL,BL;2 asbe
int 21h


;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN