From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 19:18:04 -0300
Subject: [Buildroot] [PATCH 6/6] gst1-libav: bump to version 1.6.3
In-Reply-To: <1453328284-13549-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453328284-13549-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1453328284-13549-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 7530637..d234b32 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.2.tar.xz.sha256sum
-sha256	2597acc00171006d49f0d300440a87df51b113d557466e532153abc740db3469  gst-libav-1.6.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.3.tar.xz.sha256sum
+sha256	857b9c060a0337de38c6d26238c47352433c02eabf26c2f860c854dbc35bd4ab  gst-libav-1.6.3.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 6a72f9c..3a987a7 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.6.2
+GST1_LIBAV_VERSION = 1.6.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
-- 
2.4.10
