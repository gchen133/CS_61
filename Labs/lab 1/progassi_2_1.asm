;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Assignment name: Assignment 2
; Lab section: 023
; TA: 
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
;Instructions
;Get first user input
;move the first input to register 1
;Get second user input
;Add the two integers
;Load the address of the message string
;output the string
;move the sum to R0 so it can be output
;display the sum
;DONE HALT
;MESG .STRINGZ “SUM”
;.END
;----------------------------------------------
;output prompt

;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here

;--------------------------------





HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline .FILL x0A	; newline character - use with LD followed by OUT

;---------------	
;END of PROGRAM
;---------------	
.END

