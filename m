From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 15:01:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers:
	ipmi
Message-ID: <20070819220128.1725DA6108@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 15:01:27 -0700 (Sun, 19 Aug 2007)
New Revision: 19576

Log:
Make ipmi kernelpatch selectable, add possibility for custom kernel patch

Added:
   trunk/buildroot/toolchain/kernel-headers/ipmi/
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.20.4-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.21.5-007-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/ipmi/linux-2.6.22.1-007-ipmisensors-20070314-1214.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.20.4-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-007-ipmisensors-20070314-1214.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-007-ipmisensors-20070314-1214.patch

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile


Changeset:

Sorry, the patch is too large to include (11628 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19576
