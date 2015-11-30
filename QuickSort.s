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
  sll $t3, $t3, 1	# Optimized [(a+b)/2]*4 for offset of index  
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

w2:
  sll $t5, $t2, 2       # $t2*4 = a offset
  add $t5, $t5, $t0     # array[b] = 0($t5)
  lw $t7, 0($t5)
  slt $s0, $t6, $t7     # array[b] > pivot
  blez $s0, if

if:

last:
if1:
if2:
  jr $ra

.data
array: .word 1, 12, 5, 26, 7, 14, 3, 8, 2
size: .word 9
space: .asciiz " "
newline: .asciiz "\n"
