#include "ttypes.h"

// Supervisor Interrupt Enable
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software

// Supervisor Status Register, sstatus
#define SSTATUS_SPP (1L << 8)  // Previous mode, 1=Supervisor, 0=User
#define SSTATUS_SPIE (1L << 5) // Supervisor Previous Interrupt Enable
#define SSTATUS_UPIE (1L << 4) // User Previous Interrupt Enable
#define SSTATUS_SIE (1L << 1)  // Supervisor Interrupt Enable
#define SSTATUS_UIE (1L << 0)  // User Interrupt Enable

inline uint64 r_sie()
{
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
  return x;
}

inline uint64 r_sip()
{
  uint64 x;
  asm volatile("csrr %0, sip" : "=r" (x) );
  return x;
}

inline void w_sie(uint64 x)
{
  asm volatile("csrw sie, %0" : : "r" (x));
}

inline void w_sip(uint64 x)
{
  asm volatile("csrw sip, %0" : : "r" (x));
}

inline uint64 r_sstatus()
{
  uint64 x;
  asm volatile("csrr %0, sstatus" : "=r" (x) );
  return x;
}

inline void w_sstatus(uint64 x)
{
    asm volatile("csrw sstatus, %0" : : "r" (x));
}

inline void w_s_vec_base(uint64 x)
{
    asm volatile("csrw stvec, %0" : : "r" (x));
}

void table_val_set(void);
void interrupt_disable(void);
void interrupt_enable(void);
void enable_timer_interrupt(void);