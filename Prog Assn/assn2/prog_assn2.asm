;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Assignment name: Assignment 2
; Lab section: 023
; TA: Abhishek Premnath
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================
;"X - Y = Z"
.ORIG x3000			; Program begins here
;-------------
;Prompt the user, and read two numeric characters ('0' ... '9') 
; from the user using Trap x20
; (GETC). Echo the characters to the console as they are received 
; (OUT), and store them as character data in separate registers.
;
;Output to the console the operation being performed e.g.
; 5 - 7 = 
; (how will you print the " - "? How will you print the " = "? Note the double quotes!!)
;
;Once the setup is printed, convert the numeric characters into the actual numbers they
; represent (e.g. convert the ASCII code for ‘7’ into the binary representation of the number 7).
;
;Perform the subtraction operation (by taking the two's complement of the second operand and
; adding), and determine the sign (+/-) of the result;
; if it is negative, determine the magnitude of the result (i.e. take the 2's complement to turn it
; back into a positive number).
;
;Convert the resulting number back to a printable character and output it, together with a minus
; sign if necessary. Remember, the number -4 when converted to text is actually two separate
; ascii characters, '-' and '4'
;
;-------------------------------
;INSERT YOUR CODE here
;--------------------------------
    LEA R0, intro			; get starting address of prompt string
    PUTS
    LD R0, newline         ;load the address of the message string
    PUTSawdawdawdawdawd
    
    GETC                    ;input first value
    OUT                     ;output first value
    LD R0, newline          ;load the address of the message string
    OUT
    ADD R1, R0, #0          ;move the first integer to first register
    ;ADD R1, R1, R5         ;convert first ASCII number to decimal value
    
    GETC                    ;get second user input
    OUT                     ;output second value
    
    
    NOT R0, R0              ;One's compliment
    ADD R0, R0, #1          ;Two's compliment
    ADD R2, R0, #0          ;moving second input to R2
    
    LD R0, newline          ;load the address of the message string
    OUT
    
    ;IF_POSITIVE
        ADD
    
    ;IF_NEGATIVE 
        NOT 
        ADD 
    
    ADD R0, R2, R1          ;ADD the first and second value
    OUT
    
    LD R0, newline          ;load the address of the message string
    OUT
    
    PUTS
    ADD R0, R2, x0
    OUT
    
    HALT
    
    
    

STOP HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!

intro 	    .STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.

newline     .FILL x0A	; newline character - use with LD followed by OUT
equal       .STRINGZ    " = "
subtract    .STRINGZ    " - "
negative    .STRINGZ    "-"


;---------------
;END of PROGRAM
;---------------
.END

