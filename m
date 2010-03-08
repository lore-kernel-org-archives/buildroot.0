From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-s3virge to 1.10.4
Message-ID: <20100308133632.26051776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c76015c082ae7aaf1831b80232f117c1540dbc2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |    2 +-
 .../xdriver_xf86-video-s3virge.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
index 1445d03..6a73753 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-s3virge 1.9.1
+	  xf86-video-s3virge 1.10.4
 	  S3 ViRGE video driver
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
index 6f98910..caf45e4 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_S3VIRGE_VERSION = 1.10.1
+XDRIVER_XF86_VIDEO_S3VIRGE_VERSION = 1.10.4
 XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VIRGE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3VIRGE_AUTORECONF = NO
-- 
1.6.3.3
