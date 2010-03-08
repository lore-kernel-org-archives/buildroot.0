From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump setxkbmap to 1.1.0
Message-ID: <20100308133643.2EE81776ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2e805aead36bf62859d26acb3fcdd1abb4ea8bb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_setxkbmap/Config.in         |    2 +-
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_setxkbmap/Config.in b/package/x11r7/xapp_setxkbmap/Config.in
index a0e306e..13a75b6 100644
--- a/package/x11r7/xapp_setxkbmap/Config.in
+++ b/package/x11r7/xapp_setxkbmap/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_SETXKBMAP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
-	  setxkbmap 1.0.3
+	  setxkbmap 1.1.0
 	  Controls the keyboard layout of a running X server.
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index fb201ae..7c9d0f8 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SETXKBMAP_VERSION = 1.0.4
+XAPP_SETXKBMAP_VERSION = 1.1.0
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
 XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SETXKBMAP_AUTORECONF = NO
-- 
1.6.3.3
