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

endsort:			
	jr $ra