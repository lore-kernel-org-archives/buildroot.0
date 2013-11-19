From: Altunbas Sabri (DC-IA/EAH2) <sabri.altunbas@boschrexroth.de>
Date: Tue, 19 Nov 2013 13:17:53 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <CAAXf6LUiwy9Fmm5sNBTc3H4XvpsDhmRNeYj6in=HiZsepQ8xRQ@mail.gmail.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
 <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
 <CAAXf6LV9Wzjr1P+n-Mxw8FqnqsAdOMr3Wfaam48uHQPcVxu73A@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C3BA@SI-MBX04.de.bosch.com>
 <CAAXf6LUiwy9Fmm5sNBTc3H4XvpsDhmRNeYj6in=HiZsepQ8xRQ@mail.gmail.com>
Message-ID: <EADA2943BAC14C4AB625A3550A3BE980096DFE7183@SI-MBX04.de.bosch.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

my problem is still not solved.

I picked "Buildroot toolchain" and "eglibc" as C-library and get the following error
..
configure: error: unrecognized option: `-mfmovd'
..
With "uclibs" the same behave.

My config is attented

Can you give some hints ?

Command line output:
--------------------------------

...
...
(cd /home/tux/aaa/buildroot/sh/output/build/host-gcc-initial-4.7.3/build && rm -rf config.cache; PATH=/home/tux/aaa/buildroot/sh/output/../../../tc/sh/bin:/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" CPPFLAGS="-I/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/include" CFLAGS="-O2 -I/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/include" CXXFLAGS="-O2 -I/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/include" LDFLAGS="-L/home/tux/aaa/buildroot/sh/output/../../../tc/sh/lib -L/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib -Wl,-rpath,/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG="/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib/pkgconfig:/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/share/pkgconfig" PERLLIB="/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib/perl" LD_LIBRARY_PATH="/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib:" CFLAGS="-O2 -I/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/include" LDFLAGS="-L/home/tux/aaa/buildroot/sh/output/../../../tc/sh/lib -L/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib -Wl,-rpath,/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/lib"  ./configure --prefix="/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr" --sysconfdir="/home/tux/aaa/buildroot/sh/output/../../../tc/sh/etc" --enable-shared --disable-static --disable-gtk-doc --disable-doc --disable-docs --disable-documentation --with-xmlto=no --with-fop=no  --target=sh4a-buildroot-linux-gnu --with-sysroot=/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr/sh4a-buildroot-linux-gnu/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr --with-mpfr=/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr  --enable-target-optspace --disable-libquadmath --enable-tls --enable-threads --with-mpc=/home/tux/aaa/buildroot/sh/output/../../../tc/sh/usr --disable-decimal-float --with-pkgversion="Buildroot 2013.08.1" --with-bugurl="http://bugs.buildroot.net/" --enable-languages=c --disable-shared --without-headers --with-newlib --disable-largefile --disable-nls -mfmovd -mdalign )
configure: error: unrecognized option: `-mfmovd'
Try `./configure --help' for more information.
make: *** [/home/tux/aaa/buildroot/sh/output/build/host-gcc-initial-4.7.3/.stamp_configured] Error 1
tux at lmde ~/aaa/buildroot/sh $

Best regards,
Sabri

-------------- next part --------------
A non-text attachment was scrubbed...
Name: ATT73696.config
Type: application/octet-stream
Size: 31578 bytes
Desc: ATT73696.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131119/a74b0045/attachment-0001.obj>
