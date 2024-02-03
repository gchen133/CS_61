;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 2. ex 3
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.orig x3000

LD R5, DEC_65_PTR
LD R6, HEX_45_PTR
LDR R3, R5, #0
LDR R4, R6, #0

ADD R3, R3, #1
ADD R4, R4, #1

STR R3, R5, #0
STR R4, R6, #0

DEC_65_PTR .fill x4000
HEX_45_PTR .fill x4001

HALT

.end
;------------------------------------------------
.orig x4000

NEW_DEC_65 .fill #65
NEW_HEX_45 .fill x41

.end
;------------------------------------------------







