From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:44 +0100
Subject: [Buildroot] [PATCH 19/19] package/x11r7/xdriver_xf86-video-vesa:
 bump version to 2.4.0
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash   | 9 +++++++--
 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
index 84c0b08a92..ee27690093 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-June/002615.html
-sha256	7bddf4d879dd6f67088ecb203a31e12334aab980174bd0909930a21f32e251c1	xf86-video-vesa-2.3.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-February/002837.html
+md5 8134201beaf6f77150c7809c3cc802e6  xf86-video-vesa-2.4.0.tar.bz2
+sha1 99b69044c34292ba062e365c07dcd024462e794b  xf86-video-vesa-2.4.0.tar.bz2
+sha256 bf443c94d7bf6cd4e248f8a3147f4647be04dc4c80250d9405006263bbdee38c  xf86-video-vesa-2.4.0.tar.bz2
+sha512 4af5c0a7fd64eba503980198cf510688dff2f33482ceac446455d97255dcc828613387ac57828eb6dce080cb15a8644a2b2e278bf356705fdeaea873ab07c2de  xf86-video-vesa-2.4.0.tar.bz2
+# Locally computed
+sha256 bda49ba1e860501c20fd444423bc790f6da4f769561b69acc0cbe5abff9409b6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 1184821d9c..d2a9205197 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VESA_VERSION = 2.3.4
+XDRIVER_XF86_VIDEO_VESA_VERSION = 2.4.0
 XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VESA_LICENSE = MIT
-- 
2.11.0
