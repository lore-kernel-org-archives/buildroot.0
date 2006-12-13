From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 23:33:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20061213073308.947B248587@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 23:33:07 -0800 (Tue, 12 Dec 2006)
New Revision: 16876

Log:
don't enable gdb in the default config


Modified:
   trunk/buildroot/defconfig


Changeset:
Modified: trunk/buildroot/defconfig
===================================================================
--- trunk/buildroot/defconfig	2006-12-13 07:25:22 UTC (rev 16875)
+++ trunk/buildroot/defconfig	2006-12-13 07:33:07 UTC (rev 16876)
@@ -125,13 +125,7 @@
 #
 # BR2_PACKAGE_GDB is not set
 # BR2_PACKAGE_GDB_SERVER is not set
-BR2_PACKAGE_GDB_HOST=y
-# BR2_GDB_VERSION_6_2_1 is not set
-# BR2_GDB_VERSION_6_3 is not set
-# BR2_GDB_VERSION_6_4 is not set
-BR2_GDB_VERSION_6_5=y
-# BR2_GDB_VERSION_SNAPSHOT is not set
-BR2_GDB_VERSION="6.5"
+# BR2_PACKAGE_GDB_HOST is not set
 
 #
 # elf2flt
