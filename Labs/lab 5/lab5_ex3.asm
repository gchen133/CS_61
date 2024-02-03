;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 5, ex 3
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.orig x3000
; Initialize the stack. Don't worry about what that means for now.
ld r6, top_stack_addr ; DO NOT MODIFY, AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE

; your code goes here
LD R1, Array_Ptr
LD R5, Char_Count

LD R2, Sub_Get_String_Ptr
JSRR R2

LD R1, Array_Ptr
LD R7, Array_Ptr
LD R3, Sub_To_Upper
;LD R0, DEC_97

LD R2, Sub_Is_Palindrome
JSRR R2

AND R0, R0, #0
ADD R0, R0, #10
OUT

LD R0, Array_Ptr
Puts

AND R0, R0, #0
ADD R0, R0, #10
OUT

ADD R0, R4, #0
BRp Palin_Sent

Not_Palin_Sent
    LEA R0, This_String
    PUTS
    
    LD R0, Array_Ptr
    Puts
    
    LEA R0, Not_Palin
    Puts
End_Not_Palin_Sent

BR End_Palin_Sent

Palin_Sent
    LEA R0, This_String
    PUTS
    
    LD R0, Array_Ptr
    Puts
    
    LEA R0, Is_Palin
    Puts
End_Palin_Sent


halt

; your local data goes here
Array_Ptr .Fill x4000
Enter_Sent .Fill #-10
Sub_Get_String_Ptr .Fill x3200
Char_Count .Fill #0
Sub_Is_Palindrome .Fill x3400
Is_Palin .Stringz " IS a palindrome"
Not_Palin .Stringz " IS NOT a palindrome"
This_String .Stringz "This string "
Sub_To_Upper .Fill x3600
;DEC_NEG91 .FIll #-91
;DEC_97 .Fill #97



top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE
.end

; your subroutines go below here
;------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING_3200
; Parameter (R1): The starting address of the character array
; Postcondition: The subroutine has prompted the user to input a string,
; terminated by the [ENTER] key (the "sentinel"), and has stored
; the received characters in an array of characters starting at (R1).
; the array is NULL-terminated; the sentinel character is NOT stored.
; Return Value (R5): The number of non-sentinel chars read from the user.
; R1 contains the starting address of the array unchanged.
;------------------------------------------------------------------------
    .orig x3200
        ADD R6, R6, #-1
        STR R7, R6, #0
        ADD R6, R6, #-1
        STR R3, R6, #0
        
        While_Loop
            Getc
            ADD R3, R0, #-10
            BRz End_While_Loop
            Out
            
            STR R0, R1, #0
            ADD R1, R1, #1
            ADD R5, R5, #1
            BR While_Loop
        End_While_Loop
        
        AND R0, R0, #0
        STR R0, R1, #0
        
        LDR R3, R6, #0
        ADD R6, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #1
        ;LDR R7, R6, #0
        ;ADD R6, R6, #1
        
        ret
    .end
    
;-------------------------------------------------------------------------
; Subroutine: SUB_IS_PALINDROME
; Parameter (R1): The starting address of a null-terminated string
; Parameter (R5): The number of characters in the array.
; Postcondition: The subroutine has determined whether the string at (R1)
; is a palindrome or not, and returns a flag to that effect.
; Return Value: R4 {1 if the string is a palindrome, 0 otherwise}
;-------------------------------------------------------------------------
    .orig x3400
        ADD R6, R6, #-1
        STR R7, R6, #0
        ADD R6, R6, #-1
        STR R3, R6, #0 
        ADD R6, R6, #-1
        STR R5, R6, #0
        ADD R6, R6, #-1
        STR R1, R6, #0
        ;ADD R6, R6, #-1
        ;STR R0, R6, #0
        ;ADD R2, R3, #0
        ;JSRR R2
        
        ADD R2, R3, #0
        JSRR R2
        
        ADD R3, R1, #0
        ADD R0, R1, #0
        
        ADD R0, R0, R5
        ADD R0, R0, #-1
        
        Palin_While
            NOT R4, R3
            ADD R4, R4, #1
            
            ADD R4, R4, R0 ;R0 is the register for the back of the array and R3 is the front
            BRnz Is_True
            
            ;LDI R4, Array_Ptr
            LDR R4, R7, #0
            NOT R4, R3
            ADD R4, R4, #1
            
            LDR R1, R3, #0
            LDR R2, R0, #0
            
            NOT R2, R2
            ADD R2, R2, #1
            
            ADD R2, R2, R1
            BRnp Is_False
            
            ADD R3, R3, #1
            ADD R0, R0, #-1
            BR Palin_While
            
            Is_False
                AND R4, R4, #0
                ;BR Is_False_Ret
                BR End_Palin_While
            End_Is_False
            
            Is_True
                AND R4, R4, #0
                ADD R4, R4, #1
            End_Is_True
            
            ;Is_False_Ret
        End_Palin_While
        
        ;LD R2, Sub_to_upper
        ;JSRR R2
        
        ;LDR R0, R6, #0
        ;ADD R6, R6, #1
        LDR R1, R6, #0
        ADD R6, R6, #1
        LDR R5, R6, #0
        ADD R6, R6, #1
        LDR R3, R6, #0
        ADD R6, R6, #1
        
        ;ADD R2, R3, #0
        ;JSRR R2
        
        LDR R7, R6, #0
        ADD R6, R6, #1
        ;LDR R7, R6, #0
        ;ADD R6, R6, #1
        
        ;ADD R2, R3, #0
        ;JSRR R2
        ;LD R7, Jump
        
        ;HALT
        ;Sub_to_upper .FIll x3600
        ;ADD R2, R3, #0
        ;JSRR R2
        ;JSR Sub_To_Upper
        ;Jump .Fill x300A
        
        ret
    .end

;-------------------------------------------------------------------------
; Subroutine: SUB_TO_UPPER
; Parameter (R1): Starting address of a null-terminated string
; Postcondition: The subroutine has converted the string to upper-case
; in-place i.e. the upper-case string has replaced the original string
; No return value, no output, but R1 still contains the array address, unchanged
;-------------------------------------------------------------------------
    .orig x3600
        ADD R6, R6, #-1
        STR R7, R6, #0
        ADD R6, R6, #-1
        STR R3, R6, #0 
        ADD R6, R6, #-1
        STR R5, R6, #0
        ;ADD R6, R6, #-1
        ;STR R0, R6, #0
    
        ;ADD R5, R5, #-1
        LD R0, DEC_NEG91
        
        Make_Upper
            LD R0, DEC_NEG91
            LDR R2, R1, #0
            ADD R2, R2, R0
            BRn End_Is_Lower
            
            Is_Lower
                LD R0, DEC_91
                ADD R2, R2, R0
                
                LD R0, DEC_95
                AND R2, R2, R0
                STR R2, R1, #0
                ;AND R1, R1, R0
            End_Is_Lower
            
            ADD R1, R1, #1
            ADD R5, R5, #-1
            BRp Make_Upper
            
        End_Make_Upper
        
        LDR R5, R6, #0
        ADD R6, R6, #1
        LDR R3, R6, #0
        ADD R6, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #1
        
        ret
        
        ;HALT
        DEC_NEG91 .Fill #-91
        DEC_95 .FIll #95
        DEC_91 .Fill #91
        
        ;ret
    .end
    
.orig x4000
    .blkw 100
    
.end
