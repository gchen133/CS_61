.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
ADD R4, R4, #8          ;   BIG LOOP COUNTER
ADD R4, R4, #8          ; + BIG LOOP COUNTER 
ADD R5, R5, #4          ; SPACES COUNTER

BEEG_LOOP
    ADD R5, R5, #0              ;CHECKS SPACES COUNTER
    BRp NO_SPACE
        LD R0, SpaceJam
        OUT
        ADD R5, R5, #4          ;RESETS SPACE COUNTER
    NO_SPACE

    ADD R1, R1, #0          ;-Scan for first digit with branches
                            
    BRzp POS_ZERO
        LD  R0, One         ;-Out the first value, 1 or 0
        OUT
        ADD R5, R5, #-1     ;-every 4 places, we need to print out a space
        ADD R1, R1, R1      ;-Multiply by 2, or add to itself
        ADD R4, R4, #-1
        BRp BEEG_LOOP
        BRz YEET
        

    POS_ZERO
        LD  R0, Zero        ;-Out the first value, 1 or 0
        OUT
        ADD R5, R5, #-1     ;-every 4 places, we need to print out a space
        ADD R1, R1, R1      ;-Multiply by 2, or add to itself
        ADD R4, R4, #-1
        BRp BEEG_LOOP
        
        
YEET
LD R0, Newline 
OUT

HALT
;---------------	
;Data
Zero .FILL #48
One .FILL #49
SpaceJam .FILL #32
Newline .FILL #10
;---------------
Value_ptr	.FILL xCA01	; The address where value to be displayed is stored

.END

.ORIG xCA01					; Remote data
Value .FILL xABCD	; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
