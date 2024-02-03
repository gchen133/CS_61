;=================================================
; Name: 
; Email: 
; 
; Lab: lab 6, ex 3
; Lab section: 
; TA: 
; 
;=================================================

; test harness
.orig x3000
LD R6, sys_stack_addr ; R6 is used to backup and restore registers in subroutines
				 
; put your code here				 
				 
halt
;-----------------------------------------------------------------------------------------------
; test harness local data:
base_stack_addr    .fill xA000
sys_stack_addr     .fill xFE00 ; do not use, or change



;===============================================================================================
.end

; subroutines:

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
; Return Value: R5 ← updated TOS
;------------------------------------------------------------------------------------------
.orig x3200
; backup registers here				 				 
				 
				 
				 
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

;------------------------------------------------------------------------------------------
; Subroutine: SUB_RPN_ADD
; Parameter (R3): BASE: A pointer to the base (one less than the lowest available
;                       address) of the stack
; Parameter (R4): MAX: The "highest" available address in the stack
; Parameter (R5): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has popped off the top two values of the stack,
;		    added them together, and pushed the resulting value back
;		    onto the stack.
; Return Value: R5 ← updated TOS address
;------------------------------------------------------------------------------------------
.orig x3600
; backup registers here				 				 
				 
				 
				 
; restore registers here				 
ret
;-----------------------------------------------------------------------------------------------
; SUB_RPN_MULTIPLY local data



;===============================================================================================
.end


; SUB_ADDED		

; SUB_GET_NUM		

; SUB_PRINT_DIGIT		Only needs to be able to print 1 digit numbers. 



