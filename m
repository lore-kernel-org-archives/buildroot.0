From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:17:26 +0100
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20141229150127.06E50807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83058e3977827c034c71f96b426f805df56f06e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-good/gst1-plugins-good.hash       |    4 ++--
 .../gst1-plugins-good/gst1-plugins-good.mk         |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 4303a71..be4c801 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
-sha256	2df90e99da45211c7b2525ae4ac34830a9e7784bd48c072c406c0cf014bdb277  gst-plugins-good-1.4.4.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
+sha256	79b1b5f3f7bcaa8a615202eb5e176121eeb8336960f70687e536ad78dbc7e641  gst-plugins-good-1.4.5.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index fc7d336..d9b4438 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.4.4
+GST1_PLUGINS_GOOD_VERSION = 1.4.5
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
