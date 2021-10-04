.MODEL SMALL

.STACK 100H

.DATA
a db 10,13,"Give the month number $"
b db "30 $"
c db "31 $"
d db "28 $"

input db ?
       
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

;take input, sub 48 to be in the same input
mov ah,1
int 21h

mov bl,al
sub bl,48 

;register output dekhanor template
;mov AH,2
;mov DL,bl ;bl register er output screen e dekbo
;int 21h 

;new line
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h   
;january,february,march..... 1,2,3
;2 hole 28 specific case
;now even hole(4,6)
;odd hole(1,3,5)
;odd er logic build korle even sorasori 31
;ekon bl e amar ase input jeta system al theke bl e nisilam 
;ata 2 er sathe compare kore mille sorasori 28 print
;otherwise odd case nilam
;odd er sathe 1 jog kore seta 2 diye divisible kina deklam
;2 diye divisible na hole jump kore 30 din print
;ar hole 31 din print kore jmp exit
;ax jehetu update hoi barbar tai jhamel aranor jonno bx e ax er value mov korlam
;bx er bh e vagsesh thake jeta dl namok register e niye 0 er sathe compare korlam then 
;bakita hoye gelo
cmp bl,2
je  february

mov cl,bl;
add bl,1
mov al,bl
mov ch,2
mov ah,0;overflow aranor jonno
div ch  
mov bx,ax
mov dl,bh
cmp dl,0
jne days_30

lea dx,c
mov ah,9
int 21h;
jmp exit
days_30:
lea dx,b
mov ah,9
int 21h;
jmp exit



february:
lea dx,d
mov ah,9
int 21h

exit:

;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN