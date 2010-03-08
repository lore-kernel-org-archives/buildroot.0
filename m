From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-tseng to 1.2.3
Message-ID: <20100308133637.7A5BA776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c54466facfb81d7cb6f90bc7cf65f02af1c58ecc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |    2 +-
 .../xdriver_xf86-video-tseng.mk                    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
index dc14148..d43f1a9 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tseng/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-tseng 1.1.1
+	  xf86-video-tseng 1.2.3
 	  Tseng Labs video driver
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index be198ed..3ee7722 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.3
 XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TSENG_AUTORECONF = NO
-- 
1.6.3.3
