From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Oct 2015 16:40:49 -0300
Subject: [Buildroot] [PATCH 6/6] gst1-libav: bump to version 1.6.1
In-Reply-To: <1446234049-15155-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446234049-15155-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1446234049-15155-6-git-send-email-gustavo@zacarias.com.ar>
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
index 9f6473b..ec35c5d 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.0.tar.xz.sha256sum
-sha256	6cca6cf73182a882768ef0c860af88c2fd2c77e2c81ce464a998ab4e6baa604c  gst-libav-1.6.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.1.tar.xz.sha256sum
+sha256	24d5e8e8b8c825af1a19aa80a27aba268ec383c8133fd4ef66e0e572ff6137a9  gst-libav-1.6.1.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index ffd13b5..d6a21e4 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.6.0
+GST1_LIBAV_VERSION = 1.6.1
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
-- 
2.4.10
