From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 20 Mar 2018 10:48:58 -0400
Subject: [Buildroot] [PATCH 5/8] gst1-vaapi: bump to 1.14
In-Reply-To: <20180320144901.9032-1-aduskett@gmail.com>
References: <20180320144901.9032-1-aduskett@gmail.com>
Message-ID: <20180320144901.9032-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 5 +++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 3eebc0afe7..0891ea9a18 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.4.tar.xz.sha256sum
-sha256 1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9 gstreamer-vaapi-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.14.0.tar.xz.sha256sum
+sha256 e4e31f085ef289bf1049398f641345979d20a1b11a80285744bba98504991df2 gstreamer-vaapi-1.14.0.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 6b637416f5..1ee060a578 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.4
+GST1_VAAPI_VERSION = 1.14.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.14.3
