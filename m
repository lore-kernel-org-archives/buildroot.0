From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 21:46:32 +0200
Subject: [Buildroot] [PATCH v1 08/10] gst1-vaapi: bump version to 1.12.2
In-Reply-To: <20170724194634.5565-1-ps.report@gmx.net>
References: <20170724194634.5565-1-ps.report@gmx.net>
Message-ID: <20170724194634.5565-8-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 9f8b9f1bdb..11f25cf65f 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.1.tar.xz.sha256sum
-sha256 de4e9697a856660ccbf27f45ffa86b1a97af426f7823ec65a48f2e9daac9e4a1  gstreamer-vaapi-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.2.tar.xz.sha256sum
+sha256 23c714e0474b3c7ae6ff8884aebf8503a1bc3ded335fa2d2b2ac31788466163a gstreamer-vaapi-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 281cb99668..e212ae9ba1 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.1
+GST1_VAAPI_VERSION = 1.12.2
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.11.0
