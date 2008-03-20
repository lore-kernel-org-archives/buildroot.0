From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Mar 2008 16:02:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080320230241.891D23C31E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-20 16:02:41 -0700 (Thu, 20 Mar 2008)
New Revision: 21422

Log:
Use correct symbold for linux config path

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-20 22:31:50 UTC (rev 21421)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-20 23:02:41 UTC (rev 21422)
@@ -91,7 +91,7 @@
 ifeq ($(BR2_i386),y)
 LINUX26_KCONFIG:=$(BOARD_PATH)/linux26.config
 else
-LINUX26_KCONFIG:=$(BR2_BOARD_PATH)/linux-$(LINUX26_VERSION).config
+LINUX26_KCONFIG:=$(BOARD_PATH)/linux-$(LINUX26_VERSION).config
 endif
 endif
 endif
