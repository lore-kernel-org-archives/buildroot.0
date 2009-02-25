From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 14:26:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/kernel-headers to etc...
Message-ID: <20090225142608.1E1C57669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-25 14:26:03 +0000 (Wed, 25 Feb 2009)
New Revision: 25451

Log:
kernel-headers: remove 2.6.20-22 variants and outdated impi/lzma patches

Removed:
   trunk/buildroot/toolchain/kernel-headers/empty/.empty
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.20.4-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.21.5-007-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.22.1-007-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.22.9-007-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.21.5-001-lzma-vmlinuz.00.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.21.5-002-lzma-vmlinuz.01.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-001-lzma-vmlinuz.00.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-002-lzma-vmlinuz.01.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch

Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/target/linux/Makefile.in.advanced
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:

Sorry, the patch is too large to include (61865 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25451
