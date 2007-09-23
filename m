From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 15:08:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070923220852.E886030046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 15:08:51 -0700 (Sun, 23 Sep 2007)
New Revision: 19981

Log:
Remove useless target/arm directory

Removed:
   trunk/buildroot/target/arm/

Modified:
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-09-23 21:23:10 UTC (rev 19980)
+++ trunk/buildroot/target/Makefile.in	2007-09-23 22:08:51 UTC (rev 19981)
@@ -9,7 +9,6 @@
 # this eventually adds the kernel target to TARGETS:
 include target/device/Makefile.in
 include target/x86/Makefile.in
-include target/arm/Makefile.in
 include target/powerpc/Makefile.in
 # and finally build the filesystems/tarballs
 include target/*/*.mk
