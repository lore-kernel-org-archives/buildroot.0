From: Daniel Lodos <daniel.lodos@hab.desoft.cu>
Date: Thu, 26 Aug 2010 12:27:02 -0500
Subject: [Buildroot] linux-fusion 8.1.1 Installing to target Errors
Message-ID: <4C76A3E6.1090005@hab.desoft.cu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi am trying to MAKE the configured Buildroot but its interrupted at the 
point shown below. Previosly i got the headers_install error that i 
solved modifying some config.in and mk on directfb and linux_fusion files.
how can i solve the problem?
Thanks in advance
Daniel Lodos


 >>> linux-fusion 8.1.1 Installing to target
/usr/bin/make -j2 
PATH="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/toolchain/bin:/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/bin:/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/bin:/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/sbin/:/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/bin:/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin:/home/daniel/Desktop/Embedded/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
AR="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-ar" 
AS="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-as" 
LD="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-ld" 
NM="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-nm" 
CC="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc 
-Os -pipe -Os  -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/include 
--sysroot=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/ -isysroot 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging" 
GCC="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc 
-Os -pipe -Os  -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/include 
--sysroot=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/ -isysroot 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging" 
CPP="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-cpp 
-Os -pipe -Os  -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/include 
--sysroot=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/ -isysroot 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging" 
CXX="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-g++ 
-Os -pipe -Os  -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/include 
--sysroot=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/ -isysroot 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging" 
FC="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-gfortran 
" 
RANLIB="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-ranlib" 
STRIP="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-strip" 
OBJCOPY="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-objcopy" 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" 
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" 
LD_FOR_BUILD="/usr/bin/ld" 
CFLAGS_FOR_BUILD="-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/include" 
CXXFLAGS_FOR_BUILD="-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/lib 
-L/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/lib" 
FCFLAGS_FOR_BUILD="" 
AR_FOR_TARGET="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-ar" 
AS_FOR_TARGET="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-as" 
CC_FOR_TARGET="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc" 
LD_FOR_TARGET="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-ld" 
NM_FOR_TARGET="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-nm" 
DEFAULT_ASSEMBLER="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-as" 
DEFAULT_LINKER="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc-ld" 
PKG_CONFIG_SYSROOT_DIR="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging" 
PKG_CONFIG="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/bin/pkg-config" 
PKG_CONFIG_PATH="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/lib/pkgconfig:" 
PERLLIB="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/host/usr/lib/perl" 
STAGING_DIR="/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging" 
CXX=false KERNEL_VERSION= 
KERNEL_BUILD=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34 
KERNEL_SOURCE=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34 
SYSROOT=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/target 
ARCH=i386 
CROSS_COMPILE=/home/daniel/Desktop/Embedded/buildroot-2010.05/output/staging/usr/bin/i686-unknown-linux-uclibc- 
KERNEL_MODLIB=/lib/modules//kernel -C 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1 
install
expr: syntax error
make[1]: Entering directory 
`/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1'
rm -f linux/drivers/char/fusion/Makefile
ln -s Makefile-2. linux/drivers/char/fusion/Makefile
/usr/bin/make -C 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34 \
         CPPFLAGS=" -D__KERNEL__ -I`pwd`/linux/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34/include 
-I/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34/include 
" \
         SUBDIRS=`pwd`/linux/drivers/char/fusion modules
make[2]: Entering directory 
`/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34'
scripts/Makefile.build:44: 
/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1/linux/drivers/char/fusion/Makefile: 
No such file or directory
make[3]: *** No rule to make target 
`/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1/linux/drivers/char/fusion/Makefile'.  
Stop.
make[2]: *** 
[_module_/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1/linux/drivers/char/fusion] 
Error 2
make[2]: Leaving directory 
`/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-2.6.34'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1'
make: *** 
[/home/daniel/Desktop/Embedded/buildroot-2010.05/output/build/linux-fusion-8.1.1/.stamp_target_installed] 
Error 2
