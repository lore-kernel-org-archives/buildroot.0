From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 19 Nov 2015 19:14:21 -0300
Subject: [Buildroot] [PATCH v2 5/5] gst-plugins-ugly: add legal info
In-Reply-To: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1447971261-26290-5-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Even though COPYING is LGPLv2.1+ many code files state v2+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index e8f2362..b921dc1 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -7,6 +7,10 @@
 GST_PLUGINS_UGLY_VERSION = 0.10.19
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+# COPYING is in fact LGPLv2.1, but all of the code is v2+
+# (except for one test, xingmux)
+GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPLv2+ (synaesthesia)
+GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
 
 GST_PLUGINS_UGLY_CONF_OPTS = \
 	--disable-examples
-- 
2.4.10
