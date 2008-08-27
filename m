From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7
Message-ID: <20080827201912.D270CF8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:12 -0700 (Wed, 27 Aug 2008)
New Revision: 23257

Log:
x11r7: fix long help text lines

Modified:
   trunk/buildroot/package/x11r7/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/Config.in	2008-08-27 20:19:09 UTC (rev 23256)
+++ trunk/buildroot/package/x11r7/Config.in	2008-08-27 20:19:12 UTC (rev 23257)
@@ -7,7 +7,9 @@
 select BR2_PACKAGE_FONTCONFIG
 select BR2_PACKAGE_PKGCONFIG
 help
-	Support for X11R7 libraries, servers, drivers, and/or applications in the target
+	Support for X11R7 libraries, servers, drivers, and/or
+	applications in the target.
+
 if BR2_PACKAGE_XORG7
 	menu "X11R7 Servers"
 		source package/x11r7/xserver_xorg-server/Config.in
