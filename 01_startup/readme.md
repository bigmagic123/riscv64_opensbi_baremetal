## 环境准备

### 1.准备qemu

可以到官网下载最新的qemu

```
https://www.qemu.org
```

解压后进行安装与编译。

```
tar xvf qemu-5.2.0.tar.xz
./configure --target-list=riscv64-softmmu
make
sudo make install
```

## 2.准备交叉编译工具链

可以到官网上下载对应的交叉编译工具链

```
https://www.sifive.com/software
```

准备交叉编译工具链

```
export PATH=$PATH:/opt/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14/bin/
```

### 3.准备入口函数

准备源代码

有两个需要准备的东西：
1.入口函数

2.main函数





首先可以通过build.sh来进行固件的编译


build.sh直接编译程序，然后通过
