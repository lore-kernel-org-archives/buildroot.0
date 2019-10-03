From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  3 Oct 2019 16:48:35 +0200
Subject: [Buildroot] [PATCH v1 08/11] gst1-vaapi: bump version to 1.16.1
In-Reply-To: <20191003144838.22437-1-ps.report@gmx.net>
References: <20191003144838.22437-1-ps.report@gmx.net>
Message-ID: <20191003144838.22437-8-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 6c7d2125ce..20564b7088 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.16.0.tar.xz.sha256sum
-sha256 4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f gstreamer-vaapi-1.16.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.16.1.tar.xz.sha256sum
+sha256 cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5abb7603a gstreamer-vaapi-1.16.1.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index bb9a4fd77f..1e8865b756 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GST1_VAAPI_VERSION = 1.16.0
+GST1_VAAPI_VERSION = 1.16.1
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
--
2.23.0
