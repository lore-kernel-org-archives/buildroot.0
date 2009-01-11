From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:39:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090111213956.5713C76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:39:54 +0000 (Sun, 11 Jan 2009)
New Revision: 24770

Log:
Remove premature deprecation of u-boot-1.2.0-atmel

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-11 21:15:46 UTC (rev 24769)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-11 21:39:54 UTC (rev 24770)
@@ -30,7 +30,6 @@
 config BR2_TARGET_UBOOT_1_2_0_ATMEL
 	bool "u-boot-1.2.0-atmel"
 	depends on BR2_TARGET_AT91
-	depends on BR2_DEPRECATED
 
 #config BR2_TARGET_UBOOT_2009_01
 #	bool "u-boot-2009.01"
