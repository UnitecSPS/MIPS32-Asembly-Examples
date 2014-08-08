.text		
	li $a0, 5
	jal fact	# call fact(5)

	# Imprimir el resultado
	move $a0, $v0
	li $v0, 1
	syscall

	# Imprimir un fin de linea   
	la $a0, endl
	li $v0, 4
	syscall

	# Salir del programa
	li $v0, 10
	syscall

#------------------------------------------------
# Fact - Implementacion recursiva de Factorial
#	a0 - es el parametro n
#	s0 - mantiene una copia del parametro n
#	v0 - valor de retorno
#------------------------------------------------

fact:	
	sub $sp, $sp, 12 # Reserva 12 bytes en la pila para salvar los registros
	sw $a0, 0($sp)
	sw $s0, 4($sp)
	sw $ra, 8($sp)

	bgt $a0, 1, notOne
	li $v0, 1
	j fret		# if n<=1

notOne:	move $s0, $a0	# Guarda el n original
	sub $a0, $a0, 1		# param = n-1
	jal fact			# calcula fact(n-1)
	mul $v0, $v0, $s0

fret:	lw $a0, 0($sp) 	# restaura los valores de los registros
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	add $sp, $sp, 12
	jr $ra

.data
	endl:	.asciiz "\n"

