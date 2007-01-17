From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 16 Jan 2007 16:04:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20070117000422.7B90C48566@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-16 16:04:21 -0800 (Tue, 16 Jan 2007)
New Revision: 17331

Log:
select XORG rather than depend on it.


Modified:
   trunk/buildroot/package/libgtk2/Config.in


Changeset:
Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2007-01-16 21:00:54 UTC (rev 17330)
+++ trunk/buildroot/package/libgtk2/Config.in	2007-01-17 00:04:21 UTC (rev 17331)
@@ -7,7 +7,7 @@
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_PNG
-	depends BR2_PACKAGE_XORG
+	select BR2_PACKAGE_XORG
 	help
 	  The GTK+ version 2 graphical user interface library
 
