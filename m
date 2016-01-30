From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 30 Jan 2016 12:45:56 +0100
Subject: [Buildroot] [PATCH 09/10] gst1-plugins-bad: add install to staging
	directory
In-Reply-To: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1454154357-31625-10-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-imx package links against libgstphotography for its imxv4l2src
plugin.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f9f8558..3a097e8 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -7,6 +7,7 @@
 GST1_PLUGINS_BAD_VERSION = 1.6.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
 # enabled.
-- 
2.6.4
