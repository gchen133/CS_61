.ORIG x3000
LD R6, ASCII ;load the ASCII “0” offset
LD R5, NEGASCII ;load the negated ASCII “0” offset
TRAP x23 ;the trap instruction which is also known as “IN”
ADD R1,R0,x0 ;move the first integer to register 1
ADD R1, R1, R5 ;convert first ASCII number to numerical value
TRAP x23 ;another “IN”
ADD R0, R0, R5 ;convert second ASCII number to numerical value
ADD R2,R0,R1 ;add the two integers: R2 = R0 + R1
ADD R2, R2, R6 ;convert the sum to its ASCII representation
LEA R0,MESG ;load the address of the message string
TRAP x22 ;”PUTS” outputs a string
ADD R0,R2,x0 ;move the sum to R0, to be output
TRAP x21 ;display the sum
DONE HALT
MESG .STRINGZ “The sum of those two numbers is ”
ASCII .FILL x30 ;the mask to add to a digit to convert it to ASCII
NEGASCII .FILL xFFD0 ;the negative version of the ASCII mask (-x30)
.END