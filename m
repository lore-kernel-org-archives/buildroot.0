From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 08:44:58 +0200
Subject: [Buildroot] =?utf-8?q?Fw=3A_Build_failed_in_Jenkins=3A_buildroot_?=
 =?utf-8?q?=C2=BB__raspberrypi=5Fdefconfig_=23320?=
Message-ID: <20140804084458.60f38d5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Following your bump of the RPi kernel version, the defconfig now longer
builds, apparently because the bcmrpi_quick_defconfig no longer exists
in the RPi kernel. Could you have a look at this?

Thanks a lot,

Thomas

----- Message Transf?r? -----

Date: Mon, 4 Aug 2014 00:59:20 +0200 (CEST)
De: jenkins at free-electrons.com
?: maxime.ripard at free-electrons.com, jacmet at sunsite.dk,
thomas at free-electrons.com Sujet: Build failed in Jenkins: buildroot ?
raspberrypi_defconfig #320


See
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/320/changes>

Changes:

[thomas.petazzoni] bluez5_utils: new package

[thomas.petazzoni] linux-headers: bump 3.{4, 10, 12, 14, 15}.x series

[thomas.petazzoni] linux: bump default to version 3.15.8

[thomas.petazzoni] samba4: security update to 4.1.11

[thomas.petazzoni] musl: bump to version 1.1.4

[thomas.petazzoni] xapp_xrandr: Bump version to 1.4.3

[thomas.petazzoni] xcb-proto: Bump version to 1.11

[thomas.petazzoni] libxcb: Bump version to 1.11

[thomas.petazzoni] package/vlc: Bump version to 2.1.5

[thomas.petazzoni] package/rpi-userland: Bump version

[thomas.petazzoni] package/rpi-firmware: Bump version to kernel 3.12.25

[thomas.petazzoni] configs: bump kernel used for the RPi

[thomas.petazzoni] package/ffmpeg: Bump to version 2.3.1

[thomas.petazzoni] qt: make installation of translation files optional

[thomas.petazzoni] atk: bump to version 2.12.0

[thomas.petazzoni] openssh: replace individual ssh-keygen calls with a
single call

[thomas.petazzoni] xbmc: Add X.org/OpenGL support

[thomas.petazzoni] xbmc: Add option for Goom screensaver

[thomas.petazzoni] xbmc: Add VA-API support

[thomas.petazzoni] libmemcached: unification of name
<PKG>_VERSION_MAJOR variable

[thomas.petazzoni] toolchain: Add config option for atomic intrinsics

[thomas.petazzoni] jack2: Add dependency on atomic intrinsics

[thomas.petazzoni] icu: Add dependency on atomic intrinsics

[thomas.petazzoni] libtorrent: Add dependency on atomic intrinsics

[thomas.petazzoni] thrift: Add dependency on atomic intrinsics

[thomas.petazzoni] package/ltrace: Fix "unmet direct dependencies"

[thomas.petazzoni] ltrace: add comment for dependencies

[thomas.petazzoni] gst-fsl-plugins, libfslvpuwrap: add missing select

------------------------------------------
[...truncated 40731 lines...]
checking lzo/lzoconf.h usability... yes
checking lzo/lzoconf.h presence... yes
checking for lzo/lzoconf.h... yes
checking lzo/lzo1x.h usability... yes
checking lzo/lzo1x.h presence... yes
checking for lzo/lzo1x.h... yes
checking for version information in lzo/lzoconf.h...... v2
checking for __lzo_init_v2 in -llzo2... yes
checking for lzo1x_decompress_asm_fast in -llzo2... no
checking for _lzo1x_decompress_asm_fast in -llzo2... no
checking conio.h usability... no
checking conio.h presence... no
checking for conio.h... no
checking direct.h usability... no
checking direct.h presence... no
checking for direct.h... no
checking dos.h usability... no
checking dos.h presence... no
checking for dos.h... no
checking io.h usability... no
checking io.h presence... no
checking for io.h... no
checking share.h usability... no
checking share.h presence... no
checking for share.h... no
checking sys/utime.h usability... no
checking sys/utime.h presence... no
checking for sys/utime.h... no
checking for off_t... yes
checking for ptrdiff_t... yes
checking for size_t... yes
checking return type of signal handlers... void
checking for nanoseconds member of struct stat.st_mtim... tv_nsec
checking size of short... 2
checking size of int... 4
checking size of long... 8
checking size of long long... 8
checking size of __int16... 0
checking size of __int32... 0
checking size of __int64... 0
checking size of void *... 8
checking size of size_t... 8
checking size of ptrdiff_t... 8
checking size of __int32... (cached) 0
checking size of intmax_t... 8
checking size of uintmax_t... 8
checking size of intptr_t... 8
checking size of uintptr_t... 8
checking size of float... 4
checking size of double... 8
checking size of long double... 16
checking size of dev_t... 8
checking size of fpos_t... 16
checking size of mode_t... 4
checking size of off_t... 8
checking size of ssize_t... 8
checking size of time_t... 8
checking for access... yes
checking for alloca... no
checking for atexit... yes
checking for atoi... yes
checking for atol... yes
checking for chmod... yes
checking for chown... yes
checking for clock_getcpuclockid... yes
checking for clock_getres... yes
checking for clock_gettime... yes
checking for ctime... yes
checking for difftime... yes
checking for fstat... yes
checking for getenv... yes
checking for getpagesize... yes
checking for getrusage... yes
checking for gettimeofday... yes
checking for gmtime... yes
checking for isatty... yes
checking for localtime... yes
checking for longjmp... yes
checking for lstat... yes
checking for memcmp... yes
checking for memcpy... yes
checking for memmove... yes
checking for memset... yes
checking for mkdir... yes
checking for mktime... yes
checking for mmap... yes
checking for mprotect... yes
checking for munmap... yes
checking for qsort... yes
checking for raise... yes
checking for rmdir... yes
checking for setjmp... yes
checking for signal... yes
checking for snprintf... yes
checking for strcasecmp... yes
checking for strchr... yes
checking for strdup... yes
checking for strerror... yes
checking for strftime... yes
checking for stricmp... no
checking for strncasecmp... yes
checking for strnicmp... no
checking for strrchr... yes
checking for strstr... yes
checking for time... yes
checking for umask... yes
checking for utime... yes
checking for vsnprintf... yes
checking whether your compiler passes the ACC conformance test... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating src/Makefile
config.status: creating config.h
config.status: executing depfiles commands
configure: WARNING: unrecognized options: --enable-shared,
--disable-static, --disable-gtk-doc, --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop

   lzop configuration summary
   --------------------------
   lzop version               : 1.03
   configured for host        : x86_64-unknown-linux-gnu
   source code location       : .
   compiler                   : /usr/bin/gcc
   preprocessor flags         :
   -I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
   -DLZOP_HAVE_CONFIG_H compiler flags             : -O2
   -I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
   linker flags               :
   -L<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/lib>
   -L<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib>
   -Wl,-rpath,<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib>
   link libraries             : -llzo2 


   lzop 1.03 configured.

   Copyright (C) 1996-2010 Markus Franz Xaver Johannes Oberhumer
   All Rights Reserved.

   lzop and the LZO library are free software; you can redistribute them
   and/or modify them under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2 of
   the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   Markus F.X.J. Oberhumer
   <markus@oberhumer.com>
   http://www.oberhumer.com/opensource/lzop/


Type `make' to build lzop. Type `make install' to install lzop.
After installing lzop, please read the accompanied documentation.

>>> host-lzop 1.03 Building
PATH="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/bin>:<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/sbin>:<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin>:<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/sbin>:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
LD_LIBRARY_PATH="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib>:"
PKG_CONFIG="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin/pkg-config">
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib/pkgconfig">  /usr/bin/make
-j6  -C
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/>
make[1]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'> /usr/bin/make
all-recursive make[2]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
Making all in src make[3]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/src'> /usr/bin/gcc
-DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT lzop.o -MD -MP -MF .deps/lzop.Tpo -c -o lzop.o lzop.c /usr/bin/gcc
-DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT compress.o -MD -MP -MF .deps/compress.Tpo -c -o compress.o
compress.c /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT filter.o -MD -MP -MF .deps/filter.Tpo -c -o filter.o
filter.c /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT help.o -MD -MP -MF .deps/help.Tpo -c -o help.o help.c /usr/bin/gcc
-DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT mblock.o -MD -MP -MF .deps/mblock.Tpo -c -o mblock.o
mblock.c /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT p_lzo.o -MD -MP -MF .deps/p_lzo.Tpo -c -o p_lzo.o p_lzo.c mv
-f .deps/help.Tpo .deps/help.Po /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT util.o -MD -MP -MF .deps/util.Tpo -c -o util.o util.c mv
-f .deps/mblock.Tpo .deps/mblock.Po /usr/bin/gcc -DHAVE_CONFIG_H -I.
-I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT c_init.o -MD -MP -MF .deps/c_init.Tpo -c -o c_init.o c_init.c mv
-f .deps/compress.Tpo .deps/compress.Po mv
-f .deps/filter.Tpo .deps/filter.Po /usr/bin/gcc -DHAVE_CONFIG_H -I.
-I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT c_none.o -MD -MP -MF .deps/c_none.Tpo -c -o c_none.o
c_none.c /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT c_ansim.o -MD -MP -MF .deps/c_ansim.Tpo -c -o c_ansim.o c_ansim.c
mv -f .deps/p_lzo.Tpo .deps/p_lzo.Po /usr/bin/gcc -DHAVE_CONFIG_H -I.
-I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT c_ansic.o -MD -MP -MF .deps/c_ansic.Tpo -c -o c_ansic.o c_ansic.c
mv -f .deps/c_init.Tpo .deps/c_init.Po /usr/bin/gcc -DHAVE_CONFIG_H -I.
-I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT c_screen.o -MD -MP -MF .deps/c_screen.Tpo -c -o c_screen.o
c_screen.c mv -f .deps/c_none.Tpo .deps/c_none.Po mv
-f .deps/c_ansim.Tpo .deps/c_ansim.Po /usr/bin/gcc -DHAVE_CONFIG_H -I.
-I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT s_object.o -MD -MP -MF .deps/s_object.Tpo -c -o s_object.o
s_object.c /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT s_curses.o -MD -MP -MF .deps/s_curses.Tpo -c -o s_curses.o
s_curses.c mv -f .deps/c_ansic.Tpo .deps/c_ansic.Po mv
-f .deps/c_screen.Tpo .deps/c_screen.Po /usr/bin/gcc -DHAVE_CONFIG_H
-I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT s_djgpp2.o -MD -MP -MF .deps/s_djgpp2.Tpo -c -o s_djgpp2.o
s_djgpp2.c /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT s_vcsa.o -MD -MP -MF .deps/s_vcsa.Tpo -c -o s_vcsa.o s_vcsa.c mv
-f .deps/s_object.Tpo .deps/s_object.Po /usr/bin/gcc -DHAVE_CONFIG_H
-I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT frames.o -MD -MP -MF .deps/frames.Tpo -c -o frames.o frames.c mv
-f .deps/s_curses.Tpo .deps/s_curses.Po /usr/bin/gcc -DHAVE_CONFIG_H
-I. -I..
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-DLZOP_HAVE_CONFIG_H  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-MT djgpp2.o -MD -MP -MF .deps/djgpp2.Tpo -c -o djgpp2.o djgpp2.c mv
-f .deps/s_djgpp2.Tpo .deps/s_djgpp2.Po mv
-f .deps/s_vcsa.Tpo .deps/s_vcsa.Po mv
-f .deps/frames.Tpo .deps/frames.Po mv
-f .deps/djgpp2.Tpo .deps/djgpp2.Po mv -f .deps/util.Tpo .deps/util.Po
mv -f .deps/lzop.Tpo .deps/lzop.Po /usr/bin/gcc  -O2
-I<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/include>
-L<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/lib>
-L<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib>
-Wl,-rpath,<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib>
-o lzop lzop.o compress.o filter.o help.o mblock.o p_lzo.o util.o
c_init.o c_none.o c_ansim.o c_ansic.o c_screen.o s_object.o s_curses.o
s_djgpp2.o s_vcsa.o frames.o djgpp2.o  -llzo2 make[3]: Leaving
directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/src'>
Making all in doc make[3]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'> /usr/bin/make
all-am make[4]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[4]: Nothing to be done for `all-am'. make[4]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[3]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[3]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[3]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[2]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[1]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
>>> host-lzop 1.03 Installing to host directory
PATH="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/bin>:<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/sbin>:<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin>:<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/sbin>:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
LD_LIBRARY_PATH="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib>:"
PKG_CONFIG="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin/pkg-config">
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/lib/pkgconfig">  /usr/bin/make
-j6 install -C
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/>
make[1]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
Making install in src make[2]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/src'>
make[3]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/src'>
make[3]: Nothing to be done for `install-data-am'. test -z
"<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin">
|| /bin/mkdir -p
"<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin"> /usr/bin/install
-c lzop
'<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/bin'>
make[3]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/src'>
make[2]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/src'>
Making install in doc make[2]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'> /usr/bin/make
install-am make[3]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[4]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[4]: Nothing to be done for `install-exec-am'. test -z
"<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/share/man/man1">
|| /bin/mkdir -p
"<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/share/man/man1"> /usr/bin/install
-c -m 644 lzop.1
'<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/host/usr/share/man/man1'>
make[4]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[3]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[2]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03/doc'>
make[2]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[3]: Entering directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[3]: Nothing to be done for `install-exec-am'. make[3]: Nothing to
be done for `install-data-am'. make[3]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[2]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
make[1]: Leaving directory
`<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/host-lzop-1.03'>
>>> linux 0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b Downloading
Doing full clone
Cloning into bare repository
'linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b.tmp-git-checkout'...
>>> linux 0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b Extracting
gzip -d
-c /home/jenkins/buildroot-dl/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b.tar.gz
| tar --strip-components=1 -C
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b>
-xf -
>>> linux 0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b Patching
for p in  ; do if echo $p | grep -q -E "^ftp://|^http://" ; then
support/scripts/apply-patches.sh
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b> /home/jenkins/buildroot-dl
`basename $p` ; elif test -d $p ; then support/scripts/apply-patches.sh
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b>
$p linux-\*.patch ; else support/scripts/apply-patches.sh
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b>
`dirname $p` `basename $p` ; fi done
>>> linux 0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b Configuring
/usr/bin/install -m 0644
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b/arch/arm/configs/bcmrpi_quick_defconfig>
<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b/arch/arm/configs/buildroot_defconfig> /usr/bin/install:
cannot stat
'<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b/arch/arm/configs/bcmrpi_quick_defconfig'>:
No such file or directory make: ***
[<http://jenkins.free-electrons.com/job/buildroot/./config=raspberrypi_defconfig/ws/output/build/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b/.stamp_configured]>
Error 1 Build step 'Execute shell' marked build as failure


-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
