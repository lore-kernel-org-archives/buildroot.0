From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jun 2018 00:35:24 +0200
Subject: [Buildroot] [PATCH v6 4/9] gst1-rtsp-server: bump to 1.14.1
In-Reply-To: <20180623223529.13629-1-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
Message-ID: <20180623223529.13629-5-ps.report@gmx.net>
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
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 5 +++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 95c8eef832..4eabe12cef 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.4.tar.xz.sha256sum
-sha256 7660112ebd59838f1054796b38109dcbe32f0a040e3a252a68a81055aeaa56a9 gst-rtsp-server-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.1.tar.xz.sha256sum
+sha256 38634f3b25c2bf2967b1ff914b54ff384f8612f5aefc18accd72c78bf3b02d7c gst-rtsp-server-1.14.1.tar.xz
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index d6a82ee654..4aa7c0b0c7 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.12.4
+GST1_RTSP_SERVER_VERSION = 1.14.1
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.17.1
