#include "timer.h"
#include "sbi.h"

int TICKS = 0;
static uint64 TIMEBASE = 100000;

void
set_timer(uint64 stime_value)
{
    SBI_TIMER(stime_value);
}

// get current time
uint64
get_cycle()
{
    return r_time();
}

void
clock_set_next_event()
{
    set_timer(get_cycle() + TIMEBASE);
}

void
init_timer()
{
    TICKS = 0;
    //clock_on();
    clock_set_next_event();
    //printf("---- setup timer ----\n");
}
