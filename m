From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Mar 2012 23:05:53 +0100
Subject: [Buildroot] [git commit] gst-plugins-good: bump version
Message-ID: <20120314220942.27DC190D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf15b5340f0a46d567ed19137d2c565bd13f655f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-good/gst-plugins-good.mk           |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index c7afed4..4e6b73e 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,7 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.30
+GST_PLUGINS_GOOD_VERSION = 0.10.31
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
@@ -21,8 +21,7 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 		--disable-aalibtest \
 		--disable-esd \
 		--disable-esdtest \
-		--disable-shout2 \
-		--disable-shout2test
+		--disable-shout2
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
