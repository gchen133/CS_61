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
;REG VALUES          R0 R1 R2  R3  R4 R5 R6 R7 
;--------------------------------------------------------------
;Pre-loop            0  0  0   0   0  0  0  0
;Iteration 01        0  6  12  0   0  0  0  0      
;Iteration 02        0  5  12  12  0  0  0  0
;Iteration 03        0  4  12  24  0  0  0  0
;Iteration 04        0  3  12  36  0  0  0  0
;Iteration 05        0  2  12  48  0  0  0  0
;Iteration 06        0  1  12  60  0  0  0  0
;
;Program ends here   0  32767 12 72 0  0  12286  0 
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