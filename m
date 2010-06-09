From: Chris Kerios <ckerios@gmail.com>
Date: Wed, 9 Jun 2010 19:15:23 -0400
Subject: [Buildroot] file 5.04 build problem
Message-ID: <AANLkTimzWZ6hMxsy68DYLja5UmL_KXU4e1_8koRJ4VOU@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All:
Just did a git pull to update my tree and rebuild my system, etc.  The
build ran into a problem with the file-5.04 application.  I noticed
from the mailing list that the version was just updated and it was
migrated over to autotargets.  Don't know how to fix but thought you
would like to know.  It says "changes in environment can compromise
the build", I don't know what that means as I have been running the
build for the past 1.5 hours and have not made any changes to my
system.   I am building on a 32 bit x86 Fedora 13 distribution host
for a Geode LX target.
Regards,
Chris


>>> file 5.04 Configuring
(cd /home/chris/Embedded/geode/build-tools/buildroot/output/build/file-5.04/
&& rm -rf config.cache &&
PATH="/home/chris/Embedded/geode/build-tools/buildroot/output/toolchain/bin:/home/chris/Embedded/geode/build-tools/buildroot/output/host/bin:/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/bin:/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/sbin/:/home/chris/Embedded/geode/build-tools/buildroot/output/staging/bin:/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin:/usr/lib/ccache:/usr/lib/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/chris/bin"
AR="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ar"
AS="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-as"
LD="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ld"
NM="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-nm"
CC="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging"
GCC="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging"
CPP="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-cpp
-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging"
CXX="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-g++
-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging"
FC="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gfortran
" RANLIB="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ranlib"
STRIP="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-strip"
OBJCOPY="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/lib/ccache/gcc" GCC_FOR_BUILD="/usr/lib/ccache/gcc"
CXX_FOR_BUILD="/usr/lib/ccache/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/chris/Embedded/geode/build-tools/buildroot/output/host/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/chris/Embedded/geode/build-tools/buildroot/output/host/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/chris/Embedded/geode/build-tools/buildroot/output/host/lib
-L/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ar"
AS_FOR_TARGET="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-as"
CC_FOR_TARGET="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc"
LD_FOR_TARGET="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ld"
NM_FOR_TARGET="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-as"
DEFAULT_LINKER="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/chris/Embedded/geode/build-tools/buildroot/output/staging"
PKG_CONFIG="/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/lib/pkgconfig:"
PERLLIB="/home/chris/Embedded/geode/build-tools/buildroot/output/host/usr/lib/perl"
STAGING_DIR="/home/chris/Embedded/geode/build-tools/buildroot/output/staging"
ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
ac_cv_c_bigendian=no CFLAGS="-Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging"
CXXFLAGS="-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging"
LDFLAGS="-L/home/chris/Embedded/geode/build-tools/buildroot/output/staging/lib
-L/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/lib
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/"
FCFLAGS=""  CFLAGS="-Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging
-D_GNU_SOURCE" ./configure
--cache-file="/home/chris/Embedded/geode/build-tools/buildroot/output/build/tgt-config.cache"
--target=i586-linux --host=i586-linux --build=i686-pc-linux-gnu
--prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --disable-gtk-doc
--disable-nls  --disable-ipv6   )
configure: loading cache
/home/chris/Embedded/geode/build-tools/buildroot/output/build/tgt-config.cache
configure: error: `CFLAGS' has changed since the previous run:
configure:   former value:  -Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging
configure:   current value: -Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/usr/include
-I/home/chris/Embedded/geode/build-tools/buildroot/output/staging/include
--sysroot=/home/chris/Embedded/geode/build-tools/buildroot/output/staging/
-isysroot /home/chris/Embedded/geode/build-tools/buildroot/output/staging
-D_GNU_SOURCE
configure: error: changes in the environment can compromise the build
configure: error: run `make distclean' and/or `rm
/home/chris/Embedded/geode/build-tools/buildroot/output/build/tgt-config.cache'
and start over
make: *** [/home/chris/Embedded/geode/build-tools/buildroot/output/build/file-5.04/.stamp_configured]
Error 1
[chris at corney buildroot]$
