.data
  array: .word 45, 56, 78, 22, 47, 12
  size: .word 6

.text
  la $a0, array
  lw $a1, size
  jal getMin

  # Imprimir el minimo elemento
  move $a0, $v0
  li $v0, 1
  syscall

  # Exit
  li $v0, 10
  syscall

getMin:
   # PUSH $ra
   addi $sp, $sp, -4
   sw $ra, ($sp)

   lw $a3, 0($a0)
   jal getMinHelper
   
   # POP $ra
   lw $ra, ($sp)
   addi $sp, $sp, 4
   jr $ra

getMinHelper:
   # PUSH $ra
   addi $sp, $sp, -4
   sw $ra, ($sp)

   beq $a1, $zero, caso_base
   lw $t0, ($a0)
   blt $t0, $a3, change_min
   j recursion
change_min:
   move $a3, $t0
recursion:
   addi $a0, $a0, 4
   addi $a1, $a1, -1
   jal getMinHelper
   j exit
caso_base:
   move $v0, $a3
exit:
   # POP $ra
   lw $ra, ($sp)
   addi $sp, $sp, 4
   jr $ra
