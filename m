From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:32:23 +0200
Subject: [Buildroot] [git commit] gst1-libav: bump to 1.12.3
Message-ID: <20171010202508.52C9A7FA46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef3212bf04c97a2795ecf388dff421ae084e4d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 6f176a5..a5a9590 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.2.tar.xz.sha256sum
-sha256 5bb735b9bb218b652ae4071ea6f6be8eaae55e9d3233aec2f36b882a27542db3 gst-libav-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.3.tar.xz.sha256sum
+sha256 015ef8cab6f7fb87c8fb42642486423eff3b6e6a6bccdcd6a189f436a3619650 gst-libav-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 3365c3e..41b35ab 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.2
+GST1_LIBAV_VERSION = 1.12.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
