From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 18:46:01 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090122184602.1FC7976850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 18:46:00 +0000 (Thu, 22 Jan 2009)
New Revision: 24969

Log:
Use latest u-boot as default

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-22 16:04:28 UTC (rev 24968)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-22 18:46:00 UTC (rev 24969)
@@ -13,7 +13,7 @@
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2008_10
+	default BR2_TARGET_UBOOT_2009_01
 	help
 	  Select the specific U-Boot version you want to use
 
