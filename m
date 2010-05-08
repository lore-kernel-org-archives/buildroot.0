From: Sameer Bobade <skbobade@gmail.com>
Date: Sat, 8 May 2010 20:04:02 +0530
Subject: [Buildroot] Build Error!
In-Reply-To: <h2xa3e4d2d61005070951va874ec3bh77d05ec083479848@mail.gmail.com>
References: <j2ma3e4d2d61005010430hb5d94b22ia8ce4d39a84c52a7@mail.gmail.com> 
	<u2sa3e4d2d61005010435i99dc0cfbi6ab02762e7788da1@mail.gmail.com> 
	<87tyqk929a.fsf@macbook.be.48ers.dk>
	<h2xa3e4d2d61005070951va874ec3bh77d05ec083479848@mail.gmail.com>
Message-ID: <q2na3e4d2d61005080734r94f45f6amf9597a89105bbf86@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the output:


[Sameer at localhost ~]$ cd buildroot-2010.02/
[Sameer at localhost buildroot-2010.02]$ make
rm -rf /home/Sameer/buildroot-2010.02/output/build/buildroot-config
mkdir -p /home/Sameer/buildroot-2010.02/output/build
cp -dpRf package/config/buildroot-config
/home/Sameer/buildroot-2010.02/output/build/buildroot-config
mkdir -p /home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host
(cd /home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host; rm -rf
config.cache; \

PATH=/home/Sameer/buildroot-2010.02/output/host/bin:/home/Sameer/buildroot-2010.02/output/host/usr/bin:/usr/lib/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib/alliance/bin:/usr/libexec/sdcc:/home/Sameer/bin:/usr/lib/alliance/bin:/usr/libexec/sdcc
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld
-L/home/Sameer/buildroot-2010.02/output/host/lib
-L/home/Sameer/buildroot-2010.02/output/host/usr/lib" NM="/usr/bin/nm"
CC="/usr/bin/gcc -I/home/Sameer/buildroot-2010.02/output/host/include
-I/home/Sameer/buildroot-2010.02/output/host/usr/include" GCC="/usr/bin/gcc
-I/home/Sameer/buildroot-2010.02/output/host/include
-I/home/Sameer/buildroot-2010.02/output/host/usr/include" CXX="/usr/bin/g++
-I/home/Sameer/buildroot-2010.02/output/host/include
-I/home/Sameer/buildroot-2010.02/output/host/usr/include" CPP="/usr/bin/cpp
-I/home/Sameer/buildroot-2010.02/output/host/include
-I/home/Sameer/buildroot-2010.02/output/host/usr/include"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
FC_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-I/home/Sameer/buildroot-2010.02/output/host/include
-I/home/Sameer/buildroot-2010.02/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/Sameer/buildroot-2010.02/output/host/include
-I/home/Sameer/buildroot-2010.02/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/Sameer/buildroot-2010.02/output/host/lib
-L/home/Sameer/buildroot-2010.02/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-ar"
AS_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-as"
CC_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-gcc"
LD_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-ld"
NM_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-nm"
RANLIB_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-ranlib"
STRIP_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-strip"
OBJCOPY_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-objcopy"
OBJDUMP_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-objdump"
DEFAULT_ASSEMBLER="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-as"
DEFAULT_LINKER="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-ld"
ORIGINAL_AS_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-as"
ORIGINAL_LD_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-ld"
ORIGINAL_NM_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-nm"
ORIGINAL_OBJDUMP_FOR_TARGET="/home/Sameer/buildroot-2010.02/output/staging/usr/bin/i686-linux-uclibc-objdump"
PKG_CONFIG="/home/Sameer/buildroot-2010.02/output/host/usr/bin/pkg-config"
PKG_CONFIG_LIBDIR="/home/Sameer/buildroot-2010.02/output/host/usr/lib/pkgconfig"
PERLLIB="/home/Sameer/buildroot-2010.02/output/host/usr/lib/perl" \
         \
        /home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4/configure
\
        --prefix="/home/Sameer/buildroot-2010.02/output/toolchain/gmp" \
        --build=i386-SamOs v1.0 \
        --host=i386-SamOs v1.0 \
        --disable-shared \
        --enable-static \
        --disable-nls \
    )

configure: WARNING: you should use --build, --host, --target
configure: WARNING: you should use --build, --host, --target
 configure: error: --target is not appropriate for GMP
Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
manual for more on this).
make: ***
[/home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host/.configured]
Error 1



-- 
Yours,
Sameer Bobade.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100508/02d676b3/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: configs.tar.gz
Type: application/x-gzip
Size: 57853 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100508/02d676b3/attachment-0001.bin>
