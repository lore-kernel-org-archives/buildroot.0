From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:54 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-glide: bump version
Message-ID: <20120922194152.10B1E9969B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfa9185a1c28c21b758f834285b28878fe752623
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-glide.mk                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index 9d7460b..64d50ed 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.3
+XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.1.0
 XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
