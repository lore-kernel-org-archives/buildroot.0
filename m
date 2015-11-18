From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 18 Nov 2015 09:39:10 -0300
Subject: [Buildroot] [PATCH 4/6] gst-plugins-bad: add legal info
In-Reply-To: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1447850352-26299-4-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Even though COPYING.LIB is LGPLv2+ some code files state v2.1+

Signed-off-by: Gustavo Zacarias <gustavo@zacarias@free-electrons.com>
---
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 0a85603..28bcc1d 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -7,6 +7,8 @@
 GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+GST_PLUGINS_BAD_LICENSE = GPLv2+ LGPLv2+ LGPLv2.1+
+GST_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 
 GST_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples
-- 
2.4.10
