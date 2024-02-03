;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 2. ex 2
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.orig x3000

LDI R3, DEC_65_PTR 
LDI R4, HEX_45_PTR 

ADD R3, R3, #1
ADD R4, R4, #1

halt

DEC_65_PTR .fill x4000
HEX_45_PTR .fill x4001

.end
;------------------------------------------------
.orig x4000

NEW_DEC_65 .fill #65
NEW_HEX_45 .fill x41

.end



