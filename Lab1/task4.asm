.MODEL SMALL

.STACK 100H

.DATA
a dw 1
b dw 2
c dw 3
d dw 4
e dw 5
f dw 8
g dw 9

.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX
; enter your code here(Task_4)     
;Apply Bodmas

mov AX,a;1
mov BX,b;2
mov CX,c;3
mov DI,g;9
add CX,AX ;(3+1) =CX
sub DI,BX ;(9-2) =DI
mov AX,3  ;AX=3
mul BX    ;AX=AX*BX=3*2=6
mov SI,AX ;SI = (06)
mov AX,CX ;AX=4 [latest value of CX moved to AX]
mul DI    ;AX=DI*AX=7*4=28
mov BX,4  ;BX=4
div BX    ;AX=AX/BX=28/4=AX=7
mov BX,8  ;BX=8
sub BX,AX ;BX=BX-AX=8-7=1
add BX,SI ;BX=BX+SI=1+6=7
mov AX,BX ;AX=BX
mov BX,5  ;BX=5
add AX,BX ;AX=AX+BX=7+5=12



;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN