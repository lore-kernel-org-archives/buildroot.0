From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:12:50 +0100
Subject: [Buildroot] [git commit] gst1-libav: bump to version 1.10.3
Message-ID: <20170130201642.F1E247FA5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e943e1274b4d202185916de3c9ef7158bf492a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 8cda287..9c84630 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.2.tar.xz.sha256sum
-sha256 a3dd7036211f061e1eda04f985b7a9dd1a91b754f767ff2587eb6ec28f44e73c  gst-libav-1.10.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.3.tar.xz.sha256sum
+sha256 9a6bc165b1862b18b98d9f1755c43806e4839a80f69ec7ea9a2dab61b65752a9  gst-libav-1.10.3.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 8687ac6..ec84b77 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.10.2
+GST1_LIBAV_VERSION = 1.10.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
