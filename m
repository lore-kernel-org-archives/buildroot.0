From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 04:46:51 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080701114651.25854F800D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 04:46:50 -0700 (Tue, 01 Jul 2008)
New Revision: 22585

Log:
xserver: fix typo


Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-07-01 11:11:24 UTC (rev 22584)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-07-01 11:46:50 UTC (rev 22585)
@@ -38,7 +38,7 @@
 									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
 									pixman dbus $(XSERVER_XORG_MESA_DEPS) mcookie
 
-XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE)
+XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) \
 		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
 		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
 		--disable-xnest --disable-xephyr --disable-xvfb \
