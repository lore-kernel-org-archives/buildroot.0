From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:39:06 +0100
Subject: [Buildroot] [git commit] gst-plugins-good: add legal info
Message-ID: <20151126214030.3AE1881F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c296d348872b534ef9b154340c656185c9555182
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer/gst-plugins-good/gst-plugins-good.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
