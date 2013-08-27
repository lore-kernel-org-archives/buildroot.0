From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 21:12:09 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version
Message-ID: <20130831213337.97AE69B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=829d6c498fc0af243975ebe41932d3ec5d95a102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
index c6c927b..493ee71 100644
--- a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.0.8
+GST1_PLUGINS_UGLY_VERSION = 1.0.9
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
