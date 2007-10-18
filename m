From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 18 Oct 2007 05:37:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20071018123709.094DEA6836@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-18 05:37:09 -0700 (Thu, 18 Oct 2007)
New Revision: 20285

Log:
Add more info to linux status

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2007-10-18 11:58:47 UTC (rev 20284)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2007-10-18 12:37:09 UTC (rev 20285)
@@ -414,6 +414,7 @@
 	@echo LINUX26_BINLOC=$(LINUX26_BINLOC)
 	@echo LINUX26_FORMAT=$(LINUX26_FORMAT)
 	@echo LINUX26_KERNEL=$(LINUX26_KERNEL)
+	@echo LINUX26_KERNEL_NAME=$(LINUX26_KERNEL_NAME)
 	@echo BR2_KERNEL_SITE=$(BR2_KERNEL_SITE)
 	@echo BR2_KERNEL_PATCH_SITE=$(BR2_KERNEL_PATCH_SITE)
 	@echo BR2_KERNEL_PATCH=$(BR2_KERNEL_PATCH)
@@ -436,6 +437,6 @@
 	@echo BR2_KERNEL_MM_LEVEL=$(BR2_KERNEL_MM_LEVEL)
 	@echo LINUX26_LATEST_GIT_PATCH=$(LINUX26_LATEST_GIT_PATCH)
 	@echo BR2_KERNEL_GIT_LEVEL=$(BR2_KERNEL_GIT_LEVEL)
+	@echo KERNEL_EXT=$(KERNEL_EXT)
 
-
 endif
