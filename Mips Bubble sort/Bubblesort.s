# Bubble Sort
# Computer Organiztion Project
# Dwight Thomas, Alanna Walton, James Walker, Angel

.data
# the array that holds unordered data
list: .word 54, 23, 56, 32, 99, 7, 4, 2, 88, 9, 11, 21, 39, 55, 100, 101, 43, 1, 3, 69, -5, -24, -17, 0
space: .asciiz " "
comma: .asciiz ", "

.text
.globl main
main:

	la $a2, list
	li $a1, 24

end:
	li $v0, 10
	syscall



bubblesort:
	addi $t0, $t0, 0
	move $t1, $a1
	addi $t3, $a1, -1
	firstloop:
		beq $t0, $t1, endsort  # while (i < size)
		li $t2, 0	# j = 0	

		innerloop:
			beq $t2 $t3, endinnerloop # while (j < k)
			lw $t4, ($a2)	# $t4 = list[j]
			addi $a2, $a2, 4
			lw $t5, ($a2)	# $t5 = list[j + 1]
			addi $a2, $a2, -4
			slt $t6, $t4, $t5	# if($t4 < $t5)
			beq $t6, 1, else	# do this
			sw $t5 ($a2)	# this is the swap
			addi $a2, $a2, 4
			sw $t4 ($a2)	# this is the swap
			addi $a2, $a2, -4

			else:	# else go here
			addi $a2, $a2, 4	# increment list
			addi $t2, $t2, 1	# j++
			j innerloop

		endinnerloop:
			addi $t3, $t3 -1	# k--
			li $t7 -4
			mult $t3 $t7
			mflo $t7
			add $a2, $a2, $t7	# reset array to base
			addi $a2, $a2, -4
			addi $t0, $t0, 1	# i++
			j firstloop	

endsort:			
	jr $ra