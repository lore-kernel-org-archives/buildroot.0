From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-chips to 1.2.2
Message-ID: <20100308133626.8B4A2776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aeb3a161781925907ca2f164fdd5ab3b0c3084ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-chips/Config.in   |    2 +-
 .../xdriver_xf86-video-chips.mk                    |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
index 2af139f..c0b8271 100644
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ b/package/x11r7/xdriver_xf86-video-chips/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-chips 1.1.1
+	  xf86-video-chips 1.2.2
 	  Chips and Technologies video driver
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index eb09eaa..237c61e 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.2
 XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CHIPS_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_CHIPS_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 XDRIVER_XF86_VIDEO_CHIPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
