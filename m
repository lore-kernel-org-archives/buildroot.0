From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Jun 2007 04:26:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/gmp
	package/mdadm packa etc...
Message-ID: <20070620112638.5E43A48593@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-20 04:26:36 -0700 (Wed, 20 Jun 2007)
New Revision: 18864

Log:
- add full sysroot support for non-ancient toolchains.
- start to separate usr/lib and lib to match normal system-layout


Added:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mdadm/mdadm.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/Makefile.in
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/sstrip/sstrip.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (1462 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=18864
