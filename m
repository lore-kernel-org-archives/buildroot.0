From: Panahi Parsa <panahi.par3a@gmail.com>
Date: Sat, 28 Jun 2014 00:58:31 +0430
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
Message-ID: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi I faced this error when making buildroot

parsa at parsa-System-Product-Name:~/Software/Buildroot/buildroot$ make
>>> glibc 2.18 Configuring
mkdir -p
/home/parsa/Software/Buildroot/buildroot/output/build/glibc-2.18/build
# Do the configuration
(cd /home/parsa/Software/Buildroot/buildroot/output/build/glibc-2.18/build;
PATH="/home/parsa/Software/Buildroot/buildroot/output/host/bin:/home/parsa/Software/Buildroot/buildroot/output/host/sbin:/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin:/home/parsa/Software/Buildroot/buildroot/output/host/usr/sbin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-ar"
AS="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-as"
LD="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-ld"
NM="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-nm"
CC="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc"
GCC="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc"
CPP="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-cpp"
CXX="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-g++"
FC="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gfortran"
RANLIB="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-ranlib"
READELF="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-readelf"
STRIP="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-strip"
OBJCOPY="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-objcopy"
OBJDUMP="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/parsa/Software/Buildroot/buildroot/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2
-I/home/parsa/Software/Buildroot/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/parsa/Software/Buildroot/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/parsa/Software/Buildroot/buildroot/output/host/lib
-L/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib
-Wl,-rpath,/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-as"
DEFAULT_LINKER="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -pipe -O3 " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -O3 " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/parsa/Software/Buildroot/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot"
CXX=false CFLAGS="-O2 " CPPFLAGS="" CXXFLAGS="-O2 " /bin/bash
/home/parsa/Software/Buildroot/buildroot/output/build/glibc-2.18/./configure
ac_cv_path_BASH_SHELL=/bin/bash libc_cv_forced_unwind=yes
--target=x86_64-buildroot-linux-gnu --host=x86_64-buildroot-linux-gnu
--build=x86_64-unknown-linux-gnu --prefix=/usr --enable-shared --with-fp
--with-pkgversion="Buildroot" --without-cvs --disable-profile --without-gd
--enable-obsolete-rpc
--with-headers=/home/parsa/Software/Buildroot/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include)
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-buildroot-linux-gnu
checking for x86_64-buildroot-linux-gnu-gcc...
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc
accepts -g... yes
checking for gcc... gcc
checking whether we are using the GNU C++ compiler... no
checking whether false accepts -g... no
checking for x86_64-buildroot-linux-gnu-readelf...
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-readelf
checking for sysdeps preconfigure fragments... x86_64 checking whether
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc
compiles in -mx32 mode by default... no

configure: running configure fragment for add-on libidn
configure: running configure fragment for add-on nptl
checking add-on ports for preconfigure fragments... aarch64 alpha am33 arm
hppa ia64 m68k microblaze mips tile
checking for assembler and linker STT_GNU_IFUNC support... yes
checking whether .text pseudo-op must be used... yes
checking sysdep dirs... sysdeps/unix/sysv/linux/x86_64/64/nptl
sysdeps/unix/sysv/linux/x86_64/64 nptl/sysdeps/unix/sysv/linux/x86_64
nptl/sysdeps/unix/sysv/linux/x86 sysdeps/unix/sysv/linux/x86
sysdeps/unix/sysv/linux/x86_64 sysdeps/unix/sysv/linux/wordsize-64
nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread
ports/sysdeps/unix/sysv/linux sysdeps/unix/sysv/linux sysdeps/gnu
sysdeps/unix/inet nptl/sysdeps/unix/sysv ports/sysdeps/unix/sysv
sysdeps/unix/sysv sysdeps/unix/x86_64 nptl/sysdeps/unix ports/sysdeps/unix
sysdeps/unix sysdeps/posix nptl/sysdeps/x86_64/64 sysdeps/x86_64/64
sysdeps/x86_64/fpu/multiarch sysdeps/x86_64/fpu sysdeps/x86/fpu
sysdeps/x86_64/multiarch nptl/sysdeps/x86_64 sysdeps/x86_64 sysdeps/x86
sysdeps/ieee754/ldbl-96 sysdeps/ieee754/dbl-64/wordsize-64
sysdeps/ieee754/dbl-64 sysdeps/ieee754/flt-32 sysdeps/wordsize-64
sysdeps/ieee754 sysdeps/generic
configure: WARNING: add-on ports contributed no useful sysdeps directories
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking whether
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/as
is GNU as... yes
checking whether
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/ld
is GNU ld... yes
checking for
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/as...
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/as
checking version of
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/as...
2.22, ok
checking for
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/ld...
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/ld
checking version of
/home/parsa/Software/Buildroot/buildroot/output/host/usr/lib/gcc/x86_64-buildroot-linux-gnu/4.8.3/../../../../x86_64-buildroot-linux-gnu/bin/ld...
2.22, ok
checking for x86_64-buildroot-linux-gnu-gcc... (cached)
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc
checking version of
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-gcc...
4.8.3, ok
checking for gnumake... no
checking for gmake... no
checking for make... make
checking version of make... 3.81, ok
checking for gnumsgfmt... no
checking for gmsgfmt... no
checking for msgfmt... msgfmt
checking version of msgfmt... 0.18.1, ok
checking for makeinfo... no
checking for sed... sed
checking version of sed... 4.2.1, ok
checking for gawk... gawk
checking version of gawk... 4.1.0, ok
checking for x86_64-buildroot-linux-gnu-nm...
/home/parsa/Software/Buildroot/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-nm
checking for autoconf... no
configure: WARNING:
*** These auxiliary programs are missing or incompatible versions: makeinfo
autoconf
*** some features will be disabled.
*** Check the INSTALL file for required versions.
checking LD_LIBRARY_PATH variable... contains current directory
configure: error:
*** LD_LIBRARY_PATH shouldn't contain the current directory when
*** building glibc. Please change the environment variable
*** and run configure again.
make: ***
[/home/parsa/Software/Buildroot/buildroot/output/build/glibc-2.18/.stamp_configured]
Error 1

parsa at parsa-System-Product-Name:~/Software/Buildroot/buildroot$

It seems that I should change LD_LIBARAY_PATH to include glibc environment
variables !! Since I'm new to buildroot I don't know how I should do this.

Is there some one who can tell me the steps to solve this problem ?

-- 


Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140628/1f4b9755/attachment.html>
