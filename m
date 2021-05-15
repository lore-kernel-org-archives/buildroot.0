From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 11:11:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-rtsp-server: add
 CPE variables
Message-ID: <20210515091118.2363936-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gstreamer_project:gst-rtsp-server is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agstreamer_project%3Agst-rtsp-server

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 95d917fd5c..878195b74d 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -9,6 +9,8 @@ GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
 GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
+GST1_RTSP_SERVER_CPE_ID_VENDOR = gstreamer_project
+GST1_RTSP_SERVER_CPE_ID_PRODUCT = gst-rtsp-server
 GST1_RTSP_SERVER_INSTALL_STAGING = YES
 GST1_RTSP_SERVER_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.30.2
