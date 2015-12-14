From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 11:37:04 -0300
Subject: [Buildroot] [PATCH v2] gst1-plugins-base: comma separate licenses
Message-ID: <1450103824-21002-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
v2: drop -bad changes

 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 3321274..00e1be7 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -9,7 +9,7 @@ GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BASE_LICENSE = LGPLv2+ LGPLv2.1+
+GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPLv2.1+
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
-- 
2.4.10
