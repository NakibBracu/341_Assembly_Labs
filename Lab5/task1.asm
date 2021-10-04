.MODEL SMALL

.STACK 100H

.DATA

a db 13 <?> ; Nakib Rahaman

       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA ;data section er jinish code section e use kortesi
MOV DS,AX

; enter your code here
 
mov cx,13
lea si,a
;ai nicher loop er maddhome 13 ta input nicci
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

;ekon output dekabo
mov cx,13
lea si,a ;punorai assign korlam si e 'a' array tah ebar input soho array ready 

output:
mov dx,cx 
cmp dx,0
je  exit
mov dx,0
cmp [si],' '         
je  space_print 
cmp [si],90
jl  make_small
sub [si],32
mov ah,2; output er jonno 
mov dl,[si] 
int 21h
 
inc si
mov dx,0;;; here dl has something from 53 

loop output  
jmp exit;; here if cx=0; then program will read from 62 line so used jmp

space_print:
mov dl,' '
mov ah,2
int 21h
inc si
mov dx,0
loop output ;;not using jmp output so cx value will work accordingly

make_small:
add [si],32
mov ah,2; output er jonno 
mov dl,[si]
int 21h
inc si 
mov dx,0
loop output  ;;not using jmp output so cx value will work accordingly

exit:
;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN