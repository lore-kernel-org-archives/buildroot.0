From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jun 2018 00:35:26 +0200
Subject: [Buildroot] [PATCH v6 6/9] gst1-libav: bump to 1.14.1
In-Reply-To: <20180623223529.13629-1-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
Message-ID: <20180623223529.13629-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Update to 1.14.1]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v5 -> v6:
  - update to 1.14.1
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 5 +++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index f9a287c590..d67968557d 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.4.tar.xz.sha256sum
-sha256 2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62 gst-libav-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.1.tar.xz.sha256sum
+sha256 eff80a02d2f2fb9f34b67e9a26e9954d3218c7aa18e863f2a47805fa7066029d gst-libav-1.14.1.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 7450b759f1..b7566f0161 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.4
+GST1_LIBAV_VERSION = 1.14.1
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.17.1
