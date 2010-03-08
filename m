From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xrandr to 1.3.2
Message-ID: <20100308133648.EFBF2776E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2cd1b8238f09797e2dc9b6ea9ddd863232a65015
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xrandr/Config.in      |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/Config.in b/package/x11r7/xapp_xrandr/Config.in
index 2cdd3c3..e553f64 100644
--- a/package/x11r7/xapp_xrandr/Config.in
+++ b/package/x11r7/xapp_xrandr/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XRANDR
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xrandr 1.0.2
+	  xrandr 1.3.2
 	  primitive command line interface to RandR extension
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 960e26f..70c7e1a 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.2.3
+XAPP_XRANDR_VERSION = 1.3.2
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_AUTORECONF = NO
-- 
1.6.3.3
