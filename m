From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 07:43:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/autoconf
	package/automa etc...
Message-ID: <20061117154355.C8692485FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 07:43:51 -0800 (Fri, 17 Nov 2006)
New Revision: 16565

Log:
- add and use BR2_BZCAT config option.


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dillo/dillo.mk
   trunk/buildroot/package/distcc/distcc.mk
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/iptables/iptables.mk
   trunk/buildroot/package/libcgicc/libcgicc.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/lsof/lsof.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/make/make.mk
   trunk/buildroot/package/mdadm/mdadm.mk
   trunk/buildroot/package/microperl/microperl.mk
   trunk/buildroot/package/module-init-tools/module-init-tools.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/mpg123/mpg123.mk
   trunk/buildroot/package/mtd/mtd.mk
   trunk/buildroot/package/nbd/nbd.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/pciutils/pciutils.mk
   trunk/buildroot/package/portage/portage.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/sfdisk/sfdisk.mk
   trunk/buildroot/package/slang/slang.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/tinylogin/tinylogin.mk
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/uemacs/uemacs.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/package/zlib/zlib.mk
   trunk/buildroot/target/device/AMD/DBAu1500/linux.mk
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Soekris/net4801/linux.mk
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/x86/syslinux/syslinux.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (1445 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=16565
