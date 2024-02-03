;------------------------------
;Chen, George
;Login: gchen133@ucr.edu
;Section:
;TA
;Lab 01
;------------------------------




.orig x3000


    and r1, r1, x0
    ld r2, dec_12
    ld r3, dec_6
    
    DO_WHILE_LOOP
        ADD r1, r1, r2
        ADD r3, r3 #-1
        BRp DO_WHILE_LOOP
        END_DO_WHILE_LOOP
    
    HALT
    
    ;hard coded part
    dec_0 .fill #0
    dec_12 .fill #12
    dec_6 .fill #6
.end
