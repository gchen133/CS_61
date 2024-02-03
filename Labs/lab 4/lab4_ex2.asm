;=================================================
; Name: George Chen	
; Email: gchen133@ucr.edu
; 
; Lab: lab 4, ex 1
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.ORIG x3000

	LD R1, DATA_PTR

	AND R2, R2, #0
	ADD R2, R2, #10      ;COUNTER
	
	AND R3, R3, #0
	
	WHILE_LOOP
		STR R3, R1, #0
		
		ADD R1, R1, #1
		ADD R3, R3, #1
		
		ADD R2, R2, #-1
		
		BRP WHILE_LOOP
		
	END_WHILE_LOOP

	LD R1, DATA_PTR
	LD R6, zero
	AND R3, R3, #0
	ADD R3, R3, #10
	AND R4, R4, #0
	
    WHILE_lOOP_2
    	LDR R4, R1, #0 ;store value at array into r4
    	    
    	ADD R4, R4, R6
    	    
    	ADD R0, R4, #0 ;value in r4 into r0 to print
    	    
    	OUT
    	AND R0, R0, #0 ;reset r0
    	ADD R0, R0, X0A ;print newline
    	OUT
    	    
    	ADD R1, R1, #1 ;next index in array
    	ADD R3, R3, #-1 ;decrement counter
    	    
    BRp WHILE_LOOP_2

	
	HALT

;LOCAL DATA
	DATA_PTR 	.FILL	x4000
	zero        .FILL   #48

.END    
.ORIG x4000
	array .BLKW #10

.END