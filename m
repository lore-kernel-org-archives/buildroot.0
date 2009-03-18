From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:22:09 +0000 (UTC)
Subject: [Buildroot] svn commit: [25737] trunk/buildroot/package/cairo
Message-ID: <20090318212209.386317763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:22:08 +0000 (Wed, 18 Mar 2009)
New Revision: 25737

Log:
cairo: remove unneeded _INSTALL_STAGING_OPT setting

Modified:
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-18 21:22:04 UTC (rev 25736)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-18 21:22:08 UTC (rev 25737)
@@ -9,7 +9,6 @@
 CAIRO_AUTORECONF = NO
 CAIRO_INSTALL_STAGING = YES
 CAIRO_INSTALL_TARGET = YES
-CAIRO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 
 CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
