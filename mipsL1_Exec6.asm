
.data
    msg: .asciiz "Digite um numero inteiro: "
    erro: .asciiz "Numero negativo! Digite novamente.\n"
    maior_msg: .asciiz "\nO maior valor e: "
    menor_msg: .asciiz "\nO menor valor e: "

.text

main:
    li $t0, 0       # Quantidade de numeros validos

ler:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Se for negativo, solicitar novamente
    bltz $t1, negativo

    # Primeiro numero valido
    beq $t0, $zero, primeiro

    # Atualizar maior
    bgt $t1, $t2, atualiza_maior
    j verifica_menor

atualiza_maior:
    move $t2, $t1

verifica_menor:
    # Atualizar menor
    blt $t1, $t3, atualiza_menor
    j contar

atualiza_menor:
    move $t3, $t1
    j contar

primeiro:
    move $t2, $t1   # Maior
    move $t3, $t1   # Menor

contar:
    addi $t0, $t0, 1
    blt $t0, 10, ler
    j mostrar

negativo:
    li $v0, 4
    la $a0, erro
    syscall
    j ler

mostrar:
    li $v0, 4
    la $a0, maior_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, menor_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
