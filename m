From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:16:25 +0100
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version
Message-ID: <20141229150126.EF45C7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e856b801579ad87b4957cff1394972d6a82cfe4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-base/gst1-plugins-base.hash       |    4 ++--
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 84c003c..4d5d63b 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
-sha256	49cd9e8f23c416b1607b43837a09833fa03e0106929d81ead2ddfde6c0ade44b  gst-plugins-base-1.4.4.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
+sha256	77bd8199e7a312d3d71de9b7ddf761a3b78560a2c2a80829d0815ca39cbd551d  gst-plugins-base-1.4.5.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 35c95a6..9c833fc 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.4.4
+GST1_PLUGINS_BASE_VERSION = 1.4.5
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
