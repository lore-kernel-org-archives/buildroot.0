From: theHog <lists@t3i.nl>
Date: Fri, 12 Dec 2008 02:07:15 +0100
Subject: [Buildroot] error: sysdep-cancel.h: No such file or directory
Message-ID: <20081212020715.bljz08hhc0oswo04@webmail.dds.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just tried to build a rootfs for and arm architecture using buildroot
(latest svn). I left most options alone, except for the architecture
(=arm926t), target ABI (=EABI) and thread library implementation (=nptl).

I get the following error:

CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS  
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS] Error 1
make[1]: Leaving directory  
`/home/eddy/work/buildroot/toolchain_build_arm/uClibc-0.9.30'
make: ***
[/home/eddy/work/buildroot/toolchain_build_arm/uClibc-0.9.30/lib/libc.a] Error  
2

What is wrong here? I tried a previous version of uClibc (0.9.29) and
linuxthreads instead of nptl but that does not make a difference.

Thanks,
theHog
