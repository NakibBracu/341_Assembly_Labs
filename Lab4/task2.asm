.MODEL SMALL

.STACK 100H

.DATA
pos dw ?
sum dw ?
val dw ?

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here
mov pos,1;even position er age (-) portese
mov sum,-1
mov val,1
start:
;loop breking condition
cmp val,1024;#
jg  print
;position checking divisible by 2 or not ,2 diye divisible hole - bosbe
mov ax,0;register refresh 
mov ax,pos
mov ah,0
mov ch,2
mov dx,0
div ch
mov bx,ax
mov dl,bh
cmp dl,0
je  minusbosbe_term_er_age
mov ax,val
mov cx,2
mul cx ;2 diye gun
mov val,ax;value eikhane update
mov cx,sum
add cx,val ;sum = sum + val; jodi position odd hoi
mov sum,cx ;sum er value update

;pos++  
mov cx,0 ; rigister update
mov cx,pos
inc cx
mov pos,cx  



jmp start 

minusbosbe_term_er_age:
;val = val*(-1)
;sum = sum +val
mov ax,0 ; rigister update
mov ax,val
mov bx,0 ; rigister update
mov bx,-1
mul bx;ax = ax*bx = -val
mov bx,2
mul bx;val = 2*val
mov val,ax;val update 
mov bx,0 ; rigister update
mov bx,sum
add bx,val;sum = sum + val
mov sum,bx
neg val ;-ve val take +ve kore nilam
;pos++
mov cx,0 ; rigister update
mov cx,pos
inc cx
mov pos,cx 

jmp start


print:
mov bx,0 ;rigister update
mov bx,sum
mov dx,0 ;rigister update
mov dx,bx
mov ah,2
int 21h

exit:


;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN