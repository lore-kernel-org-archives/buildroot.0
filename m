From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  6 Nov 2012 09:07:54 +0100
Subject: [Buildroot] [PATCH 3/3] xapp_bitmap: bump to 1.0.6
In-Reply-To: <1352189274-7000-1-git-send-email-yegorslists@googlemail.com>
References: <1352189274-7000-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1352189274-7000-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 92428ac..1ce450a 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.0.3
+XAPP_BITMAP_VERSION = 1.0.6
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
-- 
1.7.7
