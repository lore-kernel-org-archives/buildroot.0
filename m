From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jun 2016 18:49:20 -0300
Subject: [Buildroot] [PATCH 6/7] gst1-libav: bump to version 1.8.2
In-Reply-To: <1465508961-19204-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465508961-19204-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465508961-19204-6-git-send-email-gustavo@zacarias.com.ar>
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
index 157c94f..227b92a 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.8.1.tar.xz.sha256sum
-sha256	44a49108c3531b5ac4f346a2247cd7fbafb0e8ab394394cb6d75a70300b38933  gst-libav-1.8.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.8.2.tar.xz.sha256sum
+sha256	b5f3c7a27b39b5f5c2f0bfd546b0c655020faf6b38d27b64b346c43e5ebf687a  gst-libav-1.8.2.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 65d1862..bb78d98 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.8.1
+GST1_LIBAV_VERSION = 1.8.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.7.3
