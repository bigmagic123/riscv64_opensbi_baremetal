#include "interrupt.h"
#include "tinyprintf.h"

void interrupt_disable(void)
{
    w_sie(0);
    w_sip(0);
}

void interrupt_enable(void)
{
    w_sstatus(r_sstatus() | SSTATUS_SIE);
}

void enable_timer_interrupt(void)
{
  w_sie(r_sie() | SIE_STIE);
}

uintptr_t handle_trap(uintptr_t scause, uintptr_t stval, uintptr_t sepc, uintptr_t sp)
{
    tfp_printf("handle_trap %08lx:%08lx:%08lx:%08lx\n", scause, stval, sepc, sp);
    while (1);
    return 0;
}