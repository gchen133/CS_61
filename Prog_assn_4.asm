;========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Assignment name: Assignment 4
; Lab section: 023
; TA: Abhisheck Premnath
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;========================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

START 		
AND R4, R4, #0		
AND R5, R5, #0		
AND R3, R3, #0		
LD R6, COUNTER

;Intro_Message
LD R0, introPromptPtr
PUTS

;START OF PROGRAM
LOOP
    GETC	
    ADD R1, R0, #0
    LD R7, NEG_NEWLINE
    ADD R1,R1,R7
    BRnp OUTPUT_CHAR

OUTPUT_CHAR
    OUT		
    BRnzp INPUT_CHAR	

INPUT_CHAR		

    ADD R1,R0,#0	
    LD R7, OFFSET_1		
    ADD R1, R1, R7	
    BRn OTHER_CHAR

    ADD R1, R0, #0	
    LD R7, OFFSET_2		
    ADD R1, R1, R7	
    BRp BAD_CHAR	

    ADD R1, R6, #0
    ADD R1, R1, #-6
    BRz FIRST_CHAR
	

    ;LD R7,DEC_0
    ADD R4, R4, R4	
    ADD R2, R4, R4
    ADD R2, R2, R2
    ADD R4, R4, R2	


    LD R7, OFFSET_1		
    ADD R0, R0, R7	
    ADD R4, R4, R0	
    
    ADD R6, R6, #-1
    BRp LOOP		
    BRz CHECK_IF_NEG	




FIRST_CHAR
    LD R7, OFFSET_1
    ADD R0, R0, R7	;convert to dec
    ADD R4, R0, R4	;put into r5
    ADD R6, R6, #-2	;decrement by 1, and then another because of lack of sign bit
    BRnzp LOOP		;get next input


OTHER_CHAR
			;check if positive symbol
    LD R7, PLUS		;load (reverse) plus ascii to check
    ADD R1, R0, #0	;copy char into r1
    ADD R1, R1, R7	;add to see if same
    BRz POS_CHAR	;if zero, then it is a plus symbol. send to PLUS_CHAR

			;check if NEG symbol
    LD R7,NEG		;load (reverse) NEG ascii to check
    ADD R1, R0, #0	;copy char into r1
    ADD R1, R1, R7	;add to see if same
    BRz NEG_CHAR	;if zero, then it is a NEG symbol. send to NEG_CHAR
    
			;check if newline symbol
    LD R7, NEG_NEWLINE	;load (reverse) newline ascii to check 
    ADD R1, R0, #0	;copy char into r1
    ADD R1, R1, R7	;add to see if same
    BRz NEWLINE_INPUT	;if zero, then it is a newline. send to NEWLINE_INPUT


BAD_CHAR
    ADD R1, R0, #0
    ADD R1, R1, #-10
    BRnp NEWLINE_ERROR

NEWLINE_ERROR	;output a newline before the error message
    LD R0, NEWLINE
    OUT
    BRnzp ERROR_MSG

ERROR_MSG
    LD R0, errorMessagePtr	;print error message 
    PUTS
    BRnzp START 	;start over

Pos_Char
			;check if first char
    ADD R1, R6, #0	;copy counter to r1
    ADD R1, R1 #-6	;subtract 6 from counter
    BRnp BAD_CHAR	;if not zero, then it's not the first char. send to error
    
			;if zero, then continue: this is the first char
    ADD R5, R5, #0	;set R5 to 0
    ADD R3, R3, #1	;flag for sign bit = 1
    ADD R6, R6, #-1	;decrement counter
    BRnzp LOOP		;send to get next input

NEG_CHAR 
			;check if first char
    ADD R1, R6, #0	;copy counter to r1
    ADD R1, R1, #-6	;subtract 6 from counter
    BRnp BAD_CHAR	;if not zero, then it's not the first char. send to error
	
			
    ADD R5, R5, #1	
    ADD R3, R3, #1	
    ADD R6, R6, #-1	
    BRnzp LOOP

NEWLINE_INPUT
			;check if it's the first char
    ADD R1, R6, #0	;copy counter to r1
    ADD R1, R1, #-6	;subtract 6 from counter
    BRz BAD_CHAR
    
			
    ADD R1, R6, #0	
    ADD R1, R1, #-5
    BRnp CHECK_IF_NEG	

			
    ADD R1, R3, #0
    ADD R1, R1, #-1	
    BRz BAD_CHAR	

    BRnp CHECK_IF_NEG	;if symbol bit is 0 then continue

Two’s_Compliment
    NOT R4, R4
    ADD R4, R4, #1
    BRnzp END

CHECK_IF_NEG
    ADD R1, R5, #0		
    ADD R1, R1, #-1		
    BRz Two’s_Compliment

END
    LD R0, NEWLINE 
    OUT


HALT
;---------------	
;Data
;---------------
DEC_0 .FILL #0
DEC_10 .FILL #9
COUNTER .FILL #6
OFFSET_1 .FILL #-48
OFFSET_2 .FILL #-57
PLUS .FILL #-43
NEG .FILL #-45
NEWLINE .FILL #10
NEG_NEWLINE .FILL #-10

introPromptPtr  .FILL xB000
errorMessagePtr .FILL xB200

.END

;------------
; Remote data
;------------
.ORIG xB000	 ; intro prompt
.STRINGZ	 "Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

.END					
					
.ORIG xB200	 ; error message
.STRINGZ	 "ERROR: invalid input\n"

;---------------
; END of PROGRAM
;---------------

.END