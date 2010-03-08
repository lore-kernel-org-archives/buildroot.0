From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-suncg3 to 1.1.1
Message-ID: <20100308133635.110C8776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f688e1ed1157b3bf57866e01c6119febad9fe6cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    2 +-
 .../xdriver_xf86-video-suncg3.mk                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
index c807af2..486f6ca 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suncg3 1.1.0
+	  xf86-video-suncg3 1.1.1
 	  CG3 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
index 5e2f261..7eec996 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SUNCG3_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_SUNCG3_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG3_AUTORECONF = NO
-- 
1.6.3.3
