From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-mga to 1.4.11
Message-ID: <20100308133629.CE063776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2951297bf785a11738da2a14f2ea893b5ca6d6b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    2 +-
 .../xdriver_xf86-video-mga.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index ce1631e..5f71f79 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-mga 1.4.6.1
+	  xf86-video-mga 1.4.11
 	  Matrox video driver
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 1345ca7..42bfbcd 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 1.4.9
+XDRIVER_XF86_VIDEO_MGA_VERSION = 1.4.11
 XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
-- 
1.6.3.3
