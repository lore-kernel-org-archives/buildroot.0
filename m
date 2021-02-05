From: manu f <e.fiancette@gmail.com>
Date: Fri, 5 Feb 2021 20:07:34 +0100
Subject: [Buildroot] BR2_HOST_GCC_AT_LEAST_4_8 not set but toolchain
 linaro-7.3-2018.05 !?
Message-ID: <CAGshWo2d2hWBWQ-02Eb89YpdnR7Ck6cezX=+grKu91sRf1ObQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am the wink link! :-/
I build buildroot 2018.11.4 with external toolchain linaro-7.3-2018.05.
I could not activate the QT5WEBENGINE because I have
BR2_HOST_GCC_AT_LEAST_4_8 [=n]
I check in /output/host/opt/ext-toolchain/bin$ :

user at LinuxDev:~/lmn6_kernel/lmn6_system/output/host/opt/ext-toolchain/bin$
ls
arm-linux-gnueabihf-addr2line  arm-linux-gnueabihf-g++
arm-linux-gnueabihf-gcov-tool  arm-linux-gnueabihf-objcopy
arm-linux-gnueabihf-ar         arm-linux-gnueabihf-gcc
arm-linux-gnueabihf-gdb        arm-linux-gnueabihf-objdump
arm-linux-gnueabihf-as         arm-linux-gnueabihf-gcc-7.3.1
arm-linux-gnueabihf-gfortran   arm-linux-gnueabihf-ranlib
arm-linux-gnueabihf-c++        arm-linux-gnueabihf-gcc-ar
 arm-linux-gnueabihf-gprof      arm-linux-gnueabihf-readelf
arm-linux-gnueabihf-c++filt    arm-linux-gnueabihf-gcc-nm
 arm-linux-gnueabihf-ld         arm-linux-gnueabihf-size
arm-linux-gnueabihf-cpp        arm-linux-gnueabihf-gcc-ranlib
 arm-linux-gnueabihf-ld.bfd     arm-linux-gnueabihf-strings
arm-linux-gnueabihf-dwp        arm-linux-gnueabihf-gcov
 arm-linux-gnueabihf-ld.gold    arm-linux-gnueabihf-strip
arm-linux-gnueabihf-elfedit    arm-linux-gnueabihf-gcov-dump
arm-linux-gnueabihf-nm
user at LinuxDev:~/lmn6_kernel_mod/lmn6_system/output/host/opt/ext-toolchain/bin$
./arm-linux-gnueabihf-gcc -v
Using built-in specs.
COLLECT_GCC=./arm-linux-gnueabihf-gcc
COLLECT_LTO_WRAPPER=/home/user/lmn6_kernel_mod/lmn6_system/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/7.3.1/lto-wrapper
Target: arm-linux-gnueabihf
Configured with:
'/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/snapshots/gcc.git~linaro-7.3-2018.05/configure'
SHELL=/bin/bash
--with-mpc=/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu
--with-mpfr=/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu
--with-gmp=/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu
--with-gnu-as --with-gnu-ld --disable-libmudflap --enable-lto
--enable-shared --without-included-gettext --enable-nls --with-system-zlib
--disable-sjlj-exceptions --enable-gnu-unique-object
--enable-linker-build-id --disable-libstdcxx-pch --enable-c99
--enable-clocale=gnu --enable-libstdcxx-debug --enable-long-long
--with-cloog=no --with-ppl=no --with-isl=no --disable-multilib
--with-float=hard --with-fpu=vfpv3-d16 --with-mode=thumb
--with-tune=cortex-a9 --with-arch=armv7-a --enable-threads=posix
--enable-multiarch --enable-libstdcxx-time=yes
--enable-gnu-indirect-function
--with-build-sysroot=/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/_build/sysroots/arm-linux-gnueabihf
--with-sysroot=/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-gnueabihf/libc
--enable-checking=release --disable-bootstrap
--enable-languages=c,c++,fortran,lto --build=x86_64-unknown-linux-gnu
--host=x86_64-unknown-linux-gnu --target=arm-linux-gnueabihf
--prefix=/home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu
Thread model: posix
gcc version 7.3.1 20180425 [linaro-7.3-2018.05 revision
d29120a424ecfbc167ef90065c0eeb7f91977701] (Linaro GCC 7.3-2018.05)

So what's wrong?

Thanks for help.

Emmanuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210205/47496e5b/attachment-0002.html>
