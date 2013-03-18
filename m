From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:05:23 +0100
Subject: [Buildroot] [PATCH 117/120] xserver_xorg-server: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-58-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xserver_xorg-server/Config.in              |    1 -
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 21b0700..c860a1d 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -45,7 +45,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 140cb8b..f0b19aa 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.9.4
+XSERVER_XORG_SERVER_VERSION = 1.12.2
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
@@ -46,7 +46,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_xextproto 		\
 	xproto_xf86bigfontproto 	\
 	xproto_xf86dgaproto 		\
-	xproto_xf86rushproto 		\
 	xproto_xf86vidmodeproto 	\
 	xproto_xproto 			\
 	xkeyboard-config		\
-- 
1.7.10.4
