From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:39:26 +0100
Subject: [Buildroot] [git commit] gst-plugins-ugly: add legal info
Message-ID: <20151126214030.4D7FB81E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1ad8c516698db92e8755a69bc182c318c3c47e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though COPYING is LGPLv2.1+ many code files state v2+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
