#include "sbi.h"
#include "tinyprintf.h"
#include "interrupt.h"
#include "timer.h"

#define UNUSED(x) (void)(x)
static void stdout_putc(void *unused,char ch)
{
	SBI_PUTCHAR(ch);
}

void p_test(void)
{
    tfp_printf("test\n");
}

void main()
{
    init_printf(0, stdout_putc);
    tfp_printf("hello world\n");
    tfp_printf("hello world2\n");
    //p_test();
    //test irq
    table_val_set();
    enable_timer_interrupt();
    init_timer();
    interrupt_enable();
    tfp_printf("hello world3\n");
    while(1) {}
}
