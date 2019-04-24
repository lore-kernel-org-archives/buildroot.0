From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 24 Apr 2019 17:03:28 -0400
Subject: [Buildroot] [PATCH v3 05/10] package/gstreamer1/gst-omx: bump to
 version 1.16.0
In-Reply-To: <20190424210333.62571-1-aduskett@gmail.com>
References: <20190424210333.62571-1-aduskett@gmail.com>
Message-ID: <20190424210333.62571-5-aduskett@gmail.com>
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

 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 3efd9f3226..fe3256bf73 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.4.tar.xz.sha256sum
-sha256 969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4 gst-omx-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.0.tar.xz.sha256sum
+sha256 969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4 gst-omx-1.16.0.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index bb325ad1d2..b9e1899201 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.14.4
+GST_OMX_VERSION = 1.16.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.20.1
