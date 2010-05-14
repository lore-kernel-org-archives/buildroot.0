From: Robert Urban <urban@unix-beratung.de>
Date: Fri, 14 May 2010 17:42:29 +0200
Subject: [Buildroot] netcat link error: could not read symbols: Bad value
Message-ID: <4BED6F65.8050603@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

can anyone help with this error.  My config can be found on:

	http://www.spielwiese.de/rob/Buildroot/config

buildroot was cloned yesterday.
build host is Fedora 11, x86_64

cheers,

Rob Urban

error:
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=i586 -march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include
-I/data/home/urban/Build/Buildroot/current/buildroot/output/staging/include
--sysroot=/data/home/urban/Build/Buildroot/current/buildroot/output/staging/
-isysroot /data/home/urban/Build/Buildroot/current/buildroot/output/staging  -Os
-pipe -Os  -mtune=i586 -march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include
-I/data/home/urban/Build/Buildroot/current/buildroot/output/staging/include
--sysroot=/data/home/urban/Build/Buildroot/current/buildroot/output/staging/
-isysroot /data/home/urban/Build/Buildroot/current/buildroot/output/staging
-Wall  -L/data/home/urban/Build/Buildroot/current/buildroot/output/staging/lib
-L/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/lib
--sysroot=/data/home/urban/Build/Buildroot/current/buildroot/output/staging/ -o
netcat  core.o flagset.o misc.o netcat.o network.o telnet.o udphelper.o
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/lib/libintl.so
/usr/lib/libc.so -Wl,-rpath
-Wl,/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/lib
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/bin/../lib/gcc/i586-unknown-linux-uclibc/4.3.4/../../../../i586-unknown-linux-uclibc/bin/ld:
errno@@GLIBC_PRIVATE: TLS definition in /lib/libc.so.6 section .tbss mismatches
non-TLS definition in
/data/home/urban/Build/Buildroot/current/buildroot/output/staging//lib//libc.so.0 section
.bss
/data/home/urban/Build/Buildroot/current/buildroot/output/staging//lib//libc.so.0:
could not read symbols: Bad value
