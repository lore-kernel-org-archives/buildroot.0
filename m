From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 23 Nov 2016 10:49:10 +0100
Subject: [Buildroot] Bare metal toolchain support?
Message-ID: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is buildroot able to build a baremetal toolchain?

Specifically, I'm trying to build a small bootloader for the microblaze
architecture. Xilinx provides an SDK, and I wonder if I can build one like
this using buildroot, so I can keep all my code and workflow centralized
under buildroot.

$ mb-gcc -v
Using built-in specs.
COLLECT_GCC=mb-gcc
COLLECT_LTO_WRAPPER=/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/bin/../libexec/gcc/microblaze-xilinx-elf/5.2.0/lto-wrapper
Target: microblaze-xilinx-elf
Configured with:
/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_bld/target_build/src/gcc-custom/configure
--build=i686-build_pc-linux-gnu --host=i686-build_pc-linux-gnu
--target=microblaze-xilinx-elf
--prefix=/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_output
--with-local-prefix=/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_output/microblaze-xilinx-elf/sysroot
--disable-libmudflap
--with-sysroot=/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_output/microblaze-xilinx-elf/sysroot
--with-newlib --enable-threads=no --disable-shared
--with-pkgversion='crosstool-NG 1.20.0' --disable-__cxa_atexit
--with-gmp=/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_bld/target_build/microblaze-xilinx-elf/buildtools
--with-mpfr=/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_bld/target_build/microblaze-xilinx-elf/buildtools
--with-mpc=/proj/sdk/gnu/microblaze/builds/HEAD/nightly/2016_06_03/rdi_scripts/../build/lin/ctng_bld/target_build/microblaze-xilinx-elf/buildtools
--with-ppl=no --with-isl=no --with-cloog=no --with-libelf=no --disable-lto
--enable-target-optspace --without-long-double-128 --disable-libgomp
--disable-libmudflap --disable-nls --disable-libstdcxx-pch
--enable-languages=c,c++
Thread model: single
gcc version 5.2.0 (crosstool-NG 1.20.0)


Best regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161123/970f2e58/attachment.html>
