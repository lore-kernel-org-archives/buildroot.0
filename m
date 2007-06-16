From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 16 Jun 2007 10:55:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20070616175506.15F0D485EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-06-16 10:55:05 -0700 (Sat, 16 Jun 2007)
New Revision: 18833

Log:
Please make sure to update this file as well for new versions of GDB.


Modified:
   trunk/buildroot/toolchain/gdb/Config.in.2


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in.2	2007-06-16 17:54:38 UTC (rev 18832)
+++ trunk/buildroot/toolchain/gdb/Config.in.2	2007-06-16 17:55:05 UTC (rev 18833)
@@ -52,4 +52,5 @@
 	default "6.3"      if BR2_EXT_GDB_VERSION_6_3
 	default "6.4"      if BR2_EXT_GDB_VERSION_6_4
 	default "6.5"      if BR2_EXT_GDB_VERSION_6_5
+	default "6.6"      if BR2_EXT_GDB_VERSION_6_6
 	default "snapshot" if BR2_EXT_GDB_VERSION_SNAPSHOT
