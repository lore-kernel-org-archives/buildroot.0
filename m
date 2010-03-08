From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xmodmap to 1.0.4
Message-ID: <20100308133648.2BE59776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9607daf68af9ef5de39f1bce1224b5769dcad1f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xmodmap/Config.in       |    2 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xmodmap/Config.in b/package/x11r7/xapp_xmodmap/Config.in
index e7db3a5..f4e1f0c 100644
--- a/package/x11r7/xapp_xmodmap/Config.in
+++ b/package/x11r7/xapp_xmodmap/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XMODMAP
 	bool "xmodmap"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xmodmap 1.0.2
+	  xmodmap 1.0.4
 	  utility for modifying keymaps and pointer button mappings in X
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 05ec7b5..df4280b 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMODMAP_VERSION = 1.0.3
+XAPP_XMODMAP_VERSION = 1.0.4
 XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_AUTORECONF = NO
-- 
1.6.3.3
