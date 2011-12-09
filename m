From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2011 11:15:12 -0300
Subject: [Buildroot] [PATCH 2/3] gst-ffmpeg: bump to version 0.10.13
In-Reply-To: <1323440113-17197-1-git-send-email-gustavo@zacarias.com.ar>
References: <1323440113-17197-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1323440113-17197-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
