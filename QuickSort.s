#Quick sort algorithm
.text
.globl main
main:
  la $a0, array		# load array address
  la $t0, size
  lw $a1, 0($t0)	# a1 =  array(size)

  addi $s1, $s1, 0	# s1 = start index
  addi $s2, $s2, 8	# s2 = end index
  
  jal sort

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
  addi $t8, $0, 2
  addi $t9, $0, 4
  add $t1, $s1, $0	# t1 = a
  add $t2, $s2, $0	# t2 = b
  add $t3, $t1, $t2	# t3 = a+b
  div $t3, $t8
  mflo $t3
  mult $t3, $t9
  mflo $t3  
  add $t3, $t3, $a0	# 0($t3) = pivot
  lw $t6, 0($t3)	# $t6 = pivot
first:
  slt $s0, $t2, $t1	# a <= b
  bgtz $s0 last		# if (a <= b) NOT
w1:
  sll $t4, $t1, 2	# $t1*4 = a offset
  add $t4, $t4, $t0	# array[a] = 0($t4)
  lw $t7, 0($t4)
  slt $s0, $t7, $t6	# array[a] < pivot 
  blez $s0, w2
  addi $t1, $t1, 1	#a++
  j w1

w2:
  sll $t5, $t2, 2       # $t2*4 = a offset
  add $t5, $t5, $t0     # array[b] = 0($t5)
  lw $t7, 0($t5)
  slt $s0, $t6, $t7     # array[b] > pivot
  blez $s0, if
  addi $t2, $t2, -1	#b—-
  j w2

if:
  slt $s0, $t2, $t1	# a <= b
  bgtz $s0 last		# if (a <= b) NOT
  lw $s3, 0($t4)
  lw $s4, 0($t5)
  sw $s3, 0($t5)
  sw $s4, 0($t4)	# swap values a&b
  addi $t1, $t1, 1	#a++
  addi $t2, $t2, -1	#b—-
  j first

last:
if1:
  slt $s0, $s1, $t2	# start < b
  blez $s0, if2
  add $s2, $t2, $0	# end = b
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal sort		#recursion(upper half)
  lw $ra, 0 ($sp)
  addi $sp, $sp, 4

if2:
  slt $s0, $t1, $s2
  blez $s0, end
  add $s1, $t1, $0	# start = a
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal sort		#recursion(lower half)
  lw $ra, 0 ($sp)
  addi $sp, $sp, 4
end:
  jr $ra

.data
array: .word 1, 12, 5, 26, 7, 14, 3, 8, 2
size: .word 9
space: .asciiz " "
newline: .asciiz "\n"
