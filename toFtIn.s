#Program Name: toFtIn.s
#Author: Johnnie Massart
#Date: 10/1/2023
#Purpose: Convert inches to feet, inches

.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#user prompt
	LDR r0, =prompt
	BL printf

	#scan user input
	LDR r0, =formatInches
	LDR r1, =inches
	BL scanf

	#store user response
	LDR r0, =inches
	LDR r0, [r0, #0]

	#feet conversion
	MOV r1, #12
	BL __aeabi_idiv
	MOV r4, r0
	
	#inches conversion
	LDR r5, =inches
	LDR r5, [r5, #0]
	MUL r6, r1, r4
	#inches stored in r2
	SUB r2, r5, r6

	#output conversion
	#feet stored in r1
	MOV r1, r4
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter inches: "
	formatInches: .asciz "%d"
	inches: .word 0
	output: .asciz "Feet: %d, Inches: %d\n"
