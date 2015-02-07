From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:45 +0100
Subject: [Buildroot] [PATCH 32/35] package/x11r7/xdriver_xf86-video-mga:
	bump version
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use git snapshot for compatibility with xorg xserver 1.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index b530394..b800fcf 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 1.6.3
-XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MGA_VERSION = 132dee029e36c9a91a85f178885e94a9f9b5ee37
+XDRIVER_XF86_VIDEO_MGA_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-mga
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
-- 
1.7.10.4
