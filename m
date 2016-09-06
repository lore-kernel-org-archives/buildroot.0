From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:55:09 +0200
Subject: [Buildroot] [git commit] gst1-libav: bump to version 1.8.3
Message-ID: <20160906195532.DEFA77FA76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b33f15ff1467d4a09d36e240d604abb67308873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we moved to ffmpeg 3.x the build and runtime (when patched) problems
have gone away.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
