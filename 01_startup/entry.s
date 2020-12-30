    .section .text.entry
    .globl _start
_start:
    /* setup stack */
    la    sp, stack_top           # setup stack pointer
    call main
halt:   j     halt                    # enter the infinite loop

loop:
    j loop

    .section .bss.stack
    .align 12
    .global stack_top
stack_top:
    .space 4096 * 4
    .global stack_top
