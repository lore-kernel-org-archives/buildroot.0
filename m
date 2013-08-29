From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 23:12:48 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version
Message-ID: <20130831213338.0036F9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90fb70b4c37ad3a3178b51c7941881aa8dfd8fa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 493ee71..e666d61 100644
--- a/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.0.9
+GST1_PLUGINS_UGLY_VERSION = 1.0.10
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
