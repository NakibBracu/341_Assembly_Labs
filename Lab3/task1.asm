.MODEL SMALL

.STACK 100H

.DATA
a db 10,13, "1st Input $"
b db 10,13, "2nd Input $"
c db 10,13, "3rd Input $"   
;initializing variables
number1 db ?
number2 db ?
number3 db ?
       
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

;now take first input and move it to number1
mov ah,1
int 21h

mov number1,al  

lea dx,b
mov ah,9
int 21h; second prompt
;now take second input and move it to number2
mov ah,1
int 21h

mov number2,al    

lea dx,c
mov ah,9
int 21h; third prompt
;now take third input and move it to number3
mov ah,1
int 21h

mov number3,al 
;next line output dekhanor jonno
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h


mov bl,number1
cmp bl,number2
jnl go_to_number2;number 2 choto hole number 2 te chole jabe
;ekon bl choto hole seta number 3 er sathe compare korbo
cmp bl,number3
jnl go_to_number3;number 3 choto hole number 3 te chole jabe

mov dl,number1
jmp show_the_smallest_number 

go_to_number2: 
mov bl,number2
cmp bl,number3
jnl go_to_number3;jodi number3 choto hoi tahole number 3 er label e giye number 3 print korbo
;number 3 ekon chot na hole number 3 ke dl e niye print korbo
mov dl,number2 ; dl e nilam kenona dl er valuei print hoi 
jmp show_the_smallest_number  

go_to_number3:
mov dl,number3
jmp show_the_smallest_number


show_the_smallest_number:
mov ah,2
int 21h

exit:
;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN