#Build Script
#Made By Petro


DEFCONFIG="beryllium_defconfig"
KERNELDIR=$(pwd)
OUT=gcc_out

build() {
make O=$OUT ARCH=arm64 $DEFCONFIG
PATH="/$KERNELDIR/GCC_4.9/bin:${PATH}"
make -j$(nproc --all) O=$OUT \
                      ARCH=arm64 \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CC="ccache gcc-4.8" \
                      | tee kernel.log
}
build
