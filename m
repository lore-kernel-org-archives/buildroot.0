From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-sis to 0.10.2
Message-ID: <20100308133634.23303776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=72a663744f858b725d206fa68e7939b399913a3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    2 +-
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index 08f77a4..aac628e 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sis 0.9.3
+	  xf86-video-sis 0.10.2
 	  SiS and XGI video driver
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 1d3944a..cfcb3f1 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.0
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.2
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
-- 
1.6.3.3
