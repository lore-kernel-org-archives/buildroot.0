From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-suncg14 to 1.1.1
Message-ID: <20100308133634.B43B7776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d8bc26e36817f8e09f448ce0eb6f170080d1b11d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-suncg14/Config.in |    2 +-
 .../xdriver_xf86-video-suncg14.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
index f5dcb8c..977095b 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suncg14 1.1.0
+	  xf86-video-suncg14 1.1.1
 	  CG14 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
index 1e7c8e8..8fcbeda 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SUNCG14_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_SUNCG14_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNCG14_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG14_AUTORECONF = NO
-- 
1.6.3.3
