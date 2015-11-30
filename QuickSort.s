#Quick sort algorithm
.text
.globl main
main:
  la $a0, array		# load array address
  la $t0, size
  lw $a1, 0($t0)	# a1 =  array(size)

  addi $s1, $s1, 0	# s1 = start index
  addi $s2, $s2, 8	# s2 = end index

  la $t0, array
  add $t1, $0, $0
print:
  li $v0, 1
  lw $a0, 0($t0)
  addi $t0, $t0, 4
  addi $t1, $t1, 1
  syscall
  li $v0, 4
  la $a0, space 
  syscall
  
  bne $t1, $a1, print	# while(t1 != size)
  li $v0, 4
  la $a0, newline
  syscall
  
done:
  li $v0, 10
  syscall

sort:
  add $t1, $s1, $0	# t1 = a
  add $t2, $s2, $0	# t2 = b
  add $t3, $t1, $t2	# t3 = a+b
  srl $t3, $t3, 1	# (a+b)/2
  sll $t3, $t3, 2	# Multiply by 4 for offset of index
  add $t3, $t3, $a0	# 0($t3) = pivot

  li $v0, 1
  lw $a0, 0($t3)
  syscall
  li $v0, 4
  la $a0, newline
  syscall

  jr $ra

.data
array: .word 1, 12, 5, 26, 7, 14, 3, 8, 2
size: .word 9
space: .asciiz " "
newline: .asciiz "\n"
