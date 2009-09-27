From: Marc Wetzel <mwse@gmx.de>
Date: Sun, 27 Sep 2009 18:47:45 +0200
Subject: [Buildroot] Problem building for ARM/arm926
Message-ID: <4ABF9731.4060000@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tested both the latest stable and the latest /daily snapshot/ of 
buildroot on a Virtualbox-Debian_V5.03
but I cannot build for the ARM platform.

Building for i386/686 works fine.

Here are the last lines of the make-output:

In file included from 
/home/marc/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include/errno.h:36,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3/libgcc/../gcc/tsystem.h:96,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3/libgcc/../gcc/libgcc2.c:33:
/home/marc/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include/bits/errno.h:25:26: 
error: linux/errno.h: No such file or directory
In file included from 
/home/marc/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include/bits/posix1_lim.h:153,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include/limits.h:144,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3-initial/./gcc/include-fixed/limits.h:122,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3-initial/./gcc/include-fixed/syslimits.h:7,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3-initial/./gcc/include-fixed/limits.h:11,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3/libgcc/../gcc/tsystem.h:108,
                 from 
/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3/libgcc/../gcc/libgcc2.c:33:
/home/marc/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include/bits/local_lim.h:36:26: 
error: linux/limits.h: No such file or directory
make[2]: *** [_muldi3.o] Fehler 1
make[2]: Leaving directory 
`/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3-initial/arm-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Fehler 2
make[1]: Leaving directory 
`/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3-initial'
make: *** 
[/home/marc/buildroot/buildroot/output/toolchain/gcc-4.3.3-initial/.compiled] 
Fehler 2


What is going wrong here?

TIA
Marc
