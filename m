From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-siliconmotion to
	1.7.3
Message-ID: <20100308133633.5C0F77628F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d33ebb9c4ad9a7c54d500c929bd7b7001fcc7c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../xdriver_xf86-video-siliconmotion/Config.in     |    2 +-
 .../xdriver_xf86-video-siliconmotion.mk            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
index 99fd5f3..042dcfa 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-siliconmotion 1.4.2
+	  xf86-video-siliconmotion 1.7.3
 	  Silicon Motion video driver
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 166c767..f9cf2a0 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.6.0
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.3
 XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = NO
-- 
1.6.3.3
