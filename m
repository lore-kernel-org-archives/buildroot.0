From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:19:45 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version
Message-ID: <20141229150127.207E8807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e0d2e18be9cb698161537bfe37c45537afc14e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |    4 ++--
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index bc2478d..a031dc5 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
-sha256	afe2300130aaba910b8d5fab8d1fdf8b001ff4893ec1ac57b5d8766836cd81e9  gst-plugins-ugly-1.4.4.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
+sha256	5cd5e81cf618944f4dc935f1669b2125e8bb2fe9cc7dc8dc15b72237aca49067  gst-plugins-ugly-1.4.5.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 1a4bdcd..daa9e3f 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.4.4
+GST1_PLUGINS_UGLY_VERSION = 1.4.5
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
