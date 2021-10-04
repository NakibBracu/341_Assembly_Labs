.MODEL SMALL

.STACK 100H

.DATA
a db 10,13,"Enter First Side $"   
b db 10,13,"Enter Second Side $"
c db 10,13,"Enter Third Side $"
d db "Y$"
e db "N$"

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
int 21h;  

;take input1, sub 48 to be in the same input
mov ah,1
int 21h

mov bl,al
sub bl,48
mov number1,bl      

;2nd prompt
lea dx,b
mov ah,9
int 21h;  

;take input2, sub 48 to be in the same input
mov ah,1
int 21h

mov bh,al
sub bh,48 
mov number2,bh

;3rd prompt
lea dx,c
mov ah,9
int 21h;  

;take input3, sub 48 to be in the same input
mov ah,1
int 21h

mov ch,al
sub ch,48
mov number3,ch 

;new line
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h 

;1st input bl
;2nd input bh
;3rd input ch

;now check if bl+bh>ch
;bl+ch>bh
add bl,bh;1st+2nd>3rd kina
cmp bl,number3
jg  rest_condition_1
jmp triangle_nah


rest_condition_1:
add bh,ch;2nd+3rd>1st kina
cmp bh,number1;3rd ch e still save
jg  rest_condition_2
jmp triangle_nah

rest_condition_2:
add ch,number1;1st+3rd>2nd ki nah
cmp ch,number2
jl  triangle_nah
jmp triangle




triangle:
lea dx,d
mov ah,9
int 21h;
jmp exit

triangle_nah:
lea dx,e
mov ah,9
int 21h;
          
         

exit:

;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN