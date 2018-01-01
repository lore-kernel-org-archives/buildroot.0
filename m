From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  1 Jan 2018 11:17:21 -0500
Subject: [Buildroot] [PATCH 09/10] gst1-libav: bump to 1.12.4
In-Reply-To: <20180101161722.12637-1-Adamduskett@outlook.com>
References: <20180101161722.12637-1-Adamduskett@outlook.com>
Message-ID: <20180101161722.12637-9-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 1fd6ffc27c..f9a287c590 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.3.tar.xz.sha256sum
-sha256 015ef8cab6f7fb87c8fb42642486423eff3b6e6a6bccdcd6a189f436a3619650 gst-libav-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.4.tar.xz.sha256sum
+sha256 2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62 gst-libav-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 41b35abb1e..7450b759f1 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.3
+GST1_LIBAV_VERSION = 1.12.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.14.3
