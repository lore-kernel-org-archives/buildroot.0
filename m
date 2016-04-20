From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2016 20:48:08 -0300
Subject: [Buildroot] [PATCH 6/7] gst1-libav: bump to version 1.8.1
In-Reply-To: <1461196089-19847-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461196089-19847-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461196089-19847-6-git-send-email-gustavo@zacarias.com.ar>
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
index fb1f98a..157c94f 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.8.0.tar.xz.sha256sum
-sha256	5a1ce28876aee93cb4f3d090f0e807915a5d9bc1325e3480dd302b85aeb4291c  gst-libav-1.8.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.8.1.tar.xz.sha256sum
+sha256	44a49108c3531b5ac4f346a2247cd7fbafb0e8ab394394cb6d75a70300b38933  gst-libav-1.8.1.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index d878ec8..65d1862 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.8.0
+GST1_LIBAV_VERSION = 1.8.1
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.7.3
