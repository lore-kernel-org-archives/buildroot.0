From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] gst1-libav: bump version
Message-ID: <20140424113619.A9B1B9C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5d0067a7f48b2baabcdd40a80f1dbbfaf4f8715
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug reports fixed in this release:

      * 727779 : avdec_h264, matroskademux: crash while seeking (1.2 regression)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 50dd1df..121f2ee 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.2.3
+GST1_LIBAV_VERSION = 1.2.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
