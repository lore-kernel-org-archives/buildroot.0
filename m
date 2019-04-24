From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 24 Apr 2019 17:03:31 -0400
Subject: [Buildroot] [PATCH v3 08/10] package/gstreamer1/gst1-libav: bump to
 version 1.16.0
In-Reply-To: <20190424210333.62571-1-aduskett@gmail.com>
References: <20190424210333.62571-1-aduskett@gmail.com>
Message-ID: <20190424210333.62571-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - None

 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 741c582319..bcd4e251d2 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.4.tar.xz.sha256sum
-sha256 dfd78591901df7853eab7e56a86c34a1b03635da0d3d56b89aa577f1897865da gst-libav-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.0.tar.xz.sha256sum
+sha256 dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a gst-libav-1.16.0.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 73e47a0639..fed411bcc9 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.14.4
+GST1_LIBAV_VERSION = 1.16.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_DEPENDENCIES = \
-- 
2.20.1
