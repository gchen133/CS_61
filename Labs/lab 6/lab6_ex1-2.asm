;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 6, ex 1 & 2
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================

; test harness
.orig x3000
LD R6, sys_stack_addr ; R6 is used to backup and restore registers in subroutines

; put your code here				 
				 
				 
halt
;-----------------------------------------------------------------------------------------------
; test harness local data:
base_stack_addr     .fill xA000
sys_stack_addr      .fill xFE00 ; do not use, or change
max_stack_addr      .fill xA005
tos                 .fill xA000


;===============================================================================================
.end

; subroutines:
SUB_STACK_PUSH .fill x3200
SUB_STACK_POP .fill x3400

;------------------------------------------------------------------------------------------
; Subroutine: SUB_STACK_PUSH
; Parameter (R1): The value to push onto the stack
; Parameter (R3): BASE: A pointer to the base (one less than the lowest available
;                       address) of the stack
; Parameter (R4): MAX: The "highest" available address in the stack
; Parameter (R5): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has pushed (R1) onto the stack (i.e to address TOS+1). 
;		    If the stack was already full (TOS = MAX), the subroutine has printed an
;		    overflow error message and terminated.
; Return Value: R6 ← updated TOS
;------------------------------------------------------------------------------------------
.orig x3200
; backup registers here				 
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR
	
	
	
	
	
;------------------------------------
				 
				 
; restore registers here				 
ret
;-----------------------------------------------------------------------------------------------
; SUB_STACK_PUSH local data



;===============================================================================================
.end

;------------------------------------------------------------------------------------------
; Subroutine: SUB_STACK_POP
; Parameter (R3): BASE: A pointer to the base (one less than the lowest available                      
;                       address) of the stack
; Parameter (R4): MAX: The "highest" available address in the stack
; Parameter (R5): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has popped MEM[TOS] off of the stack.
;		    If the stack was already empty (TOS = BASE), the subroutine has printed
;                an underflow error message and terminated.
; Return Value: R0 ← value popped off the stack
;		   R5 ← updated TOS
;------------------------------------------------------------------------------------------
.orig x3400
; backup registers here				 
				 
				 
				 
; restore registers here				 
ret
;-----------------------------------------------------------------------------------------------
; SUB_STACK_POP local data



;===============================================================================================
.end
