From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:34:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20070729173421.10B90A4640@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:34:20 -0700 (Sun, 29 Jul 2007)
New Revision: 19329

Log:
gdb config for AVR32

Modified:
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2007-07-29 17:32:21 UTC (rev 19328)
+++ trunk/buildroot/toolchain/gdb/Config.in	2007-07-29 17:34:20 UTC (rev 19329)
@@ -29,21 +29,26 @@
 
 	config BR2_GDB_VERSION_6_2_1
 		bool "gdb 6.2.1"
+		depends on !BR2_avr32
 
 	config BR2_GDB_VERSION_6_3
 		bool "gdb 6.3"
+		depends on !BR2_avr32
 
 	config BR2_GDB_VERSION_6_4
 		bool "gdb 6.4"
 
 	config BR2_GDB_VERSION_6_5
 		bool "gdb 6.5"
+		depends on !BR2_avr32
 
 	config BR2_GDB_VERSION_6_6
 		bool "gdb 6.6"
+		depends on !BR2_avr32
 
 	config BR2_GDB_VERSION_SNAPSHOT
 		bool "gdb snapshot"
+		depends on !BR2_avr32
 
 endchoice
 
