From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 14:56:54 -0400
Subject: [Buildroot] [PATCH 05/10] gst1-plugins-ugly: bump to 1.12.3
In-Reply-To: <20171009185659.7631-1-Adamduskett@outlook.com>
References: <20171009185659.7631-1-Adamduskett@outlook.com>
Message-ID: <20171009185659.7631-5-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index a37cde3d2d..999166b7ef 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.2.tar.xz.sha256sum
-sha256 1cc3942bbf3ea87da3e35437d4e014e991b103db22a6174f62a98c89c3f5f466 gst-plugins-ugly-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.3.tar.xz.sha256sum
+sha256 e88ca584c94ea78eeecbf3af00ef7f134b66bdee7408aa4aa6c547235e060052 gst-plugins-ugly-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 56bc8a6e00..4b7ef96092 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.12.2
+GST1_PLUGINS_UGLY_VERSION = 1.12.3
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.13.6
