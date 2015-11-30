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

	la $a2, list					# Setting array to $a2
	li $a1, 24						# Setting the size to $a1
	jal bubblesort					# Calling the bubble sort function
	
	
	li $t0, 0								# Setting Variables for printing the array
	move $t1, $a2							# Setting Variables for printing the array	
	printloop:								# Calling the print loop
	beq $t0, $a1, end						# while (n < size)
	li 	$v0, 1								# print integer
	lw $a0 ($t1)
	syscall
	li $v0, 4								# print comma in between integers
	la $a0, comma
	syscall
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j printloop

end:										# End the program
	li $v0, 10
	syscall



bubblesort:									# The bubble sort function
	addi $t0, $t0, 0						# Setting up variables needed for nested loops
	move $t1, $a1
	addi $t3, $a1, -1						# a = size - 1
	firstloop:								# The outer loop
		beq $t0, $t1, endsort				# while (i < a)
		li $t2, 0							# j = 0	

		innerloop:							# the inner loop
			beq $t2 $t3, endinnerloop		# while (j < k)
			lw $t4, ($a2)					# $t4 = list[j]
			addi $a2, $a2, 4				# getting list[j + 1]
			lw $t5, ($a2)					# $t5 = list[j + 1]
			addi $a2, $a2, -4				# Making list back to just j
			slt $t6, $t4, $t5				# if($t4 < $t5)
			beq $t6, 1, else				# do this
			sw $t5 ($a2)					# this is the swap
			addi $a2, $a2, 4				# this is the swap
			sw $t4 ($a2)					# this is the swap
			addi $a2, $a2, -4				# this is the swap

			else:							# else go here
			addi $a2, $a2, 4				# increment list
			addi $t2, $t2, 1				# j++
			j innerloop						# jump back to innerloop

		endinnerloop:
			addi $t3, $t3 -1				# k--
			li $t7 -4						# Variable used to reset array
			mult $t3 $t7					# Variable used to reset array
			mflo $t7						# Variable used to reset array
			add $a2, $a2, $t7				# reset array to base
			addi $a2, $a2, -4				# reset array to base
			addi $t0, $t0, 1				# i++
			j firstloop						# jump back to outer loop

endsort:									# End the bublesort function			
	jr $ra									# jump and return to the main