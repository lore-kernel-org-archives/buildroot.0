From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2021 16:48:25 +0100
Subject: [Buildroot] [PATCH-2020.02.x 07/11] package/gst1-libav: bump
 version to 1.16.3
In-Reply-To: <20210121154829.9353-1-peter@korsgaard.com>
References: <20210121154829.9353-1-peter@korsgaard.com>
Message-ID: <20210121154829.9353-7-peter@korsgaard.com>
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
index 15e4d859ee..fe85185178 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.2.tar.xz.sha256sum
-sha256 c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2 gst-libav-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.3.tar.xz.sha256sum
+sha256 d10c5eb1a00a91de97c85c0956c663aa6e99d268195cdec4534c179b831538ec gst-libav-1.16.3.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index fdd4d6cc2e..72aa37a4b0 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.16.2
+GST1_LIBAV_VERSION = 1.16.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 
-- 
2.20.1
