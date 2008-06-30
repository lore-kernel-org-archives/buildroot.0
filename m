From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 06:20:46 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080630132046.55E8B3C68E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 06:18:32 -0700 (Mon, 30 Jun 2008)
New Revision: 22572

Log:
xserver-xorg: select dbus

xserver-xorg had dbus in it's dependencies, but didn't select it in kconfig.


Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2008-06-30 13:16:18 UTC (rev 22571)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2008-06-30 13:18:32 UTC (rev 22572)
@@ -10,6 +10,7 @@
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
