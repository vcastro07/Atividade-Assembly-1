
.data
    msg1: .asciiz "Digite o comprimento: "
    msg2: .asciiz "Digite a largura: "
    msg3: .asciiz "Digite a altura: "
    resultado: .asciiz "O volume e: "

.text

main:
    # Ler comprimento
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Ler largura
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Ler altura
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    # Calcular volume
    mul $t3, $t0, $t1
    mul $t3, $t3, $t2

    # Mostrar resultado
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
