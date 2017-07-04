From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  4 Jul 2017 14:19:08 +0200
Subject: [Buildroot] [PATCH 02/10] gst1-vaapi: bump version to 1.12.1
In-Reply-To: <20170704121916.28441-1-peter@korsgaard.com>
References: <20170704121916.28441-1-peter@korsgaard.com>
Message-ID: <20170704121916.28441-2-peter@korsgaard.com>
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
index 977b18897c..9f8b9f1bdb 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.0.tar.xz.sha256sum
-sha256 4a1a5a174b3d3a76ce6c123203e7ee535a347d77f9d4f4ffaf69bfbbfeb03ddb  gstreamer-vaapi-1.12.0.tar.xz
+# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.1.tar.xz.sha256sum
+sha256 de4e9697a856660ccbf27f45ffa86b1a97af426f7823ec65a48f2e9daac9e4a1  gstreamer-vaapi-1.12.1.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index e92d758363..281cb99668 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.0
+GST1_VAAPI_VERSION = 1.12.1
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.11.0
