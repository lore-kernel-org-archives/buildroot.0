From: Aurele Traynard <aurele.traynard@laposte.net>
Date: Thu, 9 Sep 2010 10:27:30 +0200
Subject: [Buildroot] troubles with intltool
Message-ID: <AANLkTikqwN4vkKaXWrA0SiGTwoYUYrST8vggtUwRVJRN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,

I am trying to build an image with X11, an I am experimenting some problems
with intltool
the problem is when the script call /usr/bin/perl -e "require XML::Parser"
i tried to use the following command : /usr/bin/perl -e "require
XML::Parser"  to know what is the problem but it says nothing...
could someone help, me next is the report

thanks,
Aur?le

>>> xkeyboard-config 1.8 Configuring
(cd /media/disk3/buildroot-2010.08/output/build/xkeyboard-config-1.8/ && rm
-rf config.cache &&
PATH="/media/disk3/buildroot-2010.08/output/host/bin:/media/disk3/buildroot-2010.08/output/host/usr/bin:/media/disk3/buildroot-2010.08/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games"
AR="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-ar"
AS="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-as"
LD="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-ld
--sysroot=/media/disk3/buildroot-2010.08/output/staging"
NM="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-nm"
CC="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gcc
--sysroot=/media/disk3/buildroot-2010.08/output/staging"
GCC="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gcc
--sysroot=/media/disk3/buildroot-2010.08/output/staging"
CPP="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-cpp
--sysroot=/media/disk3/buildroot-2010.08/output/staging"
CXX="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-g++
--sysroot=/media/disk3/buildroot-2010.08/output/staging"
FC="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gfortran
--sysroot=/media/disk3/buildroot-2010.08/output/staging"
RANLIB="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-ranlib"
STRIP="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-strip"
OBJCOPY="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/media/disk3/buildroot-2010.08/output/host/include
-I/media/disk3/buildroot-2010.08/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/media/disk3/buildroot-2010.08/output/host/include
-I/media/disk3/buildroot-2010.08/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/media/disk3/buildroot-2010.08/output/host/lib
-L/media/disk3/buildroot-2010.08/output/host/usr/lib
-Wl,-rpath,/media/disk3/buildroot-2010.08/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-as"
DEFAULT_LINKER="/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-ld
--sysroot=/media/disk3/buildroot-2010.08/output/staging" CFLAGS="-pipe -Os
-mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CXXFLAGS="-pipe -Os  -mtune=xscale -march=armv5te -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
LDFLAGS="-L/media/disk3/buildroot-2010.08/output/staging/lib
-L/media/disk3/buildroot-2010.08/output/staging/usr/lib" FCFLAGS=""
PKG_CONFIG_SYSROOT_DIR="/media/disk3/buildroot-2010.08/output/staging"
PKG_CONFIG="/media/disk3/buildroot-2010.08/output/host/usr/bin/pkg-config"
PKG_CONFIG_PATH="/media/disk3/buildroot-2010.08/output/staging/usr/lib/pkgconfig:"
PERLLIB="/media/disk3/buildroot-2010.08/output/host/usr/lib/perl"
STAGING_DIR="/media/disk3/buildroot-2010.08/output/staging" CXX=false
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
ac_cv_c_bigendian=no  ./configure  --target=arm-linux --host=arm-linux
--build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc
--disable-gtk-doc     GMSGFMT=/usr/bin/msgfmt )
configure: WARNING: unrecognized options: --disable-gtk-doc
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for arm-linux-strip...
/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-strip
checking whether to enable maintainer-specific portions of Makefiles... no
checking for xkbcomp...
/media/disk3/buildroot-2010.08/output/host/usr/bin/xkbcomp
checking whether NLS is requested... yes
checking for style of include used by make... GNU
checking for arm-linux-gcc...
/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gcc
--sysroot=/media/disk3/buildroot-2010.08/output/staging
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gcc
--sysroot=/media/disk3/buildroot-2010.08/output/staging accepts -g... yes
checking for /usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gcc
--sysroot=/media/disk3/buildroot-2010.08/output/staging option to accept ISO
C89... none needed
checking dependency style of
/usr/local/arm/arm-2010q1/bin/arm-none-linux-gnueabi-gcc
--sysroot=/media/disk3/buildroot-2010.08/output/staging... none
checking for intltool >= 0.30... 0.40.6 found
checking for intltool-update...
/media/disk3/buildroot-2010.08/output/host/usr/bin/intltool-update
checking for intltool-merge...
/media/disk3/buildroot-2010.08/output/host/usr/bin/intltool-merge
checking for intltool-extract...
/media/disk3/buildroot-2010.08/output/host/usr/bin/intltool-extract
checking for xgettext... /usr/bin/xgettext
checking for msgmerge... /usr/bin/msgmerge
checking for msgfmt... /usr/bin/msgfmt
checking for gmsgfmt... /usr/bin/msgfmt
checking for perl... /usr/bin/perl
checking for perl >= 5.8.1... 5.10.0
checking for XML::Parser... configure: error: XML::Parser perl module is
required for intltool
make: ***
[/media/disk3/buildroot-2010.08/output/build/xkeyboard-config-1.8/.stamp_configured]
Erreur 127
user at debdev:/media/disk3/buildroot-2010.08$ /usr/bin/perl -e "require
XML::Parser"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100909/72563513/attachment.html>
