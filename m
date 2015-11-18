From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 18 Nov 2015 09:39:08 -0300
Subject: [Buildroot] [PATCH 2/6] gst-plugins-base: add legal info
In-Reply-To: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1447850352-26299-2-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index 08733d1..43e4df0 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -8,6 +8,8 @@ GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
+GST_PLUGINS_BASE_LICENSE = GPLv2+ LGPLv2+
+GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
-- 
2.4.10
