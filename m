From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: bump version
Message-ID: <20140424113619.8DB689C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca8c5b6e3bbf4efcfa3e8a68bed6887ea6e38095
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug reports fixed in this release:

      * 724013 : Don't hardcode /usr/share/sounds/sf2 path in fluiddec
      * 725137 : hlsdemux: fails to compute media playlist URL if there is a query parameter
      * 725140 : hlsdemux: fails to correctly parse CODECS and RESOLUTION

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f66c250..25289d2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.2.3
+GST1_PLUGINS_BAD_VERSION = 1.2.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
