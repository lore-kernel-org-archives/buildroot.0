From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 23:31:51 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst-omx: bump to
 version 1.16.0
Message-ID: <20190505212652.DE3E683D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce367378ed275d7231a9c19d873336f3d3bd58a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Peter: fix download hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 3efd9f3226..2d28c9587b 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.4.tar.xz.sha256sum
-sha256 969870e75c1f75c96f8783530e2c2932fc3afbfd976eb0c466f51dae268ea3d4 gst-omx-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.0.tar.xz.sha256sum
+sha256 fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a gst-omx-1.16.0.tar.xz
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
 
