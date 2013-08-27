From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 21:12:09 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump version
Message-ID: <20130831213337.90AEC9B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f930018dbbcbf02fc099d5a5df3f12fc2cbcf56d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
index 732cddf..362aed6 100644
--- a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.0.8
+GST1_PLUGINS_BAD_VERSION = 1.0.9
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
