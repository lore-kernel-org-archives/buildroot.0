From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:43:27 +0100
Subject: [Buildroot] [git commit] gst1-libav: bump to version 1.6.2
Message-ID: <20151215204720.6859B7FC51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8896c130b192ace7fba1bed292bcb5e20b50fe1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index ec35c5d..7530637 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.1.tar.xz.sha256sum
-sha256	24d5e8e8b8c825af1a19aa80a27aba268ec383c8133fd4ef66e0e572ff6137a9  gst-libav-1.6.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.2.tar.xz.sha256sum
+sha256	2597acc00171006d49f0d300440a87df51b113d557466e532153abc740db3469  gst-libav-1.6.2.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index d6a21e4..6a72f9c 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.6.1
+GST1_LIBAV_VERSION = 1.6.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
