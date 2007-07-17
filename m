From: Thempra <thempra@ieee.org>
Date: Tue, 17 Jul 2007 14:22:03 +0200
Subject: [Buildroot] Error in compilation
In-Reply-To: <b98765340707151312t4f998dd7r30417c09861b742e@mail.gmail.com>
References: <b98765340707151312t4f998dd7r30417c09861b742e@mail.gmail.com>
Message-ID: <b98765340707170522i4ae5eb2claca7c5011ef7008c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

  I'm try to compile Buildroot from SVN but I get this error:

In file included from libpthread/linuxthreads/sysdeps/pthread/errno-loc.c
:22:
./libpthread/linuxthreads/internals.h:538: warning: C99 inline functions are
not supported; using GNU89
libpthread/linuxthreads/sysdeps/pthread/errno- loc.c:23:27: error:
sysdep-cancel.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.os] Error 1
make[1]: se sale del directorio `/home/thempra/Desktop/linwizard-0.1.4
/buildroot/toolchain_build_arm/uClibc'
make: *** [/home/thempra/Desktop/linwizard-
0.1.4/buildroot/toolchain_build_arm/uClibc/lib/libc.a]
Error 2


What is my problem?? Thx.


Thempra
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070717/e9900ca0/attachment.htm 
