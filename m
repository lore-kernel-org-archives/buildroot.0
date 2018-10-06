From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:14:56 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version to 1.14.4
Message-ID: <20181006131815.0CE0C8D1CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a109c4b3a0102d103bc56daa331811759bd13bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 27205f296f..f93c7e2340 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.3.tar.xz.sha256sum
-sha256 43847fc4d1eae26dd48a6a93d0460146f5f0802582a7e8a9cc66f09dcb0b2306 gst-plugins-ugly-1.14.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.4.tar.xz.sha256sum
+sha256 ac02d837f166c35ff6ce0738e281680d0b90052cfb1f0255dcf6aaca5f0f6d23 gst-plugins-ugly-1.14.4.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 097b87f9fa..2f9b204e9b 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.14.3
+GST1_PLUGINS_UGLY_VERSION = 1.14.4
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
