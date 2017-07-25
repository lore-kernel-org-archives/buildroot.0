From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 16:53:29 +0200
Subject: [Buildroot] [git commit] gst1-libav: bump version to 1.12.2
Message-ID: <20170725145001.7104882150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65057107536c39efeced7764abc0421c3ee0e1b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index bd09444..6f176a5 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.1.tar.xz.sha256sum
-sha256 55d7823fdf63195de991adfef32db4b8a8bef3cafa46115a951e590dc18a5077  gst-libav-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.2.tar.xz.sha256sum
+sha256 5bb735b9bb218b652ae4071ea6f6be8eaae55e9d3233aec2f36b882a27542db3 gst-libav-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 375f5f0..3365c3e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.1
+GST1_LIBAV_VERSION = 1.12.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
