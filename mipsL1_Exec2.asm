
.data
    msg1: .asciiz "Digite o raio: "
    resultado: .asciiz "O comprimento da circunferencia e: "

.text

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # PI = 3; comprimento = 2 * 3 * raio
    li $t1, 3
    mul $t2, $t0, $t1
    mul $t2, $t2, 2

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
