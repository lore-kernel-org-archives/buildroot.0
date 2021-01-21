From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2021 16:48:26 +0100
Subject: [Buildroot] [PATCH-2020.02.x 08/11] package/gst1-vaapi: bump
 version to 1.16.3
In-Reply-To: <20210121154829.9353-1-peter@korsgaard.com>
References: <20210121154829.9353-1-peter@korsgaard.com>
Message-ID: <20210121154829.9353-8-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index f9bec2483a..fa8fe8e405 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.16.2.tar.xz.sha256sum
-sha256 191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601 gstreamer-vaapi-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.16.3.tar.xz.sha256sum
+sha256 77200b3c183fe97cd987deb5544e615873cff5e98ec87573583771e5f1fb9ebe gstreamer-vaapi-1.16.3.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 00a6ec5e0e..01b884dca0 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.16.2
+GST1_VAAPI_VERSION = 1.16.3
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.20.1
