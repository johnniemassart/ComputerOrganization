#Program Name: Mult10.s
#Author: Johnnie Massart
#Date: 10/1/2023
#Purpose: Multiply number by 10

.text
.global main
main:
	# push the stack
	SUB sp, sp, #4
	STR lr, [sp]

	#ask prompt
	LDR r0, =prompt
	BL printf

	#scan input
	LDR r0, =formatNumber
	LDR r1, =number
	BL scanf

	#store input value
	LDR r0, =number
	LDR r0, [r0]

	#1. multiply by 8
	LSL r2, r0, #3

	#2. multiply by 2
	LSL r3, r0, #1

	#3. add multiply 8, multiply 2
	ADD r0, r2, r3

	#output multiply by 10
	MOV r1, r0
	LDR r0, =output
	BL printf

	# pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter a number: "
	number: .word 0
	formatNumber: .asciz "%d"
	output: .asciz "The number multiplied by ten is: %d\n"
