From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 20 Mar 2017 20:41:17 +0530
Subject: [Buildroot] [PATCH 1/3] gst1-vaapi: bump version to 1.10.4
Message-ID: <1490022679-28301-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index f3c6252..5409c2e 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.10.3.tar.xz.sha256sum
-sha256 cea827066a152a6afa1d0c43544dfbda285238156d4c3b77f9d4037bbe79361e  gstreamer-vaapi-1.10.3.tar.xz
+# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.10.4.tar.xz.sha256sum
+sha256 03e690621594d9f9495d86c7dac8b8590b3a150462770ed070dc76f66a70de75  gstreamer-vaapi-1.10.4.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 11ad4c4..89f063d 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.10.3
+GST1_VAAPI_VERSION = 1.10.4
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPLv2.1+
-- 
2.6.2
