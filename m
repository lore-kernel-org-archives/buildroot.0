From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jun 2016 18:49:16 -0300
Subject: [Buildroot] [PATCH 2/7] gst1-plugins-base: bump to version 1.8.2
In-Reply-To: <1465508961-19204-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465508961-19204-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465508961-19204-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index c3db9b0..9c4ae8a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.8.1.tar.xz.sha256sum
-sha256	15a9de985cd265c344e359f5b19347df4021b7611ed2c2d91917cb900f2fad6f  gst-plugins-base-1.8.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.8.2.tar.xz.sha256sum
+sha256	9d7109c8fb0a5dec8edb17b0053c59a46aba7ddf48dc48ea822ebbbd4339d38d  gst-plugins-base-1.8.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 62e8b22..1b2d343 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.8.1
+GST1_PLUGINS_BASE_VERSION = 1.8.2
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.7.3
