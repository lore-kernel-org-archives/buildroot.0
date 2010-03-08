From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xprop to 1.1.0
Message-ID: <20100308133648.BA3CB776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d9af9c6494fd87a3302c4b537c51fb09f129ae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xprop/Config.in     |    2 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xprop/Config.in b/package/x11r7/xapp_xprop/Config.in
index 6fbe94c..293ea40 100644
--- a/package/x11r7/xapp_xprop/Config.in
+++ b/package/x11r7/xapp_xprop/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XPROP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xprop 1.0.2
+	  xprop 1.1.0
 	  property displayer for X
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index aee9966..7bcd1f0 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.0.4
+XAPP_XPROP_VERSION = 1.1.0
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_AUTORECONF = NO
-- 
1.6.3.3
