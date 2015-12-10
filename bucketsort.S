#MIPS MONSTERS
#
#Bucket Sort

.text
.globl main

main:
                       #int n = sizeof (array) / sizeof (array[0]);
                       #$t0 = n
                       #$t1 = size of array
                       #$t2 = size of array[0]
                       #$s0 = array
                       #$s1 = 4  (size of word)
la $t1, SIZE
lw $t1, 0($t1)
la $t8, ARRAY
move $s0, $t8
lw $t2, 0($s0)
div $t1, $t2
mflo $v0 # quotient to $v0
move $t0, $v0
addi $s1, $0, 4

bucketSort:
                       #$t3 = int m
                       #$t4 = buckets
addi $t3, $0, 101
li $v0, 9
move $a0, $t3
syscall
move $t4, $v0         #automatically initialized to 0
add $t5,$0, $0


LOOP:
slt $t9, $t5, $t0
beq $t9, $0, NEXT
addi $t5, $t5, 1
mult $s1, $t5
mflo $t9
add $t9, $t9, $s0
lw $t9, 0 ($t9)
mult $s1, $t9
mflo $t9
add $t9, $t9, $t4
addi $t9, $t9, 1 
move $t4, $t9
j LOOP


NEXT:
                       #$t5 = i
                       #$t6 = j
                       #$t9 = checking variable
add $t5, $0, $0        #Initialize i to 0
add $t6, $0, $0        #Intialize j to 0
  

forLoop1: 
slt $t9, $t6, $t3      # j < m
beq $t9, 0, PRINT 
addi $t6, $t6, 1       #increment j
                       #$t7 = k
                       #t8 = reseting address of buckets
mult $s1, $t6
mflo $t9
move $t8, $t4
add $t8, $t8, $t9
sw $t9 ($t8)
move $t7, $t9   


forLoop2:
slt $t9, $t7, $0
bne $t9, $0 forLoop1
addi $t7, $t7, -1  
sw $t6, 0($s0)
addi $s0, $s0, 4
j forLoop2

PRINT:
slt $t9, $t5, $t0
beq $t9, $0, DONE
lw $t9, 0($s0)
li $v0, 1
move $a0, $t9
syscall
addi $s0, $s0, 4
addi $t5, $t5, 1
j PRINT 
   

DONE:
li $v0, 10             #end program
syscall



.data
ARRAY: .word 10, 24, 22, 62, 1, 50, 100, 75, 2, 3
SIZE: .word 10
