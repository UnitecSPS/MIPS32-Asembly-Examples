.data
  cadena: .asciiz "Hola Mundo"

.text
  la $a0, cadena
  jal strlen
  
  # Imprimir la longitud
  move $a0, $v0
  li $v0, 1
  syscall

  # Exit
  li $v0, 10
  syscall

strlen:
   add $t0, $a0, $zero
  loop:
    lb $t1, 0($t0)
    beq $t1, $zero, fin
    addi $t0, $t0, 1
    j loop
  fin:
  sub $v0, $t0, $a0
  jr $ra
