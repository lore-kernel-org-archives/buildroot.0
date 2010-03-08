From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xsetroot to 1.0.3
Message-ID: <20100308133649.F2C42776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f97e38630d50be2afd7784523e582f296eb232e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xsetroot/Config.in        |    2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xsetroot/Config.in b/package/x11r7/xapp_xsetroot/Config.in
index 346d017..c4d794e 100644
--- a/package/x11r7/xapp_xsetroot/Config.in
+++ b/package/x11r7/xapp_xsetroot/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XAPP_XSETROOT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
-	  xsetroot 1.0.1
+	  xsetroot 1.0.3
 	  X.Org xsetroot application
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 9485761..523c89a 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSETROOT_VERSION = 1.0.2
+XAPP_XSETROOT_VERSION = 1.0.3
 XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETROOT_AUTORECONF = NO
-- 
1.6.3.3
