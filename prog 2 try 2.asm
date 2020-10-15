#CSCI 4750 Prog 2
#Daniel Hentosz 811042739
#djh37992@uga.edu 412-737-6365
.data
nums: .space 20 #each int takes up 4 spaces, hence this array will hold 5 ints
msg: .asciiz "Largest in given array is "
.text
main:
#generating our numbers that well put in the array
addi $s0,$zero,10
addi $s1,$zero,3
addi $s2,$zero,45
addi $s3,$zero,90
addi $s4,$zero,12
#putting those numbers in the array
addi $t0,$zero,0   #acts as our index
sw $s0,nums($t0)
addi $t0,$zero,4
sw $s1,nums($t0)
addi $t0,$zero,8
sw $s2,nums($t0)
addi $t0,$zero,12
sw $s3,nums($t0)
addi $t0,$zero,16
sw $s4,nums($t0)
#array is now full
#inilizing values, for a inndex, size, and largest number
addi $t0,$zero,0   #index
addi $t1,$zero,20   #size
addi $s0,$zero,0   #largest value
while:
beq $t0,$t1,exit   #when we are on the 5th iteration of the loop
lw $t2,nums($t0)
slt $t3,$t2,$s0   #sets t3 to 1 only when t2 is less than s0, otherwise its set to 0
beq $t3,$zero,ng   #if theres a new greater value
here:   #return here if/once were done with the ng function
addi $t0,$t0,4   #increasing our conditing
j while   #jump back to top of loop, and repeat
exit:
jal pf   #jump to our print function-jal is used so we can use $ra
#end of program procedure calls
li $v0,10
syscall

ng:   #new greater value
addi $s0,$t2,0
j here

pf:   #print function
li $v0,4
la $a0,msg
syscall

li $v0,1
move $a0,$s0
syscall
jr $ra