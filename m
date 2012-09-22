From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:55 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-voodoo: bump version
Message-ID: <20120922194156.D5EFC9963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae63946346747dbe8d6ccbd45225578e23d38c7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-voodoo.mk                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index 4811d68..49065c6 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VOODOO_VERSION = 1.2.3
+XDRIVER_XF86_VIDEO_VOODOO_VERSION = 1.2.4
 XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
