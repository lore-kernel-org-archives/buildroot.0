From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  7 Dec 2014 23:54:49 +0100
Subject: [Buildroot] [PATCH 6/6] gst1-libav: bump version
In-Reply-To: <1417992889-11344-1-git-send-email-peter@korsgaard.com>
References: <1417992889-11344-1-git-send-email-peter@korsgaard.com>
Message-ID: <1417992889-11344-7-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 957db83..346698d 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
-sha256	833229d2b1aad6549ad0297435516508cc3ac47b166d6393ecdffc34c31a01d3	gst-libav-1.4.3.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
+sha256	2ec7285e5ec6731963b0955487cceb9eb04e285ca682f3ef575996c068cde8aa  gst-libav-1.4.4.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 1772530..ffa9cad 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.4.3
+GST1_LIBAV_VERSION = 1.4.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
-- 
2.1.3
