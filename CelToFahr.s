# Program Name: CelToFahr.s
# Author: Johnnie Massart
# Date: 10/1/2023
# Convert Celcius to Fahrenheit

.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp]

	#ask prompt
	LDR r0, =prompt
	BL printf

	#scan input
	LDR r0, =formatCelcius
	LDR r1, =celcius
	BL scanf

	#store input value
	LDR r0, =celcius
	LDR r0, [r0]

	#1. multiply 9
	MOV r1, #9
	MUL r0, r0, r1

	#2. divide 5
	MOV r1, #5
	BL __aeabi_idiv

	#3. add 32
	MOV r1, #32
	ADD r0, r0, r1

	#output conversion
	MOV r1, r0
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter the temperature in Celcius: "
	celcius: .word 0
	formatCelcius: .asciz "%d"
	output: .asciz "The temperature converted to Fahrenheit: %d\n"
