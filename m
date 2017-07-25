From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 16:53:41 +0200
Subject: [Buildroot] [git commit] gst1-rtsp-server: bump version to 1.12.2
Message-ID: <20170725145001.A61FF82150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb79c368e4829e5954fa96112f2ab1c70ff65852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index b315a65..66f3253 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.1.tar.xz.sha256sum
-sha256 f27b9bde057e861a7705fa1263a9288a09fce8c42d8d5363c0bef4fe93994292  gst-rtsp-server-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.2.tar.xz.sha256sum
+sha256 d8ba9264e8ae6e440293328e759e40456f161aa66077b3143dd07581136190b3 gst-rtsp-server-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 8f826c0..2e9a89a 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.12.1
+GST1_RTSP_SERVER_VERSION = 1.12.2
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
