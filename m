From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  4 Jul 2017 14:19:16 +0200
Subject: [Buildroot] [PATCH 10/10] gst1-rtsp-server: bump version to 1.12.1
In-Reply-To: <20170704121916.28441-1-peter@korsgaard.com>
References: <20170704121916.28441-1-peter@korsgaard.com>
Message-ID: <20170704121916.28441-10-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 78393edd8b..b315a65f5a 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.0.tar.xz.sha256sum
-sha256 85ae6bbe173b365ddf4859967144f1999b436531ecbe09935914bfa9f6b37652  gst-rtsp-server-1.12.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.1.tar.xz.sha256sum
+sha256 f27b9bde057e861a7705fa1263a9288a09fce8c42d8d5363c0bef4fe93994292  gst-rtsp-server-1.12.1.tar.xz
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index cc9d1f3a5e..8f826c0f31 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.12.0
+GST1_RTSP_SERVER_VERSION = 1.12.1
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.11.0
