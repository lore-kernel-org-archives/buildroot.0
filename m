From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-dummy to 0.3.2
Message-ID: <20100308133627.4048D776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3567a019479781b96c26a4614994e4e2fc5cb6db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |    2 +-
 .../xdriver_xf86-video-dummy.mk                    |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
index 67d4217..f06d223 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ b/package/x11r7/xdriver_xf86-video-dummy/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-dummy 0.2.0
+	  xf86-video-dummy 0.3.2
 	  X.Org driver for dummy cards
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 0d50a87..76974f7 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.0
+XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.2
 XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_DUMMY_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 XDRIVER_XF86_VIDEO_DUMMY_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
