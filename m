From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 15:18:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080704221857.6ED043C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 15:18:56 -0700 (Fri, 04 Jul 2008)
New Revision: 22638

Log:
Bump U-Boot version to 1.3.3

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-07-04 21:58:00 UTC (rev 22637)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-07-04 22:18:56 UTC (rev 22638)
@@ -3,7 +3,7 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=1.3.2
+U_BOOT_VERSION:=1.3.3
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
