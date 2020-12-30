#include "sbi.h"
#include "tinyprintf.h"
#define UNUSED(x) (void)(x)
static void stdout_putc(void *unused,char *ch)
{
	SBI_PUTCHAR(ch);
}
void main()
{
    init_printf(0, stdout_putc);

    tfp_printf("hello world\n");
    while(1) {}
}
