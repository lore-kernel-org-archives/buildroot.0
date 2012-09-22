From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:55 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-tseng: bump version
Message-ID: <20120922194155.CBA119963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26923ad2957282f5ca373872d1622a257bc5a8db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-tseng.mk                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index ed21580..8127c7d 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.3
+XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.4
 XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
