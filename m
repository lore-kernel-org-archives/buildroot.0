From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 11 Dec 2006 23:10:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device/AMD/DBAu1500
	target/device etc...
Message-ID: <20061212071055.DC96B48591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-11 23:10:54 -0800 (Mon, 11 Dec 2006)
New Revision: 16849

Log:
update uClibc config settings and update installation of kernel headers


Added:
   trunk/buildroot/toolchain/uClibc/fix_includes-uClibc-0.9.28.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config

Removed:
   trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mips
   trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mipsel
   trunk/buildroot/target/device/x86/i386/uClibc.config.i586
   trunk/buildroot/toolchain/uClibc/uClibc.config

Modified:
   trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in
   trunk/buildroot/target/device/x86/i386/Makefile.in
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:

Sorry, the patch is too large to include (1415 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=16849
