From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  8 Jul 2008 03:53:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080708105318.380833C6D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-08 03:53:17 -0700 (Tue, 08 Jul 2008)
New Revision: 22689

Log:
uboot: revert r22638

Go back to 1.3.2 as r22638 breaks mkimage

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-07-08 10:37:05 UTC (rev 22688)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-07-08 10:53:17 UTC (rev 22689)
@@ -3,7 +3,7 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=1.3.3
+U_BOOT_VERSION:=1.3.2
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
