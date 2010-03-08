From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-suncg6 to 1.1.1
Message-ID: <20100308133635.5E2F0776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=52d9a025dca39f762384c70e1ff05799676835c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    2 +-
 .../xdriver_xf86-video-suncg6.mk                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
index e0d6c50..8b6dd34 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suncg6 1.1.0
+	  xf86-video-suncg6 1.1.1
 	  GX/Turbo GX video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
index af7b317..7d06344 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SUNCG6_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_SUNCG6_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG6_AUTORECONF = NO
-- 
1.6.3.3
