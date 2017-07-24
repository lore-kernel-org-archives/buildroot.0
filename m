From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 21:46:29 +0200
Subject: [Buildroot] [PATCH v1 05/10] gst1-plugins-ugly: bump version to
	1.12.2
In-Reply-To: <20170724194634.5565-1-ps.report@gmx.net>
References: <20170724194634.5565-1-ps.report@gmx.net>
Message-ID: <20170724194634.5565-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 20bd4855bc..a37cde3d2d 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.1.tar.xz.sha256sum
-sha256 8fc2123d059713a34fa5d0a26641fb8158f52f6766633d2db7a661adc88e1069  gst-plugins-ugly-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.2.tar.xz.sha256sum
+sha256 1cc3942bbf3ea87da3e35437d4e014e991b103db22a6174f62a98c89c3f5f466 gst-plugins-ugly-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 2b6905577e..56bc8a6e00 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.12.1
+GST1_PLUGINS_UGLY_VERSION = 1.12.2
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.11.0
