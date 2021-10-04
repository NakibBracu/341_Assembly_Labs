.MODEL SMALL

.STACK 100H

.DATA


low db ?
high db ?



       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here


;limit taken
mov ah,1
int 21h
;sub al,48
mov low,al 



;now take second input and move it to high
mov ah,1
int 21h
;sub al,48
mov high,al   

mov cl,high ;cl = high means loop high bar cholbe and decrement hobe high theke 1 kore
mov bl,low;register e value rekhe print
mov dh,3
;next line e output show korbe
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

start:
cmp cl,low
je  exit;eikhane jl dile answer milbe nah karonta ki?
;start hocce 1st theke tai first limit ekbar compare hoye jacce 1st ei 
;tai cl er value kome lower limit e asle 2nd time check korar dorkar nai

mov al,bl
mov ah,0 ;overflow eranor jonno
div dh
;mov bx,ax
mov dl,ah
cmp dl,0
je  print   

inc bl; bl = bl+1

loop start 

print:
mov dl,bl
mov ah,2
int 21h
inc bl
jmp start


exit:


;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN