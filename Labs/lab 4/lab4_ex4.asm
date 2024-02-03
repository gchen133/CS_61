;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 4, ex 4
; Lab section: 023
; TA: Abhshek Premnath
; 
;=================================================
.ORIG x3000

;instructions

LD R1, DATA_PTR

AND R3, R3, #0
ADD R3, R3, #11 ;counter

AND R2, R2, #0
ADD R2, R2, #1

LOOP
    STR R2, R1, #0      ;stores values of the array into R2
    
    AND R4, R4, #0
    ADD R4, R3, #-11    ;subtracts ten from counter 
    
    BRz TRUE
    
    ADD R5, R5, R5 ;add value of r5 to itself
    ADD R1, R1, #1 ;next memory address
    AND R2, R2, #0 
    ADD R2, R5, #0 ;add value of r5 into r2
    
    BR EXIT
    
    TRUE 
    AND R5, R5, #0 
    ADD R5, R2, #0 ;r5 = 1
    
    EXIT
    
    ADD R3, R3, #-1 ;decrement the counter
    
    BRp LOOP
    
    LDR R2, R1, #6
    LD R1, DATA_PTR
    
    AND R6, R6, #0
    ADD R6, R6, #10
    
    LOOP2 
        LDR R0, R1, #0
        OUT
        ADD R1, R1, #1
        
        ADD R6, R6, #-1
        BRp LOOP2
    
    
HALT

;local data

DATA_PTR .FILL x4000

.END

;remote data
.ORIG x4000

array .BLKW #10

.END