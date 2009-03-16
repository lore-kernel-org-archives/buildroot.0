From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:29 +0000 (UTC)
Subject: [Buildroot] svn commit: [25681]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090316154830.0C5FA7643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:29 +0000 (Mon, 16 Mar 2009)
New Revision: 25681

Log:
xserver-xorg: libXtst not needed

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-16 15:48:21 UTC (rev 25680)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-16 15:48:29 UTC (rev 25681)
@@ -24,7 +24,6 @@
 	select BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXRES
-	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXXF86MISC
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XLIB_LIBLBXUTIL

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:21 UTC (rev 25680)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:29 UTC (rev 25681)
@@ -17,7 +17,7 @@
 									xproto_glproto xproto_kbproto xproto_randrproto \
 									xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXScrnSaver \
 									xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm \
-									xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor \
+									xlib_libXrender xlib_libXres xlib_libXft xlib_libXcursor \
 									xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm \
 									xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto \
 									xproto_evieext xproto_fontsproto xproto_inputproto xproto_renderproto \
