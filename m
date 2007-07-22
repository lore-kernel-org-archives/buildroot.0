From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun, 22 Jul 2007 13:09:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070722200955.BDC7BA6064@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-22 13:09:54 -0700 (Sun, 22 Jul 2007)
New Revision: 19195

Log:
No platform code in this file.


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-22 17:17:03 UTC (rev 19194)
+++ trunk/buildroot/package/Makefile.in	2007-07-22 20:09:54 UTC (rev 19195)
@@ -107,10 +107,6 @@
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 IMAGE:=$(BINARIES_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
 
-# ATMEL_MIRROR Needs to be available before toolchain is built
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
-#"))
-
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
