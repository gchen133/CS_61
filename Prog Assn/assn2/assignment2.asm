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
;
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
;----------------------------------------------
;outputs prompt
;----------------------------------------------
    LEA R0, intro; 
    PUTS
;-------------------------------
;INSERT YOUR CODE here
;--------------------------------

    GETC
    OUT
    ADD R1, R0, #0
    AND R0, R0, #0
    ADD R0, R0, x0A
    OUT
    
    GETC
    OUT
    ADD R2, R0, #0
    
    AND R0, R0, #0
    ADD R0, R0, x0A
    OUT
    
    ADD R0, R1, #0
    OUT
    LEA R0, subtract
    PUTS
    ADD R0, R2, #0
    OUT
    LEA R0, equal
    PUTS
    
    NOT R2, R2
    ADD R2, R2, #1
    
    ADD R3, R1, R2
        BRzp SKIP
    
    NOT R3, R3
    ADD R3, R3 #1
    
    AND R0, R0, #0
    LD R5, negative
    ADD R0, R0, R5
    OUT
    SKIP
    LD R4, offset
    ADD R3, R3, R4
    
    ADD R0, R3, #0
    OUT
    
    AND R0, R0, #0
    ADD R0, R0, x0A
    OUT
    
    
    HALT	; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro     .STRINGZ "ENTER two numbers (i.e '0'....'9')\n" 
newline   .FILL x0A	; newline character - use with LD followed by OUT
equal     .STRINGZ " = "
subtract  .STRINGZ " - "
offset    .FILL #48
negative  .FILL x2D


;---------------
;END of PROGRAM
;---------------
.END
