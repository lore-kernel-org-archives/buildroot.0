From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-s3 to 0.6.3
Message-ID: <20100308133632.65B0B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a3cdf3d7f097103f9ae1d5ed111199d8d3bae7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-s3/Config.in      |    2 +-
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
index 6aaa2cd..3d3cad5 100644
--- a/package/x11r7/xdriver_xf86-video-s3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-s3 0.5.0
+	  xf86-video-s3 0.6.3
 	  X.Org driver for s3 cards
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
index 0a0a1bd..a9cf6d9 100644
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_S3_VERSION = 0.6.0
+XDRIVER_XF86_VIDEO_S3_VERSION = 0.6.3
 XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3_AUTORECONF = NO
-- 
1.6.3.3
