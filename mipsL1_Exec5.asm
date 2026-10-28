
.data
    msg1: .asciiz "Digite o primeiro numero: "
    msg2: .asciiz "\nDigite o segundo numero: "
    resultado: .asciiz "\nA soma dos impares e: "

.text

main:
    # Ler primeiro numero
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Ler segundo numero
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Organizar do menor para o maior
    ble $t0, $t1, organizar

    move $t2, $t0
    move $t0, $t1
    move $t1, $t2

organizar:
    move $t2, $t0
    li $t3, 0

loop:
    # Verificar se chegou ao final
    bgt $t2, $t1, mostrar

    # Verificar se o numero e impar
    andi $t4, $t2, 1
    beq $t4, $zero, proximo

    add $t3, $t3, $t2

proximo:
    addi $t2, $t2, 1
    j loop

mostrar:
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
