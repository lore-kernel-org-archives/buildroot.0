From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 00:46:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20081208084650.7B2CC3C685@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 00:46:50 -0800 (Mon, 08 Dec 2008)
New Revision: 24311

Log:
toolchain/gdb: default to 6.8

Modified:
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2008-12-08 08:15:58 UTC (rev 24310)
+++ trunk/buildroot/toolchain/gdb/Config.in	2008-12-08 08:46:50 UTC (rev 24311)
@@ -19,7 +19,7 @@
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_6 if !BR2_avr32
+	default BR2_GDB_VERSION_6_8 if !BR2_avr32
 	default BR2_GDB_VERSION_6_7_1 if BR2_avr32
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
