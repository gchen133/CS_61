;--------------------------------------------------------------
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Assignment name: Assignment 1
; Lab section: 023
; TA: Sarthak Jain
; 
;I hereby certify that I have not received assistance 
;on this assignment, or used code, from ANY outside 
;source other than the instruction team (apart from 
;what was provided in the starter file).
;--------------------------------------------------------------

;--------------------------------------------------------------
;REG VALUES          R0 R1 R2  R3  R4     R5     R6    R7 
;--------------------------------------------------------------
;Pre-loop            0  5  12  12  10020  51646  1622  9136
;Iteration 01        0  4  12  24  10020  51646  1622  9136
;Iteration 02        0  3  12  36  10020  51646  1622  9136
;...
;Iteration n         0  5-n  12  12+12n  10020  51646  1622  9136
;Program ends here   0  32767  12  72  10020  51646  1622  9136
;--------------------------------------------------------------


.ORIG x3000
;-----------
;Instructions
;-----------
LD R1, DEC_6
LD R2, DEC_12
AND R3, R3, x0

DO_WHILE   ADD R3, R3, R2    ;Adds R2 to R3 (R2 doesn't change)
           ADD R1, R1, #-1   ;subtracts 1 from R1
           BRp DO_WHILE      ;if (LMR > 0) go to beginning of DO_WHILE
           
HALT                         ;Ends program
;-----
;Data
;-----

DEC_6  .FILL   #6      ;Put the value 6 into this memory location
DEC_12 .FILL   #12     ;Put the value 12 into this memory location

.END