From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 27 Aug 2008 04:40:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbdump
Message-ID: <20080827114003.31C683C758@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-27 04:40:02 -0700 (Wed, 27 Aug 2008)
New Revision: 23240

Log:
fbdump: Fix help text indentation and remove staging dir installation

Tidy up fbdump package.



Modified:
   trunk/buildroot/package/fbdump/Config.in
   trunk/buildroot/package/fbdump/fbdump.mk


Changeset:
Modified: trunk/buildroot/package/fbdump/Config.in
===================================================================
--- trunk/buildroot/package/fbdump/Config.in	2008-08-27 11:01:16 UTC (rev 23239)
+++ trunk/buildroot/package/fbdump/Config.in	2008-08-27 11:40:02 UTC (rev 23240)
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_FBDUMP
 	bool "fbdump (Framebuffer Capture Tool)"
 	help
-	   fbdump is a simple tool to capture snapshots from the Linux kernel framebuffer
-	   device and write them out as a PPM file. Currently, most packed-pixel framebuffer
-       formats and the vga16 framebuffer are supported.
+	  fbdump is a simple tool to capture snapshots from the Linux kernel
+	  framebuffer  device and write them out as a PPM file. Currently,
+	  most packed-pixel framebuffer formats and the vga16 framebuffer
+	  are supported.
 

Modified: trunk/buildroot/package/fbdump/fbdump.mk
===================================================================
--- trunk/buildroot/package/fbdump/fbdump.mk	2008-08-27 11:01:16 UTC (rev 23239)
+++ trunk/buildroot/package/fbdump/fbdump.mk	2008-08-27 11:40:02 UTC (rev 23240)
@@ -8,7 +8,6 @@
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_AUTORECONF = NO
 FBDUMP_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
-FBDUMP_INSTALL_STAGING = YES
 FBDUMP_INSTALL_TARGET = YES
 FBDUMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
