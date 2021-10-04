.MODEL SMALL

.STACK 100H

.DATA

MSG db 'Enter a number$'
       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX     
;prompt print hobe
mov ah,9
lea dx,MSG
int 21h
;next line e input nibe
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h  

;taking input by calling ah function , where al register saves the input
mov ah,1
int 21h 
sub AL,1
mov BL,AL  


;next line e output nibe
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h    

;print
mov AH,2
mov DL,BL
int 21h



;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN