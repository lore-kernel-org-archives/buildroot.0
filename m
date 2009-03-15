From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Mar 2009 07:28:13 +0000 (UTC)
Subject: [Buildroot] svn commit: [25661]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090315072813.581D876419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-15 07:28:12 +0000 (Sun, 15 Mar 2009)
New Revision: 25661

Log:
xserver: 1.5.x needs openssl (for render sha functions)

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-15 07:28:06 UTC (rev 25660)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-15 07:28:12 UTC (rev 25661)
@@ -3,6 +3,7 @@
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXKBUI
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
 	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	select BR2_PACKAGE_XPROTO_FIXESPROTO
