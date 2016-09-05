From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Sep 2016 20:13:03 -0300
Subject: [Buildroot] [PATCH 1/2] gst1-libav: bump to version 1.8.3
Message-ID: <1473117184-18905-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we moved to ffmpeg 3.x the build and runtime (when patched) problems
have gone away.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 227b92a..46d48a9 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.8.2.tar.xz.sha256sum
-sha256	b5f3c7a27b39b5f5c2f0bfd546b0c655020faf6b38d27b64b346c43e5ebf687a  gst-libav-1.8.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.8.3.tar.xz.sha256sum
+sha256	9006a05990089f7155ee0e848042f6bb24e52ab1d0a59ff8d1b5d7e33001a495  gst-libav-1.8.3.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index bb78d98..c535952 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.8.2
+GST1_LIBAV_VERSION = 1.8.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.7.3
