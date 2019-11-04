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
	beq a1, zero, exit

	#dp a0
	
	lw s1, 12(sp)
	mv s1, zero
	lw s2, 16(sp)
	mv s2, zero
	lw s3, 20(sp)
	mv s3, zero
	addi s3, s3, 32
	lw s4, 24(sp)
	mv s4, zero
	jal loop
loop:
	addi s3, s3, -1
	blt s3, zero, end
	
	srl s4, a0, s3
	andi s4, s4, 1
	slli s2, s2, 1
	or s2, s2, s4

	bge s2, a1, ifblock
	
	jal loop
ifblock:
	sub s2, s2, a1
	srl s4, s1, s3
	ori s4, s4, 1
	sll s4, s4, s3
	or s1, s1, s4
	blt s3,zero, end
	jal loop
end:
	#DP s1
	mv a0, s1
	mv a1, s2
	jal exit
exit:	
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


	


