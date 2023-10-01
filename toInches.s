#Program Name: toInches.s
#Author: Johnnie Massart
#Date: 10/1/2023
#Purpose: Convert feet, inches to inches

.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#user feet prompt
	LDR r0, =prompt1
	BL printf

	#scan user feet input
	LDR r0, =formatFeet
	LDR r1, =feet
	BL scanf

	#store feet response
	LDR r1, =feet
	LDR r8, [r1, #0]

	#user inches prompt
	LDR r0, =prompt2
	BL printf

	#scan user inches input
	LDR r0, =formatInches
	LDR r1, =inches
	BL scanf	

	#store inches response
	LDR r1, =inches
	LDR r1, [r1, #0]

	#convert feet to inches
	#multiply by 8
	LSL r4, r8, #3
	#multiply by 4
	LSL r5, r8, #2
	#add 8 + 4 = 12
	ADD r8, r4, r5

	#add remaining inches
	ADD r1, r8, r1

	#output total inches
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt1: .asciz "Enter feet: "
	prompt2: .asciz "Enter inches: "
	formatFeet: .asciz "%d"
	formatInches: .asciz "%d"
	feet: .word 0
	inches: .word 0
	output: .asciz "The conversion to inches is: %d\n"
