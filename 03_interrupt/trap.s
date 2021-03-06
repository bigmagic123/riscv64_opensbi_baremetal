.section      .text.entry
  .align 2

#include "interrupt.h"

  .global trap_entry
trap_entry:
    csrr a0, scause
    csrrc a1, stval, zero
    csrr  a2, sepc
    mv    a3, s0
    /* scause, stval, sepc, sp */
    call  handle_trap


#if 0

# 寄存器字节数，8字节
.equ XLENB, 8

# 将地址 sp+8*a2 处的值 load 到寄存器 a1 内
.macro LOAD a1, a2
    ld \a1, \a2*XLENB(sp)
.endm

# 将寄存器 a1 内的值 store 到地址 sp+8*a2 内
.macro STORE a1, a2
    sd \a1, \a2*XLENB(sp)
.endm

# 若中断前处于U态，sscratch保存内核栈地址
# 否则保存0
.macro SAVE_ALL
    csrrw sp, sscratch, sp
    # 处于用户态，需要切换内核栈
    bnez sp, trap_from_user

trap_from_kernel:
    csrr sp, sscratch
trap_from_user:
    # 分配栈帧
    addi sp, sp, -36*XLENB
    # x0为0，x2为sp，不保存
    STORE x1, 1
	STORE x3, 3
	STORE x4, 4
	STORE x5, 5
	STORE x6, 6
	STORE x7, 7
	STORE x8, 8
	STORE x9, 9
	STORE x10, 10
	STORE x11, 11
    STORE x12, 12
    STORE x13, 13
    STORE x14, 14
    STORE x15, 15
    STORE x16, 16
    STORE x17, 17
    STORE x18, 18
    STORE x19, 19
    STORE x20, 20
    STORE x21, 21
    STORE x22, 22
    STORE x23, 23
    STORE x24, 24
    STORE x25, 25
    STORE x26, 26
    STORE x27, 27
    STORE x28, 28
    STORE x29, 29
    STORE x30, 30
    STORE x31, 31

    # 保存sscratch等寄存器
    csrrw s0, sscratch, x0
    csrr s1, sstatus
    csrr s2, sepc
    csrr s3, stval
    csrr s4, scause

    # 再将这几个保存回栈
    STORE s0, 2
    STORE s1, 32
    STORE s2, 33
    STORE s3, 34
    STORE s4, 35
.endm

.macro RESTORE_ALL
    LOAD s1, 32
    LOAD s2, 33
    # 取出sstatus的SSP
    andi s0, s1, 1<<8
    # SSP=0，从用户态进入中断，需进行额外处理
    bnez s0, _to_kernel
_to_user:
    addi s0, sp, 36*XLENB
    csrw sscratch, s0
_to_kernel:
    csrw sstatus, s1
    csrw sepc, s2
    # 恢复通用寄存器
    LOAD x1, 1
	LOAD x3, 3
    LOAD x4, 4
    LOAD x5, 5
    LOAD x6, 6
    LOAD x7, 7
    LOAD x8, 8
    LOAD x9, 9
    LOAD x10, 10
    LOAD x11, 11
    LOAD x12, 12
    LOAD x13, 13
    LOAD x14, 14
    LOAD x15, 15
    LOAD x16, 16
    LOAD x17, 17
    LOAD x18, 18
    LOAD x19, 19
    LOAD x20, 20
    LOAD x21, 21
    LOAD x22, 22
    LOAD x23, 23
    LOAD x24, 24
    LOAD x25, 25
    LOAD x26, 26
    LOAD x27, 27
    LOAD x28, 28
    LOAD x29, 29
    LOAD x30, 30
    LOAD x31, 31
    # 切换回栈
    LOAD x2, 2
.endm

    .section .text
    .globl __alltraps
    .balign 4
__alltraps:
    SAVE_ALL
    mv a0, sp
    jal handle_trap

    .globl __trapret
__trapret:
    RESTORE_ALL
    sret

#endif

  .global table_val_set
table_val_set:
    la t0, trap_entry
    csrw stvec, t0
    jr ra


