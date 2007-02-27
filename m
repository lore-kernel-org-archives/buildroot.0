From: James Newell <jnewell@wgate.com>
Date: Tue, 27 Feb 2007 11:36:07 -0500
Subject: [Buildroot] Native POSIX Threading (NPTL)
Message-ID: <1172594168.2813.6.camel@ndragon.eng.wgate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The latest snapshot of uclibc seems to have removed NPTL support for
arm.

 CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.os
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory
make: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.os] Error 1

There isn't
any ./uClibc/libpthread/linuxthreads/sysdeps/unix/sysv/linux/arm
directory containing the needed arm implementation therefore the
sysdep-cancel.h is missing.

Has anyone else experienced this?

Thanks,
Jim
