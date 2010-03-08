From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-nv to 2.1.15
Message-ID: <20100308133630.C047A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4398c756858f1b75f2f146683dd35d82ca873662
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-nv/Config.in      |    2 +-
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
index 1a16851..63cca8f 100644
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nv/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-nv 2.1.3
+	  xf86-video-nv 2.1.15
 	  NVIDIA video driver
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 481d999..de15a1e 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.12
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.15
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_NV_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 XDRIVER_XF86_VIDEO_NV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
