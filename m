From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  7 Feb 2009 06:57:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090207065737.A0C1376275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-07 06:57:37 +0000 (Sat, 07 Feb 2009)
New Revision: 25260

Log:
u-boot: remove commented out line

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-02-07 06:57:29 UTC (rev 25259)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-02-07 06:57:37 UTC (rev 25260)
@@ -22,7 +22,6 @@
 U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
 U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
-#U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN)
 
 ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
 #"))
