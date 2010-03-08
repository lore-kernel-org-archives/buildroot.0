From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-trident to 1.3.3
Message-ID: <20100308133637.1EEC8776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c0f084f3597190857801d155602f15410d47afc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-trident/Config.in |    2 +-
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
index ead1cb7..3ae3a02 100644
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-trident 1.2.3
+	  xf86-video-trident 1.3.3
 	  Trident video driver
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index 13de86f..e26188d 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.0
+XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.3
 XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_AUTORECONF = NO
-- 
1.6.3.3
