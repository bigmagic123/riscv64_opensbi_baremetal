#include "ttypes.h"

inline uint64 r_time()
{
  uint64 x;
  asm volatile("csrr %0, time" : "=r" (x) );
  return x;
}
void init_timer();