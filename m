From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 12:06:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080619190600.52A0E3C671@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-19 12:05:59 -0700 (Thu, 19 Jun 2008)
New Revision: 22452

Log:
toolchain/gcc: mark old versions as deprecated


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2008-06-19 08:11:51 UTC (rev 22451)
+++ trunk/buildroot/toolchain/gcc/Config.in	2008-06-19 19:05:59 UTC (rev 22452)
@@ -11,6 +11,7 @@
 
 	config BR2_GCC_VERSION_3_4_6
 		depends on !BR2_avr32
+		depends on BR2_DEPRECATED
 		bool "gcc 3.4.6"
 
 	config BR2_GCC_VERSION_4_0_4
@@ -30,6 +31,7 @@
 
 	config BR2_GCC_VERSION_4_2_3
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 		bool "gcc 4.2.3"
 
 	config BR2_GCC_VERSION_4_2_4
