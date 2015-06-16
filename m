From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 16 Jun 2015 21:18:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-video-vesa: bump
	to version 2.3.4
In-Reply-To: <1434482303-10091-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434482303-10091-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434482303-10091-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash |    4 ++--
 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
index bc400d5..84c0b08 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002319.html
-sha256	ce8b75e5a40e9dae76f2ac9e2880f7f73a848653ca2eed5880f52dc2c0d3aef8	xf86-video-vesa-2.3.3.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-June/002615.html
+sha256	7bddf4d879dd6f67088ecb203a31e12334aab980174bd0909930a21f32e251c1	xf86-video-vesa-2.3.4.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 05d15dd..1184821 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VESA_VERSION = 2.3.3
+XDRIVER_XF86_VIDEO_VESA_VERSION = 2.3.4
 XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VESA_LICENSE = MIT
-- 
1.7.10.4
