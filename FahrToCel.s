#Program Name: FahrToCel.s
#Author: Johnnie Massart
#Date: 10/1/2023
#Purpose: Convert Fahrenheit to Celcius

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
	LDR r0, =formatFahrenheit
	LDR r1, =fahrenheit
	BL scanf

	#store input value
	LDR r0, =fahrenheit
	LDR r0, [r0]

	#1. subtract 32
	MOV r1, #32
	SUB r0, r0, r1
	
	#2. multiply 5
	MOV r1, #5
	MUL r0, r0, r1

	#3. divide 9
	MOV r1, #9
	BL __aeabi_idiv

	#output conversion
	MOV r1, r0
	LDR r0, =output
	BL printf	

	#pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter temperature in Fahrenheit: "
	fahrenheit: .word 0
	formatFahrenheit: .asciz "%d"
	output: .asciz "The temperature converted to Celcius: %d\n"
