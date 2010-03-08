From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-apm to 1.2.2
Message-ID: <20100308133625.1E029776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d6a69ce84874d974836e334abc650d03a9682020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-apm/Config.in     |    2 +-
 .../xdriver_xf86-video-apm.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
index 60638ec..9b799d5 100644
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ b/package/x11r7/xdriver_xf86-video-apm/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
 	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-apm 1.1.1
+	  xf86-video-apm 1.2.2
 	  Alliance ProMotion video driver
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
index 7258bda..24a0110 100644
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.2
 XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_APM_AUTORECONF = NO
-- 
1.6.3.3
