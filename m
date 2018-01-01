From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  1 Jan 2018 11:17:19 -0500
Subject: [Buildroot] [PATCH 07/10] gst1-vaapi: bump to 1.12.4
In-Reply-To: <20180101161722.12637-1-Adamduskett@outlook.com>
References: <20180101161722.12637-1-Adamduskett@outlook.com>
Message-ID: <20180101161722.12637-7-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 97bebaba69..3eebc0afe7 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.3.tar.xz.sha256sum
-sha256 f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d gstreamer-vaapi-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.4.tar.xz.sha256sum
+sha256 1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9 gstreamer-vaapi-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 9783c591aa..6b637416f5 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.3
+GST1_VAAPI_VERSION = 1.12.4
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.14.3
