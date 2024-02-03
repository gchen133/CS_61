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
	LDR R2, R1, #6
	
	HALT

;LOCAL DATA
	DATA_PTR 	.FILL	x4000

.END    
.ORIG x4000
	array .BLKW #10

.END