From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 13:01:28 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi
Message-ID: <20090210130128.DA8AD76275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 13:01:28 +0000 (Tue, 10 Feb 2009)
New Revision: 25289

Log:
x11/video-xgi: fix vesa/xgi typo

Closes #95

Modified:
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in	2009-02-10 04:10:34 UTC (rev 25288)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in	2009-02-10 13:01:28 UTC (rev 25289)
@@ -7,5 +7,5 @@
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-xgi 1.3.0
+	  xf86-video-xgi 1.5.0
 	  XGI based chips video driver

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk	2009-02-10 04:10:34 UTC (rev 25288)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk	2009-02-10 13:01:28 UTC (rev 25289)
@@ -5,7 +5,7 @@
 ################################################################################
 
 XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.0
-XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_XGI_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
