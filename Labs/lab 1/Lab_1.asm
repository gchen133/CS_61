.ORIG x3000

    ;instructions
    LEA R0, MSG_TO_PRINT
    PUTS
    HALT
    
    ;Local data
    MSG_TO_PRINT .STRINGZ "Hello World!!!\n"
    
.END