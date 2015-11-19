From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 19 Nov 2015 19:14:20 -0300
Subject: [Buildroot] [PATCH v2 4/5] gst-plugins-bad: add legal info
In-Reply-To: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1447971261-26290-4-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Even though COPYING.LIB is LGPLv2+ many code files state v2.1+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 0a85603..fa2f124 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -7,6 +7,9 @@
 GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+# COPYING.LIB is in fact v2, but most of the code is v2.1+
+GST_PLUGINS_BAD_LICENSE = LGPLv2.1+, GPLv2+
+GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
 
 GST_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples
-- 
2.4.10
