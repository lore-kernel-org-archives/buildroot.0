From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Sep 2007 05:43:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20070917124340.9C82530067@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-17 05:43:40 -0700 (Mon, 17 Sep 2007)
New Revision: 19870

Log:
Add debug info

Modified:
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2007-09-17 12:42:56 UTC (rev 19869)
+++ trunk/buildroot/project/Makefile.in	2007-09-17 12:43:40 UTC (rev 19870)
@@ -73,3 +73,11 @@
 VENDOR_PATCH_DIR:=$(strip $(subst ",,$(BR2_VENDOR_PATCH_DIR)))
 #"))
 
+vendor-dbg:
+	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)
+	@echo VENDOR_SUFFIX=$(BR2_VENDOR_SUFFIX)
+	@echo VENDOR_BINUTILS_RELEASE=$(BR2_VENDOR_BINUTILS_RELEASE)
+	@echo VENDOR_GCC_RELEASE=$(BR2_VENDOR_GCC_RELEASE)
+	@echo VENDOR_UCLIBC_RELEASE=$(BR2_VENDOR_UCLIBC_RELEASE)
+	@echo VENDOR_GDB_RELEASE=$(BR2_VENDOR_GDB_RELEASE)
+	@echo VENDOR_PATCH_DIR=$(BR2_VENDOR_PATCH_DIR)
