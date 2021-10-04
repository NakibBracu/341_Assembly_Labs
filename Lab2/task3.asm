.MODEL SMALL

.STACK 100H

.DATA
msg1 db 'Enter First Initial $'
msg2 db 'Enter Second Initial $' 
msg3 db 'Enter Third Initial $'

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX


;prompt print hobe
mov ah,9
lea dx,msg1
int 21h
;taking input by calling ah function , where al register saves the input
mov ah,1
int 21h
mov BL,AL
;next line 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h  
;prompt print hobe
mov ah,9
lea dx,msg2
int 21h
;taking input by calling ah function , where al register saves the input
mov ah,1
int 21h
mov CL,AL
;next line 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h          
;prompt print hobe
mov ah,9
lea dx,msg3
int 21h
;taking input by calling ah function , where al register saves the input
mov ah,1
int 21h
mov DH,AL
;next line e output nibe
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
;print
mov AH,2
mov DL,DH
int 21h  
;next line e output nibe
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
;print
mov AH,2
mov DL,CL
int 21h
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