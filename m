From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 11:48:17 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/gst1-plugins-good: bump version to 1.16.3
Message-ID: <20210122103051.7A2188186C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d4325b8f3b004802e28d18b5a0050257a0262eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 075338b14b..27eb9a02f7 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.16.2.tar.xz.sha256sum
-sha256 40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319 gst-plugins-good-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.16.3.tar.xz.sha256sum
+sha256 d3a23a3fe73de673f591b7655494990c9e8a0e22a3c70d6f1dbf50198b29f85f gst-plugins-good-1.16.3.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index eed4bfe117..51844f6e54 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.16.2
+GST1_PLUGINS_GOOD_VERSION = 1.16.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
