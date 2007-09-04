From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 09:21:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070904162122.66143A687A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 09:21:22 -0700 (Tue, 04 Sep 2007)
New Revision: 19779

Log:
Use default LINUX26_BINLOC for at91

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-09-04 16:20:28 UTC (rev 19778)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-09-04 16:21:22 UTC (rev 19779)
@@ -39,7 +39,7 @@
 # This should be part of target/linux/Makefile.in
 LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
 
-LINUX26_BINLOC=$(LINUX26_FORMAT)
+#LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
 
 LINUX26_COPYTO:=/tftpboot
