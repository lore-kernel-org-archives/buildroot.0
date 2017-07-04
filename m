From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 17:02:06 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump version to 1.12.1
Message-ID: <20170704150117.15A1D81842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38e95aa170360850d68459516965b98cc15f3f49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 68781dd..c572d3e 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.0.tar.xz.sha256sum
-sha256 11b73cfff1b315a8e9be1756435ea84937e7cb90afbab0e8e6975367dbfb8534  gst-plugins-bad-1.12.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.1.tar.xz.sha256sum
+sha256 7def8049d1c44e50199023159dfada60af58fd503ef58a020b79044bda705b97  gst-plugins-bad-1.12.1.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 685538d..2e9e6f1 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.0
+GST1_PLUGINS_BAD_VERSION = 1.12.1
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
