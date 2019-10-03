From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  3 Oct 2019 16:48:36 +0200
Subject: [Buildroot] [PATCH v1 09/11] gst1-rtsp-server: bump version to
 1.16.1
In-Reply-To: <20191003144838.22437-1-ps.report@gmx.net>
References: <20191003144838.22437-1-ps.report@gmx.net>
Message-ID: <20191003144838.22437-9-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 9b53fc4fc2..52ef8a4311 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.16.0.tar.xz.sha256sum
-sha256 198e9eec1a3e32dc810d3fbf3a714850a22c6288d4a5c8e802c5ff984af03f19 gst-rtsp-server-1.16.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.16.1.tar.xz.sha256sum
+sha256 b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d700144 gst-rtsp-server-1.16.1.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 0a821e6fed..c84d0c7e16 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GST1_RTSP_SERVER_VERSION = 1.16.0
+GST1_RTSP_SERVER_VERSION = 1.16.1
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
--
2.23.0
