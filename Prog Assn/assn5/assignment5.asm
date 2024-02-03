; Name & Email must be EXACTLY as in Gradescope roster!
; Name: George Chen 
; Email: gchen133@ucr.edu
; 
; Assignment name: Assignment 5
; Lab section: 023
; TA: Abhishek Premnath
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
; PUT ALL YOUR CODE AFTER THE main LABEL
;=================================================================================

;---------------------------------------------------------------------------------
;  Initialize program by setting stack pointer and calling main subroutine
;---------------------------------------------------------------------------------
.orig x3000
; Initialize the stack. Don't worry about what that means for now.
LD R6, top_stack_addr ; DO NOT MODIFY,AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE

LEA R5, main
JSRR R5
;---------------------------------------------------------------------------------
; Main Subroutine
;---------------------------------------------------------------------------------
main
LD R1, Array

LD R5, SUB_GET_STRING
JSRR R5

LD R2, SUB_TO_UPPER
JSRR R2

LD R4, SUB_IS_PALINDROME
JSRR R4


LD R1, Array
LD R2, wan
NOT R2, R2
ADD R2, R2, #1
 
    BEG_LOOP
        ADD R7, R4, R2
        
        BRn not_pal
            LEA R0, Is_Palin
            PUTS
            
            LEA R0, Is_Palin_Com
            PUTS    
        BR stop
        
        not_pal
            LEA R0, Not_Palin
            PUTS
        
            LEA, R0, Not_Palin_Com
            PUTS

stop

halt

;LOCAL_DATA

SUB_GET_STRING .FILL x3200
SUB_IS_PALINDROME .FILL x3400
SUB_TO_UPPER .FILL x3600
top_stack_addr .FILL xFE00 ; DO NOT MODIFY THIS LINE OF CODE
Array .FILL x4000
wan .FILL #49

Is_Palin .STRINGZ "The string"
Is_Palin_Com .STRINGZ " is a palindrome\n"
Not_Palin .STRINGZ "The string"
Not_Palin_Com .STRINGZ " is not a palindrome\n"

.end

; your subroutines go below here
;------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING_3200
; Parameter/R1: Beginning of array
; Sentinel: The subroutine has prompted the user to input a string,
; terminated the sentinel 
; the array is NULL-terminated; the sentinel character is NOT stored.
; Return Value/R5: The number of non-sentinel characters read from the user.
; R1 address of the array's beginning
;------------------------------------------------------------------------
.orig x3200
    ADD R6, R6, #-1
    STR R1, R6, #0
    
    ADD R6, R6, #-1
    STR R7, R6, #0
    
    ADD R6, R6, #-1
    STR R2, R6, #0
    
    ADD R6, R6, #-1
    STR R3, R6, #0
        
        
    LD R2, NEWLINE
    NOT R2, R2
    ADD R2, R2, #1
    LEA R0, Prompt
    PUTS
    
    AND R0, R0, #0
    ADD R0, R0, x0A
    AND R5, R5, #0
    
    LOOP
        AND R0, R0, #0
        GETC
        OUT
        
        ADD R3, R0, R2
        BRz DONE
        
        STR R0, R1, #0
        ADD R1, R1, #1
        ADD R5, R5, #1
        BR LOOP
        
    DONE
    
    LDR R2, R6, #0
    ADD R6, R6, #1
    
    LDR R3, R6, #0
    ADD R6, R6, #1
    
    LDR R7, R6, #0
    ADD R6, R6, #1
    
    LDR R1, R6, #0
    ADD R6, R6, #1
    
    RET
        
    ;LOCAL_DATA
    
    Prompt .STRINGZ "Enter a string: "
    NEWLINE .FILL #10
    
    .end
    
;-------------------------------------------------------------------------
; Subroutine: SUB_IS_PALINDROME
; Parameter/R1: The address of the beginning of the null-terminated array
; Parameter/R5: The number of characters in the array.
; Postcondition: Checks to see if inputted string is a palindrome and 
; returns a flag accordingly
; Return Value/R4: returns 1 if the string is a palindrome and 0 otherwise
;-------------------------------------------------------------------------
.orig x3400

    LD R4, one
    
    ADD R2, R5, #-1
    ADD R5, R5, #-1
    
    ADD R2, R1, R2
    
START
    ADD R6, R6, #-1
    STR R1, R6, #0
        
    ADD R6, R6, #-1
    STR R7, R6, #0
        
    ADD R6, R6, #-1
    STR R5, R6, #0
        
    ADD R6, R6, #-1
    STR R3, R6, #0
        
        LDR R3, R1, #0
        LDR R7, R2, #0
            
        NOT R7, R7
        ADD R7, R7, #1
            
        ADD R2, R2, #-1
        ADD R1, R1, #1
        ADD R3, R3, R7
        BRz PASS
        LD R4, zero
            
    PASS
        
    ADD R5, R5, #-2
    BRnz FINISH
        
    JSR START
        
    FINISH
        
    LDR r3, r6, #0
    ADD R6, R6, #1
    
    LDR r5, r6, #0
    ADD R6, R6, #1
    
    LDR r7, r6, #0
    ADD R6, R6, #1
    
    LDR r1, r6, #0
    ADD R6, R6, #1
     
    RET
        
    ;LOCAL_DATA
    
    zero .FILL #48  
    one .FILL #49
    pal_addrs .FILL x3400
        
.end

;-------------------------------------------------------------------------
; Subroutine: SUB_TO_UPPER
; Parameter/R1: Starting address of a null-terminated string
; Postcondition: This subroutine has capitalized the entire string
; No return value and no output, but R1 still contains the 
; unchanged array address
;-------------------------------------------------------------------------
    .orig x3600
        ADD R6, R6, #-1
        STR R1, R6, #0
        
        ADD R6, R6, #-1
        STR R7, R6, #0 
        
        ADD R6, R6, #-1
        STR R2, R6, #0
        
        ADD R6, R6, #-1
        STR R3, R6, #0
        
        ADD R6, R6, #-1
        STR R4, R6, #0
        
        ADD R6, R6, #-1
        STR R5, R6, #0
        
        LD R2, mirror
        
        LAST_LOOP
            LDR R3, R1, #0
            AND R4, R3, R2
            
            STR R4, R1, #0
            ADD R1, R1, #1
            ADD R5, R5, #-1
            
            BRp LAST_LOOP
        
        
        LDR R5, R6, #0
        ADD R6, R6, #1
            
        LDR R4, R6, #0
        ADD R6, R6, #1
            
        LDR R3, R6, #0
        ADD R6, R6, #1
            
        LDR R2, r6, #0
        ADD R6, R6, #1
            
        LDR R7, R6, #0
        ADD R6, R6, #1
            
        LDR R1, R6, #0
        ADD R6, R6, #1
                    
        RET
        
        ;LOCAL_DATA
        
        offset .FILL #32
        checker .FILL #97
        mirror .FILL b11011111
        
    .end


