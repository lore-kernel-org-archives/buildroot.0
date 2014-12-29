From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:21:00 +0100
Subject: [Buildroot] [git commit] gst1-libav: bump version
Message-ID: <20141229150127.2B048807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=869027653a02c195eb45310a0dfbc2875c0f3c3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash |    4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 346698d..c1a757b 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
-sha256	2ec7285e5ec6731963b0955487cceb9eb04e285ca682f3ef575996c068cde8aa  gst-libav-1.4.4.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
+sha256	605c62624604f3bb5c870844cc1f2711779cc533b004c2aa1d8c0d58557afbbc  gst-libav-1.4.5.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index ffa9cad..8d71677 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.4.4
+GST1_LIBAV_VERSION = 1.4.5
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
