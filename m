From: mahendra varman <mahendravarman15@gmail.com>
Date: Tue, 4 Dec 2007 13:07:25 +0530
Subject: [Buildroot] libgmp not found
Message-ID: <4ac2955e0712032337x7631d0bcw43d36a4e67922503@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
Iam using buildroot latest snapshot to build a file system for powerpc
74xx processor
iam getting the following error*

checking for working alloca.h... yes
*>*checking for alloca... yes
*>*checking for __gmpz_init in -lgmp... no
*>*configure: error: libgmp not found
*>*make: *** [/home/varma/buildroot/build_powerpc/mpfr-2.3.0/.configured]
*>*Error 1

*if i run   ./configure
--with-gmp-lib=/home/varma/buildroot/toolchain_build_powerpc/gmp/lib/
--with-gmp-include=/home/varma/buildroot/toolchain_build_powerpc/gmp/include/
--with-gmp-build=/home/varma/buildroot/toolchain_buil
under mpfr 2.3.0 iam getting these warnings

*checking for alloca... yes
checking for __gmpz_init in -lgmp... yes
checking if gmp.h version and libgmp version are the same... (4.2.2/4.1.4) no
configure: WARNING: 'gmp.h' and 'libgmp' seems to have different versions or
configure: WARNING: we cannot run a program linked with GMP (if you cannot
configure: WARNING: see the version numbers above).
configure: WARNING: However since we can't use 'libtool' inside the configure,
configure: WARNING: we can't be sure. See 'config.log' for details.
configure: creating ./config.status
config.status: creating Makefile
config.status: creating tests/Makefile
config.status: creating mparam.h
config.status: executing depfiles commands

**Help me to solve this issue

Thanks


*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071204/fdab238e/attachment.htm 
