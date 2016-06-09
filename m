From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:58:43 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump to version 1.8.2
Message-ID: <20160609215904.2967D8027D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dec0b85cb0453e03bce7ff5ac072398cd9e6f0d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
