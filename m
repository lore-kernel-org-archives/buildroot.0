From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-sisusb to 0.9.3
Message-ID: <20100308133633.BE7DE776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51db62126d6dec1043c90a578dc0615d61af097b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |    2 +-
 .../xdriver_xf86-video-sisusb.mk                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
index b982928..af68d89 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sisusb 0.8.1
+	  xf86-video-sisusb 0.9.3
 	  SiS USB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index e04ff2c..36a683f 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.0
+XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.3
 XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SISUSB_AUTORECONF = NO
-- 
1.6.3.3
