.orig x3000

;instructions

;add r1, r1, #10
ld r4, array
ld r5, zero
not r5, r5
add r5, r5, #1
lea r0, intro
puts
and r0, r0, #0
add r0, r0, x0A

loop
    and r0, r0, #0
    GETC
    OUT

    str r0, r4, #0
    add r4, r4, #1 

    ;and r0, r0, #0
    ;add r0, r0, x0A
    ;OUT
    add r1, r1, #1
    add r6, r0, r5
BRnp loop

;ld r1, #10
ld r4, array

and r0, r0, #0
add r0, r0, x0A
out
and r0, r0, #0

loop2
    ldr r0, r4, #0
    out

    add r4, r4, #1
    add r1, r1, #-1
BRp loop2

and r0, r0, #0
add r0, r0, x0A
out

halt

;data

intro .STRINGZ "Enter 10 characters: \n"
array .FILL x4000
zero .FILL #48

.end


.orig x4000
;arr .BLKW #100
.end