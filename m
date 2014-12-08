From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Dec 2014 08:53:38 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version
Message-ID: <20141208075633.0158480153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9964db4b351bc0a49819883db0d8f670f7ceeb18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |    4 ++--
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 575336e..bc2478d 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
-sha256	d581592a82cf3930361430d38436c30a58d8b6c249cad18f7f213b203e206d46	gst-plugins-ugly-1.4.3.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
+sha256	afe2300130aaba910b8d5fab8d1fdf8b001ff4893ec1ac57b5d8766836cd81e9  gst-plugins-ugly-1.4.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 3455832..1a4bdcd 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.4.3
+GST1_PLUGINS_UGLY_VERSION = 1.4.4
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
