From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 23:19:43 +0100
Subject: [Buildroot] [git commit] gst-ffmpeg: bump to version 0.10.13
Message-ID: <20111210222041.190818F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a9d409aba0c1d30645204d163517044fd56a7e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index 41a7f3b..c955632 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-GST_FFMPEG_VERSION = 0.10.11
+GST_FFMPEG_VERSION = 0.10.13
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
+GST_FFMPEG_DEPENDENCIES = host-pkg-config gstreamer gst-plugins-base ffmpeg
 GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
