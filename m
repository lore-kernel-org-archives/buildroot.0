From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 22:09:35 +0200
Subject: [Buildroot] [git commit] gst1-libav: bump to 1.14.1
Message-ID: <20180626211527.660BE82DDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1d18f1a7a44067b5cbe1e79690258878eb4b468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Update to 1.14.1]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
