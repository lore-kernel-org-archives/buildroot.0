From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Oct 2008 04:58:50 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20081023115851.0479D3C374@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-23 04:58:50 -0700 (Thu, 23 Oct 2008)
New Revision: 23770

Log:
x11r7/xserver: select cursor font as well

Really closes #5684.

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2008-10-23 10:24:42 UTC (rev 23769)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2008-10-23 11:58:50 UTC (rev 23770)
@@ -13,6 +13,7 @@
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XFONT_FONT_ALIAS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC
+	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXAW
