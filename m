From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 04:03:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070720110320.D4FC7A5E15@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 04:03:20 -0700 (Fri, 20 Jul 2007)
New Revision: 19175

Log:
Cleanup of Atmel Makefile.in

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-20 10:49:46 UTC (rev 19174)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-20 11:03:20 UTC (rev 19175)
@@ -19,7 +19,7 @@
 LINUX_BSP_PATCH:=$(strip  $(subst ",, $(BR2_LINUX_BSP_ATMEL_PATCH)))
 
 # These are set by "new" Config.in
-LINUX26_KCONFIG:=$(strip  $(subst ",, $(BR2_BOARD_PATH)/$(BOARD_NAME)-linux-$(DOWNLOAD_LINUX26_VERSION).config))
+LINUX26_KCONFIG:=$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config
 
 # This should be part of target/linux/Makefile.in
 LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
