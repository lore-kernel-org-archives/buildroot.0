From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-suntcx to 1.1.1
Message-ID: <20100308133636.07454776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc1cc7e5e0b6735ef2c9da590a9cc21c03c4e583
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    2 +-
 .../xdriver_xf86-video-suntcx.mk                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
index a5237f9..fd4a2d2 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-suntcx 1.1.0
+	  xf86-video-suntcx 1.1.1
 	  TCX video driver
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
index 860ce15..3b5d4de 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SUNTCX_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_SUNTCX_VERSION = 1.1.1
 XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNTCX_AUTORECONF = NO
-- 
1.6.3.3
