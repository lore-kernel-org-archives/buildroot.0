From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  7 Dec 2014 23:54:46 +0100
Subject: [Buildroot] [PATCH 3/6] gst1-plugins-good: bump version
In-Reply-To: <1417992889-11344-1-git-send-email-peter@korsgaard.com>
References: <1417992889-11344-1-git-send-email-peter@korsgaard.com>
Message-ID: <1417992889-11344-4-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 27d6c44..4303a71 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
-sha256	5876a74402f2a24d1d3ae9163c32466bdc7a565696dddeef65e6a9a93efc5537	gst-plugins-good-1.4.3.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
+sha256	2df90e99da45211c7b2525ae4ac34830a9e7784bd48c072c406c0cf014bdb277  gst-plugins-good-1.4.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 7c40b99..fc7d336 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.4.3
+GST1_PLUGINS_GOOD_VERSION = 1.4.4
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.1.3
