.MODEL SMALL

.STACK 100H

.DATA
a db 3 <?> ; declaring an array of length 3

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

;taking inputs
mov cx,3
lea si,a
;ai nicher loop er maddhome 3 ta input nicci
input: 
mov ah,1;input er jonno  "single character input nibo"
int 21h
mov [si],al ;al er moddhe input ta save ase jeta si e niye nilam

inc si; si++

loop input
; next line
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

;abar input neya sesh so maximum khuje ber korbo

mov si,offset a ;array 'a' er first index ta diye dilam
mov cx,3
mov bl,[si]

findmax:
cmp [si],bl
jge maximum  ;minimum khujte hole just 'jle' liklei hoto
;jge dilam cause array er sob gula value same holeo nijei nijer sathe compare kore oitai maximum rakbe
; sobgula value [1 1 1] hole 1 holo ai array er maximum tai emonta korlam
;[si] er moddhe thaka value boro hole seta maximu e giye bl e sei value store kore abar loop e chole asbe
compare_total:;loop er baire theke max tik hoye index++ hocce mane si++(source index++)
inc si
loop findmax 
;loop ekbar sesh mane amar bl er moddhe already largest value stored
;so print the value of bl and immediately close the program
mov dl,bl
mov ah,2
int 21h 
jmp exit;eta na dile comparing choltei thakbe

maximum:
mov bl,[si]
jmp compare_total

exit:

;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN