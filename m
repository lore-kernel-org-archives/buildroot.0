From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 18 Nov 2015 09:39:09 -0300
Subject: [Buildroot] [PATCH 3/6] gst-plugins-good: add legal info
In-Reply-To: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1447850352-26299-3-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gst-plugins-good/gst-plugins-good.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
index fee83a1..a686caf 100644
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
+++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
@@ -7,6 +7,8 @@
 GST_PLUGINS_GOOD_VERSION = 0.10.31
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
+GST_PLUGINS_GOOD_LICENSE = LGPLv2.1+
+GST_PLUGINS_GOOD_LICENSE_FILES = COPYING
 
 GST_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-examples \
-- 
2.4.10
