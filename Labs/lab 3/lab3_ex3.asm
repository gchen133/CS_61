;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 3, ex 3
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.ORIG x3000
    LEA R0, intro
    PUTS

    LD R1, ARRAY_POINTER
    
    ADD R2, R2, #10
    ADD R3, R3, #10
    
    DO_WHILE_LOOP
    AND R0, R0, #0
    GETC
    OUT
    STR R0, R1, #0
    ADD R1, R1, #1

    ADD R2, R2, #-1
    
    BRp DO_WHILE_LOOP
    
    LD R0, newline
    OUT
    
    LD R1, ARRAY_POINTER
    
    DO_WHILE_LOOP_2
    LDR R0, R1, #0
    OUT
    LD R0, newline
    OUT
    ADD R1, R1, #1
    ADD R3, R3, #-1
    
    BRp DO_WHILE_LOOP_2
    
HALT
    intro .STRINGZ "Enter 10 characters: \n"
    newline .FILL x0A
    ARRAY_POINTER .FILL x4000
    
    .end
    
.ORIG x4000
    ARRAY_REMOTE .BLKW #10
    .end
