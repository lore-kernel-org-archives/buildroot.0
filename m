From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Dec 2017 21:56:07 +0100
Subject: [Buildroot] [PATCH 2/4] package/gstreamer1/gst1-vaapi: bump version
 to 1.12.4
In-Reply-To: <20171218205609.17653-1-bernd.kuhls@t-online.de>
References: <20171218205609.17653-1-bernd.kuhls@t-online.de>
Message-ID: <20171218205609.17653-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, this bump will fix build with libva 2.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 6 ++++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 97bebaba69..9a6f4bed93 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.3.tar.xz.sha256sum
-sha256 f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d gstreamer-vaapi-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.4.tar.xz.sha256sum
+sha256 1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9  gstreamer-vaapi-1.12.4.tar.xz
+# Locally computed
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
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
2.11.0
