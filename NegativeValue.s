#Program Name: NegativeValue.s
#Author: Johnnie Massart
#Date: 10/1/2023
#Purpose: Convert a number to the negative equivalent

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
	LDR r0, =formatNumber
	LDR r1, =number
	BL scanf

	#store response
	LDR r1, =number
	LDR r1, [r1, #0]
	
	#convert response to negative value
	MVN r1, r1
	ADD r1, r1, #1

	#output response
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter a number: "
	formatNumber: .asciz "%d"
	number: .word 0
	output: .asciz "The negative equivalent is: %d\n"
