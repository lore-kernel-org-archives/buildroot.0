From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Jan 2007 03:27:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20070117112715.4243A4858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-17 03:27:14 -0800 (Wed, 17 Jan 2007)
New Revision: 17334

Log:
PNG package is called BR2_PACKAGE_LIBPNG

Modified:
   trunk/buildroot/package/libgtk2/Config.in


Changeset:
Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2007-01-17 10:07:01 UTC (rev 17333)
+++ trunk/buildroot/package/libgtk2/Config.in	2007-01-17 11:27:14 UTC (rev 17334)
@@ -6,7 +6,7 @@
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_TIFF
-	select BR2_PACKAGE_PNG
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XORG
 	help
 	  The GTK+ version 2 graphical user interface library
