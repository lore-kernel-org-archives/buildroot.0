From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] gst1-plugings-base: bump version
Message-ID: <20140424113619.80A8B9C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45b87a63418748569e7f0f3dc2a1f86d0b573f60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug reports fixed in this release:

      * 693263 : typefinding: MPEG-2 video ES detected as H.263
      * 683504 : playsink: deadlock when disabling subtitles and suboptimal disabling of subtitles
      * 700770 : typefinding: mp3 file mis-detected as h263 video
      * 723597 : tagdemux: Seek event in GST_FORMAT_TIME are converted to BYTES to early
      * 724633 : oggdemux: ignores last page in push mode
      * 724720 : rtspconnection: not possible to disconnect/reconnect read connection in tunneled mode
      * 725313 : rtspconnection: closed() callback is never called in tunneled mode
      * 725644 : typefinding: mp3 file is misdetected as H.263
      * 726642 : rtspconnection: minor memory leak in error handling
      * 727025 : adder: rework the logic to check if eos has to be sent.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 72e4514..326e5a1 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.2.3
+GST1_PLUGINS_BASE_VERSION = 1.2.4
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
