From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Mar 2018 09:41:18 -0400
Subject: [Buildroot] [PATCH v2 6/8] gst1-libav: bump to 1.14
In-Reply-To: <20180321134120.498-1-aduskett@gmail.com>
References: <20180321134120.498-1-aduskett@gmail.com>
Message-ID: <20180321134120.498-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - none

 package/gstreamer1/gst1-libav/gst1-libav.hash | 5 +++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index f9a287c590..5889386bec 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.4.tar.xz.sha256sum
-sha256 2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62 gst-libav-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.0.tar.xz.sha256sum
+sha256 fb134b4d3e054746ef8b922ff157b0c7903d1fdd910708a45add66954da7ef89 gst-libav-1.14.0.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 7450b759f1..91782eaa9a 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.4
+GST1_LIBAV_VERSION = 1.14.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.14.3
