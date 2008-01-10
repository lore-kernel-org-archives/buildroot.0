From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jan 2008 01:31:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080110093116.0447F12C591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-01-10 01:31:15 -0800 (Thu, 10 Jan 2008)
New Revision: 20840

Log:
More debug info for linux

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-01-10 09:30:11 UTC (rev 20839)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-01-10 09:31:15 UTC (rev 20840)
@@ -411,6 +411,7 @@
 	@echo TARGETS=$(TARGETS)
 	@echo LINUX26_TARGETS=$(LINUX26_TARGETS)
 	@echo LINUX26_HEADERS_PATCH_DIR=$(LINUX26_HEADERS_PATCH_DIR)
+	@echo LINUX_HEADERS_VERSION=$(LINUX_HEADERS_VERSION)
 	@echo LINUX26_BINLOC=$(LINUX26_BINLOC)
 	@echo LINUX26_FORMAT=$(LINUX26_FORMAT)
 	@echo LINUX26_KERNEL=$(LINUX26_KERNEL)
