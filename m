From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:14:57 +0200
Subject: [Buildroot] [git commit] gst-omx: bump version to 1.14.4
Message-ID: <20181006131815.390F48D9B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1748e3b70408a3f875143436fcec2353c015f40a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 6d4361e6ed..3efd9f3226 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.3.tar.xz.sha256sum
-sha256 6ba7dc5caabce092ea645b5c6de1a82d12ee086d18f692a8f31cbc359b708cb1 gst-omx-1.14.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.4.tar.xz.sha256sum
+sha256 969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4 gst-omx-1.14.4.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 2c0aec4f1f..5dda1eb145 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.14.3
+GST_OMX_VERSION = 1.14.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
