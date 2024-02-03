;=========================================================================
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
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;=================================================================================

.ORIG x3000		
;-------------
;Instructions
LD R0, introPromptPtr
PUTS
;-------------
						
; Set up flags, counters, accumulators as needed

AND R2, R2, #0
ADD R2, R2, #5 ;counter for digits inputted
LD R3, offset_1
NOT R3, R3
ADD R3, R3, #1

LD R4, offset_2
NOT R4, R4
ADD R4, R4, #1
;there should be 3 flags, one for the "+" symbol, one 
;for the "-" symbol, and one for without any symbol,
;just a number, which means its positive


; Get first character, test for '\n', '+', '-', digit/non-digit 	
					
; is very first character = '\n'? if so, just quit (no message)!
AND R0, R0, #0
GETC
ADD R0, R0, R3  
BRn Pos_Branch
BRz Neg_Branch
; is it = '+'? if so, ignore it, go get digits
Pos_Branch
    GETC
    ADD R0, R0, R4
    
    
    ADD R2, R2, #-1
    BRp Pos_Branch
; is it = '-'? if so, set neg flag, go get digits
Neg_Branch		

; is it < '0'? if so, it is not a digit	- o/p error message, start over

; is it > '9'? if so, it is not a digit	- o/p error message, start over
				
; if none of the above, first character is first numeric digit - convert it to number & store in target register!
None_Branch
; Now get remaining digits from user in a loop (max 5), testing each to see if it is a digit, and build up number in accumulator

LD R0, newline
OUT

HALT

;---------------	
; Program Data
introPromptPtr  .FILL xB000
errorMessagePtr .FILL xB200
newline .FILL x0A
offset_1 .FILL #45
offset_2 .FILL #57
;---------------

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

.ORIG x4000
	Num_array .BLKW #5

.END
;-------------------
; PURPOSE of PROGRAM
;-------------------
; Convert a sequence of up to 5 user-entered ascii numeric digits into a 16-bit two's complement binary representation of the number.
; if the input sequence is less than 5 digits, it will be user-terminated with a newline (ENTER).
; Otherwise, the program will emit its own newline after 5 input digits.
; The program must end with a *single* newline, entered either by the user (< 5 digits), or by the program (5 digits)
; Input validation is performed on the individual characters as they are input, but not on the magnitude of the number.
