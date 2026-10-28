
.data
    msg1: .asciiz "Digite a primeira nota: "
    msg2: .asciiz "\nDigite a segunda nota: "
    msg3: .asciiz "\nDigite a terceira nota: "
    msg4: .asciiz "\nDigite a quarta nota: "
    media: .asciiz "\nA media e: "
    aprovado: .asciiz "\nAPROVADO"
    exame: .asciiz "\nEXAME"
    retido: .asciiz "\nRETIDO"

.text

main:
    # Primeira nota
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Segunda nota
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Terceira nota
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Quarta nota
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    # Somar as quatro notas
    add $t4, $t0, $t1
    add $t4, $t4, $t2
    add $t4, $t4, $t3

    # Calcular a media inteira
    li $t5, 4
    div $t4, $t5
    mflo $t6

    # Mostrar media
    li $v0, 4
    la $a0, media
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    # Verificar situacao
    bge $t6, 6, aprovado_msg
    bge $t6, 3, exame_msg
    j retido_msg

aprovado_msg:
    li $v0, 4
    la $a0, aprovado
    syscall
    j fim

exame_msg:
    li $v0, 4
    la $a0, exame
    syscall
    j fim

retido_msg:
    li $v0, 4
    la $a0, retido
    syscall

fim:
    li $v0, 10
    syscall
