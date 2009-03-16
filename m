From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:21 +0000 (UTC)
Subject: [Buildroot] svn commit: [25680]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090316154821.736E17643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:21 +0000 (Mon, 16 Mar 2009)
New Revision: 25680

Log:
xserver-xorg: set buildroot mailing list as builder addr

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:14 UTC (rev 25679)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:21 UTC (rev 25680)
@@ -28,6 +28,7 @@
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
+		--with-builder-addr=buildroot at uclibc.org \
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
