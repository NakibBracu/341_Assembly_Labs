.MODEL SMALL

.STACK 100H

.DATA
a dw ?

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here

mov ah,1
int 21h 
sub al,48
mov ah,0
mov bx,ax
mov a,bx


mov ah,1
int 21h 
sub al,48
mov dl,al
mov dh,0
mov cx,dx


mov ax,0

start:
cmp cx,0
je  print 
add ax,a


loop start

print:
add ax,48
mov dx,ax
mov ah,2
int 21h
exit:
 


;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN