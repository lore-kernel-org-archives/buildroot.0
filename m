From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 05:07:19 -0500
Subject: [Buildroot] [PATCH v2 5/8] package/gst1-plugins-bayer2rgb-neon:
 remove 'v' prefix
In-Reply-To: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027100722.64156-5-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1->v2
 - Cleaned up title
---
 .../gst1-plugins-bayer2rgb-neon.mk                            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index e430865e31..d6c3c36272 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAYER2RGB_NEON_VERSION = v0.3
-GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.3
+GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-v$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
 GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
-- 
2.17.1
