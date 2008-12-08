From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 00:46:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20081208084653.7043E3C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 00:46:52 -0800 (Mon, 08 Dec 2008)
New Revision: 24312

Log:
toolchain/gdb: mark old versions as deprecated

Modified:
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2008-12-08 08:46:50 UTC (rev 24311)
+++ trunk/buildroot/toolchain/gdb/Config.in	2008-12-08 08:46:52 UTC (rev 24312)
@@ -28,22 +28,27 @@
 	config BR2_GDB_VERSION_6_2_1
 		bool "gdb 6.2.1"
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_3
 		bool "gdb 6.3"
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_4
 		bool "gdb 6.4"
 		depends on !BR2_nios2
+		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_5
 		bool "gdb 6.5"
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_6
 		bool "gdb 6.6"
 		depends on !BR2_avr32
+		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_7_1
 		bool "gdb 6.7.1"
