From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:55 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-trident: bump version
Message-ID: <20120922194155.46D749963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43bbcd1737c0983b57504879d7e9c2fd61270b3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index 46967c8..a6002e8 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.3
+XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.4
 XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
