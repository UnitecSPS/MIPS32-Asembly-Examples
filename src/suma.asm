.data
	numero1: .asciiz "Ingrese el numero 1:\n"
	numero2: .asciiz "Ingrese el numero 2:\n"
	respuesta: .asciiz "La suma es: "
.text
	j main

suma:
	add $v0, $a0, $a1
	jr $ra

main:
    	li $v0, 4
	la $a0, numero1 
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0

input2:
    	li $v0, 4
   	la $a0, numero2
	syscall
	li $v0,5
	syscall
	move $t1, $v0
	
resultado:	
    	li $v0, 4
    	la $a0, respuesta
	syscall
	move $a0, $t0
	move $a1, $t1
	jal suma

	move $a0, $v0
	li $v0, 1 
	syscall
	
	li $v0,10
	syscall
