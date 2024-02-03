;=================================================
; Name: George Chen
; Email: gchen133@ucr.edu
; 
; Lab: lab 2. ex 1
; Lab section: 023
; TA: Abhishek Premnath
; 
;=================================================
.orig x4000

LD R3, DEC_65
LD R4, HEX_41

halt

DEC_65 .fill #65
HEX_41 .fill x41

.end