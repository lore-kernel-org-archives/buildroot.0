From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 20 Mar 2018 10:48:57 -0400
Subject: [Buildroot] [PATCH 4/8] gst1-rtsp-server: bump to 1.14
In-Reply-To: <20180320144901.9032-1-aduskett@gmail.com>
References: <20180320144901.9032-1-aduskett@gmail.com>
Message-ID: <20180320144901.9032-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 5 +++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 95c8eef832..239e44ccd3 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.4.tar.xz.sha256sum
-sha256 7660112ebd59838f1054796b38109dcbe32f0a040e3a252a68a81055aeaa56a9 gst-rtsp-server-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.0.tar.xz.sha256sum
+sha256 6b65a077bed815f6d3157ebea503cc9f3c32d289af2756b7ff7e3958744d9756 gst-rtsp-server-1.14.0.tar.xz
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index d6a82ee654..5edd8737c1 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.12.4
+GST1_RTSP_SERVER_VERSION = 1.14.0
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.14.3
