#Build Script
#Made By Petro

DEFCONFIG="beryllium_defconfig"
KERNELDIR=$(pwd)
OUT=gcc_out

config() {
make O=$OUT ARCH=arm64 $DEFCONFIG
}

menuconfig(){
make O=$OUT ARCH=arm64 menuconfig
}


all(){
PATH="/$KERNELDIR/GCC_4.9/bin:${PATH}"
LD_LIBRARY_PATH=$KERNELDIR/GCC_4.9 make -j$(nproc --all) O=$OUT \
                      ARCH=arm64 \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CC="gcc-4.8" \
                      | tee kernel.log
}

dtb(){
PATH="/$KERNELDIR/GCC_4.9/bin:${PATH}"
LD_LIBRARY_PATH=$KERNELDIR/GCC_4.9 make -j$(nproc --all) O=$OUT dtbs\
                      ARCH=arm64 \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CC="gcc-4.8" \
                      | tee kernel.log
}


$1
