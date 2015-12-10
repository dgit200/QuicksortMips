# MIPS MONSTERS
#
#Bucket Sort Algorithm

.text
.globl main

main:
  la $s1, size
  lw $a1, 0($s1)        # a1 =  array(size)

  jal bucketsort
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

  bne $t1, $a1, print   # while(t1 != size)
  li $v0, 4
  la $a0, newline
  syscall

done:
  li $v0, 10
  syscall

  
bucketsort:
 la $t5, array	# $t6 = arr[i]
 lw $t7, 0($t5)	# load MAX

range:
 addi $t5, $t5, 4
 lw $t8, 0($t5)
 sltu $s2, $t7, $t8
 bgtz $s2, max
 bne $t5, $s1, range
 addi $t7, $t7, 1
 j start

max:
 add $t7, $t8, $0
 j range

start:
 add $s0, $t7, $0	# $s0 = m, range 
 add $t2, $s0, $0
 addi $t3, $0, 32	# $t3 = 32 
 addi $t4, $0, 8	# $t4 = 8
 mult $t2, $t3
 mflo $t3
 div $t3, $t4
 mflo $t3
 li $v0, 9		# load to allocate memory
 move $a0, $t3	        # load bytes
 syscall
 move $a2, $v0	        # BUCKETS = 0($a2), buckets[10]

 la $t6, array	        # $t6 = arr[i]
 addi $t4, $0, 4	# $t4 = 4

inner_loop:
  lw $t5, 0($t6)	# array[i]
  mult $t5, $t4 	# $t5*4 = offset for buckets[]
  mflo $t5
  add $t5, $t5, $a2	# offset(buckets)
  lw $t7, 0($t5)
  addi $t7, $t7, 1	# ++
  sw $t7, 0($t5)	# ++buckets[arr[i]]
  addi $t6, $t6, 4	# for i++, increment to next place in arr[]
  bne $t6, $s1, inner_loop  # while(t2 != size)

 la $t6, array	# $t6 = arr[i]
 la $t0, 0($a2)	# $t0 = buckets[]
 add $t1, $0, $0	# i = 0
 add $t2, $0, $0	# offset of j
 add $t3, $t3, $a2
 add $t7, $0, $0	# j = 0

outer_loop:
 lw $t5, 0($t0)		# k = buckets[j]
 blez $t5, bucket_up		# if k = 0, loop
 sw $t7, 0($t6)		# arr[i] = j
 addi $t6, $t6, 4		# arr[i++]
 addi $t7, $t7, 1		# j++
 addi $t0, $t0, 4		# offset j++;
 bne $t0, $t3, outer_loop		# while j < m

bucket_up:
  beq $t0, $t3, end		# stop subprogram
  addi $t0, $t0, 4		# offset j++;
  addi $t7, $t7, 1		# j++
  j outer_loop
 
end:
 jr $ra
 
.data
array: .word 9, 1, 5
size: .word 3
space: .asciiz " "
newline: .asciiz "\n"
