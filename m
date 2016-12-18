From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 14:04:19 +0100
Subject: [Buildroot] [PATCH 3/4] package/x11r7/xdriver_xf86-video-geode:
	bump version to 2.11.19
In-Reply-To: <20161218130420.3920-1-bernd.kuhls@t-online.de>
References: <20161218130420.3920-1-bernd.kuhls@t-online.de>
Message-ID: <20161218130420.3920-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index b05983fd0..8c567cbb3 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2016-February/002673.html
-sha256	d6ece9a862a68be3cdf86a87e0e1ba5e199168b8d075129646638f53649ba9e8	xf86-video-geode-2.11.18.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-December/002750.html
+sha256 c6694c21ee3d9560f6e925925ef1d3818b1988e899b6a0592dbae597c87ac97e  xf86-video-geode-2.11.19.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index b882f1f85..9138abdbe 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.18
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.19
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
-- 
2.11.0
