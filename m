From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20140424113619.877BA9C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11484e516edf179cd08b711b27f9b2eba417a14d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug reports fixed in this release:

      * 725104 : qtdemux: reverse playback and video stream switching failure
      * 722185 : souphttpsrc: racy " server does not support seeking " error
      * 724619 : crash when reading the device name property of pulsesink
      * 725124 : rtspsrc: Fix deadlock when task creation is no successful
      * 725712 : rtpsession: Crash when RTCP FIR received with unknown SSRC
      * 725860 : v4l2src: Fix using v4l2src with Hauppauge HDPVR video capture device
      * 726777 : rtpjpegpay: payload size not correctly calculated
      * 728017 : [regression]eos event could not be send out from gstrtpjitterbuffer.
      * 728041 : rtph264depay: marks all output buffers as delta units when outputting avc format
      * 724638 : aacparse : Missing resilience when no audio frame is found
      * 727329 : check: souphttpsrc: unknown type name ???SoupStatus???

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-good/gst1-plugins-good.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 2b7f032..2cf8ca8 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.2.3
+GST1_PLUGINS_GOOD_VERSION = 1.2.4
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
