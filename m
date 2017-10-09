From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 14:56:55 -0400
Subject: [Buildroot] [PATCH 06/10] gst1-rtsp-server: bump to 1.12.3
In-Reply-To: <20171009185659.7631-1-Adamduskett@outlook.com>
References: <20171009185659.7631-1-Adamduskett@outlook.com>
Message-ID: <20171009185659.7631-6-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 66f3253514..6457861c56 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.2.tar.xz.sha256sum
-sha256 d8ba9264e8ae6e440293328e759e40456f161aa66077b3143dd07581136190b3 gst-rtsp-server-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.3.tar.xz.sha256sum
+sha256 67255971bb16029a01de66b9f9687f20d8dbf3d3bd75feb48605d0723a7c74ec gst-rtsp-server-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 2e9a89a33a..71c9ef5bda 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.12.2
+GST1_RTSP_SERVER_VERSION = 1.12.3
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.13.6
