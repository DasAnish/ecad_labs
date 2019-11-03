.text
div:
	addi sp,sp,-32	# Allocate stack space
	
	# store any callee-saved register you might overwrite
	sw ra, 28(sp)
	sw s0, 24(sp)
	#sw fp, 24(sp)
	sw a0, 4(sp)
	sw a1, 8(sp)
	
	lw s1, 12(sp)
	mv s1, zero
	lw s2, 16(sp)
	mv s2, zero
	lw s3, 20(sp)
	mv s3, zero
	addi s3, s3, 31
	
	sw s1, 12(sp)
	sw s2, 16(sp)
	sw s3, 20(sp)
	
	#Q=s1; R=s2; i=s3; N=a0; D=a1;
	
	#.COND
	
	
	
	
	# do your work
	
	
	# load every register you stored above
	lw ra, 28(sp)
	addi sp,sp,32 	# Free up stack space
	ret

.global main		# Export the symbol 'main' so we can call it from other files
.macro DP reg
csrw 0x7b2, \reg
.endm
.type main, @function
main:
	addi sp,sp,-32 	# Allocate stack space
	sw ra, 0(sp)
	lw a0, 4(sp)
	mv a0, zero
	addi a0, a0, 12
	lw a1, 8(sp)
	mv a1, zero
	addi a1, a1, 4
	or a1, a1, 1
	DP a1
	call div # and jump to a function
	lw ra, 0(sp)
	
	addi sp,sp,32 	# Free up stack space
	ECALL
	ret
