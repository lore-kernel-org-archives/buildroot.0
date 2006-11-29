From: Doug Brewer <brewer.doug@gmail.com>
Date: Wed, 29 Nov 2006 13:11:12 +0800
Subject: [Buildroot] Built mipsel cross-compiler error on buildroot
Message-ID: <b2ec5cad0611282111tabfe302ve509e5c15b859048@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried to use buildroot snpashots(20061128) to build mipsel cross-compiler,
I got the following errors;

...
 /home/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.2-initial/gcc/xgcc
-B/home
/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.2-initial/gcc/ -B/home/brewer/b
uildroot/build_mipsel/staging_dir/mipsel-linux-uclibc/bin/ -B/home/brewer/buildr
oot/build_mipsel/staging_dir/mipsel-linux-uclibc/lib/ -isystem /home/brewer/buil
droot/build_mipsel/staging_dir/mipsel-linux-uclibc/include -isystem /home/brewer
/buildroot/build_mipsel/staging_dir/mipsel-linux-uclibc/sys-include -O2  -DIN_GC
C -DCROSS_COMPILE  -DUSE_UCLIBC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wm
issing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g -DHAVE_GT
HR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I. -I/home/brewer/buildro
ot/toolchain_build_mipsel/gcc-3.4.2/gcc -I/home/brewer/buildroot/toolchain_build
_mipsel/gcc-3.4.2/gcc/. -I/home/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.
2/gcc/../include   -DL_muldi3 -c /home/brewer/buildroot/toolchain_build_mipsel/g
cc-3.4.2/gcc/libgcc2.c -o libgcc/./_muldi3.o
In file included from /home/brewer/buildroot/toolchain_build_mipsel/uClibc_dev//
usr/include/bits/sigcontext.h:28,
                 from /home/brewer/buildroot/toolchain_build_mipsel/uClibc_dev//
usr/include/signal.h:332,
                 from /home/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.2/gc
c/config/mips/linux.h:202,
                 from ./tm.h:13,
                 from /home/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.2/gc
c/libgcc2.c:43:
/home/brewer/buildroot/toolchain_build_mipsel/uClibc_dev//usr/include/asm/sigcon
text.h:12:25: asm/sgidefs.h: No such file or directory
In file included from ./tm.h:13,
                 from /home/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.2/gc
c/libgcc2.c:43:
/home/brewer/buildroot/toolchain_build_mipsel/gcc-3.4.2/gcc/config/mips/linux.h:
211: error: field `uc_mcontext' has incomplete type
make[3]: *** [libgcc/./_muldi3.o] Error 1
make[3]: Leaving directory `/home/brewer/buildroot/toolchain_build_mipsel/gcc-3.
4.2-initial/gcc'

Would you tell me how to fix? Thank you very much.

Warm regards,
Doug.
