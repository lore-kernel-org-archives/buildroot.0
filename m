From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-rendition to 4.2.3
Message-ID: <20100308133631.C3377776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=097125cbfe9118a1b216f5cba63e0f841bfd7d50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |    2 +-
 .../xdriver_xf86-video-rendition.mk                |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
index 34b5e49..bdcf334 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
+++ b/package/x11r7/xdriver_xf86-video-rendition/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-rendition 4.1.3
+	  xf86-video-rendition 4.2.3
 	  Rendition video driver
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index cfc1727..a7b1245 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.0
+XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.3
 XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_RENDITION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_RENDITION_AUTORECONF = NO
-- 
1.6.3.3
