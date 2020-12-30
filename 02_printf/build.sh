riscv64-unknown-elf-gcc -mcmodel=medany -march=rv64imafdc -mabi=lp64d -c entry.s -o entry.o
riscv64-unknown-elf-gcc -mcmodel=medany -march=rv64imafdc -mabi=lp64d -fno-pic -Wall -O  -ffreestanding -fno-common -nostdlib -mno-relax -nostdlib -c main.c -o main.o
riscv64-unknown-elf-gcc -mcmodel=medany -march=rv64imafdc -mabi=lp64d -fno-pic -Wall -O  -ffreestanding -fno-common -nostdlib -mno-relax -nostdlib -c tinyprintf.c -o tinyprintf.o
riscv64-unknown-elf-ld -z max-page-size=4096  -Tlink.ld -o fw_bin/hello.elf entry.o main.o tinyprintf.o
