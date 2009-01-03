From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat,  3 Jan 2009 15:03:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090103150316.C327A76BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-03 15:03:16 +0000 (Sat, 03 Jan 2009)
New Revision: 24671

Log:
Fixed missing "


Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-03 14:43:18 UTC (rev 24670)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-03 15:03:16 UTC (rev 24671)
@@ -67,7 +67,7 @@
 	depends on BR2_BOOTSOURCE_DATAFLASHCARD
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	bool "Boot from dataflash
+	bool "Boot from dataflash"
 	depends on BR2_BOOTSOURCE_DATAFLASH
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH
