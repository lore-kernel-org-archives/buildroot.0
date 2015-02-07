From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:38 +0100
Subject: [Buildroot] [PATCH 25/35] package/x11r7/xdriver_xf86-video-savage:
	bump version
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-25-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use git snapshot for compatibility with xorg xserver 1.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk  |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 2b2ef55..676ffed 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.7
-XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = d28cd83c7b0b4a943efbe5ddf257c8ee2646ea73
+XDRIVER_XF86_VIDEO_SAVAGE_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-savage
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
-- 
1.7.10.4
