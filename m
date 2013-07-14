From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 21:47:33 +0200
Subject: [Buildroot] [git commit] gstreamer1/gst1-*: bump version
Message-ID: <20130714194812.C9D3B9A4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c327bdc4e9a9341956a35065c770e401aa484b79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    2 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |    2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 package/multimedia/gstreamer1/gstreamer1.mk        |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
index 1e61bd2..ac77392 100644
--- a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ###############################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.0.7
+GST1_PLUGINS_BAD_VERSION = 1.0.8
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
index 1ab6f1e..1e32867 100644
--- a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.0.7
+GST1_PLUGINS_BASE_VERSION = 1.0.8
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
index 1e6d39b..23fbd80 100644
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ###############################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.0.7
+GST1_PLUGINS_GOOD_VERSION = 1.0.8
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 67761b5..4fcc3d4 100644
--- a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ###############################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.0.7
+GST1_PLUGINS_UGLY_VERSION = 1.0.8
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/multimedia/gstreamer1/gstreamer1.mk
index 71ad08b..1e1564f 100644
--- a/package/multimedia/gstreamer1/gstreamer1.mk
+++ b/package/multimedia/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GSTREAMER1_VERSION = 1.0.7
+GSTREAMER1_VERSION = 1.0.8
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
