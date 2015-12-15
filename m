From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:43:07 +0100
Subject: [Buildroot] [git commit] gst1-plugins-base: bump to version 1.6.2
Message-ID: <20151215204720.2F86E7FEFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7e588af786fe587847cfee441d354a04e77ac2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 6f21ba9..b487aa7 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.6.1.tar.xz.sha256sum
-sha256	9533dcfaa4ee32d435483d9fa88c06b1eba6e9bb234aacd7583f207199f44ba3  gst-plugins-base-1.6.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.6.2.tar.xz.sha256sum
+sha256	c75dd400e451526ed71e1c4955e33d470a2581f5e71ecf84920a41c0a5c75322  gst-plugins-base-1.6.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 00e1be7..d21b4ae 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.6.1
+GST1_PLUGINS_BASE_VERSION = 1.6.2
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
