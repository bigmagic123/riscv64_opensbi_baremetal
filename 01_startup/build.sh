riscv64-unknown-elf-gcc -nostdlib -c entry.s -o entry.o
riscv64-unknown-elf-gcc -nostdlib -c main.c -o main.o
riscv64-unknown-elf-ld -o fw_bin/hello.elf -Tlink.ld entry.o main.o
