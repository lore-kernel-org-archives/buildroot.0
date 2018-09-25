From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Sep 2018 22:36:13 +0200
Subject: [Buildroot] [PATCH v2 09/14] gst1-rtsp-server: bump version to
 1.14.3
In-Reply-To: <20180925203618.23192-1-ps.report@gmx.net>
References: <20180925203618.23192-1-ps.report@gmx.net>
Message-ID: <20180925203618.23192-9-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add Signed-off-by
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index dfb0849478..dd65219c20 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.2.tar.xz.sha256sum
-sha256 f7387755cf6ac5f334d4610f1f5aa7da4ff396a487dd5b789bb707f160222c98 gst-rtsp-server-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.3.tar.xz.sha256sum
+sha256 1f654c7617af15d13b67bf833f4c81d086ecbfd8cce7f2bf65fe5c1c3519f4e6 gst-rtsp-server-1.14.3.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 0dc2917685..721b8b7313 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.14.2
+GST1_RTSP_SERVER_VERSION = 1.14.3
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.19.0
