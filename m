From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:39:09 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: add legal info
Message-ID: <20151126214030.43C1F81E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cb83e662ac39fd218ce322c2300ddb37113bb4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though COPYING.LIB is LGPLv2+ many code files state v2.1+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer/gst-plugins-bad/gst-plugins-bad.mk   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
