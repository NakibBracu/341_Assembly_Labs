org 100h      ; offset for com programs


myprog:
               mov ax,@DATA    ; initialize data segment
               mov ds,ax

;Prompt print
mov ah,09h
lea dx,msg1         ; set dx to point to beginning byte of string (ask for first input)
int 21h    


 

;Read one digit number m

               
mov ah,01h
int 21h  ; take 1st input  
SUB al, 48 ; if we sub 48 we get the exact number we need 
mov [m], al ; Store the number in memory variable m
 
;next line code 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov ah,09h
lea dx,msg2         ; set dx to point to beginning byte of string (ask for 2nd input)
int 21h    

;Read one digit number n
               
mov ah,01h
int 21h  ; take 2nd input  
SUB al, 48 ; if we sub 48 we get the exact number we need
mov [n], al ; Store the number in memory variable n   
                         
;next line code 
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

; Put the number of the Stack in the form of a 4-byte number
; This is because we will later have big numbers, that will be 4 bytes wide 
; When we will sum them up, they must all have the same width  

mov dx,0 ;register refresh
mov ax,0 ;register refresh  
mov al,[m] ; variable m moved into register al. bh = 0, bl = m
mov bx, ax ; variable m moved into register bx. bh = 0, bl = m

PUSH dx   
PUSH ax
                        
; Register ax holds the powers of m. 
; to get powers of m, we have to multiply ax with m, cause ax has m already
; After each multiplication we will obtain m, m^2, m^3 etc. until m^n
; Each power of m will be stored on the Stack
    
MOV cx, 2

power_loop:

MUL bx      ; the pair of registers DX:AX will contain the result of the multiplication, for instance m^k, where k is the current value of CL
TEST cl, 1  ; TEST performs an "AND" but it does not make any changes the content of the register
JNZ cl_odd  ; "0" means it is even so for odd we use jump not zero (jnz)
           
cl_even: ;even position holds "-" in the series , that's the reason of choosing it this way
; complementing the result (for example, result 13 will be converted to  -13; 

NOT dx ; complementing
NOT ax ; complementing
ADD ax, 1
ADC dx, 0 ;ADC [add data with carry]

PUSH dx
PUSH ax

; We have to re-complement the result because we need it for the next exponentiations 

NOT dx ; complementing
NOT ax  ; complementing
ADD ax, 1
ADC dx, 0 ;ADC [add data with carry]  

JMP continue ; loop will have to continue through "continue" segement here if it performs in even logic otherwise
             ; if "JMP continue" not written here, then cl_odd will also execute 

; result will be in the Stack with push instruction. The result is composed of 4 bytes: the most significant (MSB) is DX, the least significant is AX (LSB)

cl_odd:
PUSH dx
PUSH ax  

continue:
INC cl

CMP cl, [n]   ; it compare that we calculate to our expected term or not if so then we will exit power loop
              ; until we complete with the expected term we have to keep continue the loop where power will calculated
JLE power_loop

; As power loop calculation ends,we have all the partial terms: m, m^2, m^3 etc. until m^n on the Stack. 
; Now we have to sum these m, m^2, m^3 terms 


MOV cl, 1;again counter
  
add_loop:
  
POP ax   ; ax holds lsb
POP dx   ; dx holds msb
;word ptr = word pointer = 16 bit operand

ADD word ptr [sum], ax;16 bits = 2 byte
ADC word ptr [sum+2], dx; after 2  byte we will find next
   
;The pop instruction removes the 4-byte data element from the top of the hardware-supported stack
;into the specified operand (i.e. register or memory location). It first moves the 4 bytes 
;located at memory location [SP] into the specified register or memory location, and then increments SP by 4.

INC cl

CMP cl, [n]
JLE add_loop ;cl<n that means still calculation left

;Now that we have exited the loop, in the variable sum we have the final result of the series

MOV bx, word ptr [sum]  ;16 bit data move to bx

CMP bx, 0
JG  print_result ;1>0 that means odd position. and if sum end in odd position that means we can have positive sum
                 ;so here we just print the sum

;otherwise even position we will have a negative result thats why put a - before and print result
MOV dl, '-'
MOV ah, 02 ;"-" will be printed
INT 21h  

NEG bx


print_result:  
MOV ax, bx
CALL print_ax; ax data will be printed through the example code given with emu 8086
              
end_prog: 
RET
 

; AX register value can be printed by the method mention below which is an example offered by emu8086

print_ax proc
cmp ax, 0
jne print_ax_r
   push ax
   mov al, '0'
   mov ah, 0eh
   int 10h
   pop ax
   ret 
print_ax_r:
   pusha
   mov dx, 0
   cmp ax, 0
   je pn_done
   mov bx, 10
   div bx    
   call print_ax_r
   mov ax, dx
   add al, 30h
   mov ah, 0eh
   int 10h    
   jmp pn_done
pn_done:
   popa  
   ret  
endp;here print_ax method execution end


; Declaring variables            
msg1 db 'Value of m: $'  ; '$' represents ending of the string
msg2 db 'Value of n: $'  ; '$' represents ending of the string
m db 0
n db 0  
sum dd 0   
;DB - Define Byte. 8 bits
;DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
;DD - Define double word. Generally 4 bytes on a typical x86 32-bit system 

;****************************************************************************************
