;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 3, ex 2
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.ORIG x3000
    LEA R0, intro
    PUTS

    LEA R1, ARRAY_LOCAL
    
    ADD R2, R2, #10
    
    DO_WHILE_LOOP
    AND R0, R0, #0
    GETC
    OUT
    STR R0, R1, #0
    ADD R1, R1, #1
    ADD R2, R2, #-1
    
    BRp DO_WHILE_LOOP

 
HALT
    ARRAY_LOCAL .BLKW #10
    intro .STRINGZ "Enter 10 characters: \n"
    ;HEX_ .FILL #
    
    .end
