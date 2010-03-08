From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-savage to 2.3.1
Message-ID: <20100308133632.CEDDD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=62d3599ee26d553c7f7059f344b7d3a982c388c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    2 +-
 .../xdriver_xf86-video-savage.mk                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index ef49ffa..a7499eb 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-savage 2.1.3
+	  xf86-video-savage 2.3.1
 	  S3 Savage video driver
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 51cd7d0..a524ec7 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.2.1
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.1
 XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
-- 
1.6.3.3
