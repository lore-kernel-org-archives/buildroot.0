From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 26 Dec 2008 15:36:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20081226153609.9490576F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-26 15:36:09 +0000 (Fri, 26 Dec 2008)
New Revision: 24552

Log:
libgtk2: remove unneeded configure opts

This stuff is all handled by Makefile.autotools.in

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-12-26 15:36:03 UTC (rev 24551)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-12-26 15:36:09 UTC (rev 24552)
@@ -70,21 +70,7 @@
 		ac_cv_prog_F77=no \
 		ac_cv_path_CUPS_CONFIG=no
 
-LIBGTK2_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shared \
+LIBGTK2_CONF_OPT = --enable-shared \
 		--enable-static \
 		--disable-glibtest \
 		--enable-explicit-deps=no \
