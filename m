From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  4 Jul 2017 14:19:09 +0200
Subject: [Buildroot] [PATCH 03/10] gst-omx: bump version to 1.12.1
In-Reply-To: <20170704121916.28441-1-peter@korsgaard.com>
References: <20170704121916.28441-1-peter@korsgaard.com>
Message-ID: <20170704121916.28441-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 8c6d1e9f5b..43c112c726 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.0.tar.xz.sha256sum
-sha256 acee8c8a88b995fb95601b7b43bf0c83f502d9026bca5705f9c0dc44a757997e  gst-omx-1.12.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.1.tar.xz.sha256sum
+sha256 13faf0eb679c37a01f64c47f23018c2d894fa0ff1c3b98d4b1d1c69a7b3ca183  gst-omx-1.12.1.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 2800592a33..66cb20b328 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.0
+GST_OMX_VERSION = 1.12.1
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.11.0
