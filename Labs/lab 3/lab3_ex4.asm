;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 3, ex 4
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.ORIG x3000

    LD r4, array
    LD r5, newline
    NOT r5, r5
    AND r5, r5, #1  ;two's compliment
    LEA r0, intro
    PUTS
    AND r0, r0, #0
    ADD r0, r0, x0A
    
    DO_WHILE_LOOP
        AND r0, r0, #0
        GETC
        OUT
        STR r0, r4, #0
        ADD r4, r4, #1 
    
        ;and r0, r0, #0
        ;add r0, r0, x0A
        ;OUT
        ADD r1, r1, #1
        ADD r6, r0, r5
    BRnp DO_WHILE_LOOP
    
    ;ld r1, #10
    LD r4, ARRAY
    
    AND r0, r0, #0
    ADD r0, r0, x0A
    OUT
    AND r0, r0, #0
    
    
    DO_WHILE_LOOP_2
        LDR r0, r4, #0
        OUT
    
        ADD r4, r4, #1
        ADD r1, r1, #-1
    BRp DO_WHILE_LOOP_2
    
    
    AND r0, r0, #0
    ADD r0, r0, x0A
    OUT
        
    HALT
    intro .STRINGZ "Enter 10 characters: \n"
    ARRAY .FILL x4000
    newline .FILL x0A
    
    .end
    
.ORIG x4000
    ;ARRAY .BLKW #100
    .end
