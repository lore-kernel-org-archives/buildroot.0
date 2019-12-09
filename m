From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Dec 2019 21:04:49 +0100
Subject: [Buildroot] [PATCH v1 07/11] gst1-libav: bump version to 1.16.2
In-Reply-To: <20191209200453.2461-1-ps.report@gmx.net>
References: <20191209200453.2461-1-ps.report@gmx.net>
Message-ID: <20191209200453.2461-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index bd2535c642..15e4d859ee 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.1.tar.xz.sha256sum
-sha256 e8a5748ae9a4a7be9696512182ea9ffa6efe0be9b7976916548e9d4381ca61c4 gst-libav-1.16.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.2.tar.xz.sha256sum
+sha256 c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2 gst-libav-1.16.2.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 0c1d3e6f4a..fdd4d6cc2e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.16.1
+GST1_LIBAV_VERSION = 1.16.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 
-- 
2.24.0
