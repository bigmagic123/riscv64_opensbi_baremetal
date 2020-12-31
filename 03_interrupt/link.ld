OUTPUT_ARCH( "riscv" )
OUTPUT_FORMAT("elf64-littleriscv")
ENTRY( _start )
SECTIONS
{
  /* text: test code section */
  . = 0x80200000;
  start = .;

  .text : {
     stext = .;
        *(.text.entry)
        *(.text .text.*)
        . = ALIGN(4K);
        etext = .;
  }

  .data : {
        sdata = .;
        *(.data .data.*)
        edata = .;
  }

  .bss : {
        sbss = .;
        *(.bss .bss.*)
        ebss = .;
  }

  PROVIDE(end = .);
}
