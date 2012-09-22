From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:54 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-rendition: bump version
Message-ID: <20120922194154.71F979963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77c7dffef279356d2096cba869cb38ed595b0333
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-rendition.mk                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index 6d490c2..d83a1ef 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.3
+XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.4
 XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_RENDITION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
