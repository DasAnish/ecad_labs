.macro DP reg
csrw 0x7b2, \reg
.endm
.text
	.global div
	.type div,@function
div:
	addi sp,sp,-32	# Allocate stack space
	
	# store any callee-saved register you might overwrite
	sw ra, 28(sp)

	add t1, zero, zero
	add t2, zero, zero
	add t3, zero, 32
	add t4, zero, zero
loop:
	addi t3, t3, -1
	blt t3, zero, end

	srl t4, a0, t3
	andi t4, t4, 1
	slli t2, t2, 1
	or t2, t2, t4

	bge t2, a1, ifblock

	jal loop
	
ifblock:
	sub t2, t2, a1
	or t4, zero, 1
	sll t4, t4, t3
	or t1, t1, t4

	blt t3, zero, end

	jal loop
	
end:
	#DP s1
	mv a0, t1
	mv a1, t2
	lw ra, 28(sp)
	addi sp,sp,32 	# Free up stack space
	ret

.global rem
.type rem, @function
rem:
	addi sp, sp, -32
	sw ra, 28(sp)
	call div
	add a0, zero, a1
	lw ra, 28(sp)
	addi sp, sp, 32
	ret


	

	
.global main		# Export the symbol 'main' so we can call it from other files
.type main, @function
main:
	addi sp,sp,-32 	# Allocate stack space
	sw ra, 0(sp)
	lw a0, 4(sp)
	lw a1, 8(sp)
	addi a0, zero, 12
	addi a1, zero, 4
	#or a1, a1, 1
	
	call div # and jump to a function
	DP a1
	DP a0

	addi a0, zero, 93
	addi a1, zero, 7
	call div # and jump to a function
	DP a1
	DP a0

	#lui a0, (0x12345000>>12)
	#ori a0, a0, 0x678
	#addi a1, zero, 255
	
	
	lw ra, 0(sp)
	
	addi sp,sp,32 	# Free up stack space
	ECALL
	ret
