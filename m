From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 18 Nov 2015 09:39:11 -0300
Subject: [Buildroot] [PATCH 5/6] gst-plugins-ugly: add legal info
In-Reply-To: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1447850352-26299-5-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index e8f2362..9662623 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -7,6 +7,8 @@
 GST_PLUGINS_UGLY_VERSION = 0.10.19
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+GST_PLUGINS_UGLY_LICENSE = LGPLv2.1+
+GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
 
 GST_PLUGINS_UGLY_CONF_OPTS = \
 	--disable-examples
-- 
2.4.10
