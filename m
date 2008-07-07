From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  7 Jul 2008 04:09:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20080707110921.D22283C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-07 04:09:20 -0700 (Mon, 07 Jul 2008)
New Revision: 22671

Log:
Remove duplicated select LIBPNG and use alphabetical order for selects

Modified:
   trunk/buildroot/package/libgtk2/Config.in


Changeset:
Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2008-07-07 05:30:22 UTC (rev 22670)
+++ trunk/buildroot/package/libgtk2/Config.in	2008-07-07 11:09:20 UTC (rev 22671)
@@ -1,16 +1,15 @@
 config BR2_PACKAGE_LIBGTK2
 	bool "libgtk2"
 	default n
-	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_TIFF
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_CUPS
-	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_PKGCONFIG
+	select BR2_PACKAGE_TIFF
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
 	help
 	  The GTK+ version 2 graphical user interface library
