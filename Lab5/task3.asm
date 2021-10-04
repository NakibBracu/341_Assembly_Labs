.MODEL SMALL

.STACK 100H

.DATA

a db 5 <?> 
       
.CODE
MAIN PROC

;initizlize DS

MOV AX,@DATA
MOV DS,AX

; enter your code here

mov cx,5
mov bx,offset a
;ai nicher loop er maddhome 5 ta input nicci
input: 
mov ah,1;input er jonno  "single character input nibo"
int 21h
mov [bx],al ;al er moddhe input ta save ase jeta si e niye nilam

inc bx ;bx++

loop input
; next line
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

;now sort korbo
;1st number 2nd number theke choto hole swap korbo nah

mov cx,5
dec cx

loop1:

mov bx,cx; cx er value bx e nilam
mov si,0; si er value 0 korlam [ swapping  korte  lagbe ]

loop2_where_compare:
mov al,a[si]
mov dl,a[si+1]
cmp al,dl;1st er tah tik tar porer index er sathe compare kortese 
jc  no_swap_needed  ;carry 1 thakle 1st number choto 2nd number boro 
;descending chaile just 'jnc' liklei hoito upore [cause tokon 2nd index er number choto hole swap kora lagto nah]
;swapping here
;jodi 2nd value choto and 1st value boro hoi
;si<---dl
;si+1<--al
mov a[si],dl
mov a[si+1],al
no_swap_needed:
inc si ; si++
dec bx ; dx-- (outer loop sotik somoi e bondher jonno)
jnz loop2_where_compare;abar loop2_where_compare e giye next index and tar porer index er value niye compare korbe
 
loop loop1;ai loop ta cholte thakbe and vitorer loop e array er element gula proyojon onujai swap hoye sort hobe
;ending of loop1
;ekon sorted array tah just print korbo ek ekta kore element
mov cx,5
lea si,a ;punorai assign korlam si e 'a' array tah ebar input soho sorted array ready 

print_sorted_array:
mov ah,2; output er jonno 
mov dl,[si]
int 21h
 
inc si 

loop print_sorted_array
 
;exit to DOS
MOV AX,4C00H
INT 21H

MAIN ENDP
   END MAIN