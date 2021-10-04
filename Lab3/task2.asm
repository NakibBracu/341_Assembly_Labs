.MODEL SMALL

.STACK 100H

.DATA
a db 10,13, "1st Input $"
b db 10,13, "2nd input $"
c db "Divisible$"
d db "Not Divisible$"


       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here
;prompt print hobe
lea dx,a
mov ah,9
int 21h; first prompt

;now take first input and move it to bl
mov ah,1
int 21h

mov bl,al
sub bl,48 

lea dx,a
mov ah,9
int 21h; 2nd prompt

;now take 2nd input 
mov ah,1
int 21h
sub al,48 


mul bl
mov bl,al
mov cl,al


mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h



;mov AH,2
;mov DL,BL
;int 21h 

mov al,bl
mov bl,2
mov ch,5 
mov ah,0
div bl
mov bx,ax
mov dl,bh
cmp dl,0
je  check_with_5_also 
 
jmp not_divisible_at_all

check_with_5_also:
mov al,cl
mov ah,0
div ch
mov bx,ax
mov dl,bh
cmp dl,0
jne not_divisible_at_all
lea dx,c
mov ah,9
int 21h;  divisible prompt  
jmp exit   

not_divisible_at_all:
lea dx,d
mov ah,9
int 21h; not divisible prompt  


exit:

;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN