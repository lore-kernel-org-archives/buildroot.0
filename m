From: Eloi Bail <eloi.bail@savoirfairelinux.com>
Date: Thu,  2 Jul 2020 10:36:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-bayer2rgb-neon: bump
 to 0.4
Message-ID: <20200702083619.737-1-eloi.bail@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump gst1-plugins-bayer2rgb-neon to 0.4.

Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>
---
 .../gst1-plugins-bayer2rgb-neon.hash                          | 2 +-
 .../gst1-plugins-bayer2rgb-neon.mk                            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
index 129be67c34..cfb62b062a 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8d317b892bf1c99e9999a6d9b027a22c4ea2940f1ac504c03560b3d476e1c9c8 gst-bayer2rgb-neon-v0.3.tar.bz2
+sha256 307725640203083df7dfb7f9c2b8bb9583accf7b8c06238dd92d6150a9fd8b04 gst-bayer2rgb-neon-0.4.tar.bz2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index 734800a74b..5139463ca1 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.3
-GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-v$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.4
+GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
 GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
-- 
2.17.1
