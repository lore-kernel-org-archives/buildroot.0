From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  9 Mar 2012 15:39:49 +0100
Subject: [Buildroot] [PATCH 4/5] xdriver_xf86-video-fbdev: bump to 0.4.2
In-Reply-To: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
References: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1331303990-13548-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../xdriver_xf86-video-fbdev.mk                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 600335e..7634d92 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.1
+XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.2
 XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-- 
1.7.7
