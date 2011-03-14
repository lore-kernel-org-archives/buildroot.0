From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Mar 2011 23:36:43 +0100
Subject: [Buildroot] [git commit master 1/1] gst-plugins-good: bump version
Message-ID: <20110314223657.9E95B90015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9e1c8ad85edb69735da151276e086b599d77e2ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes v4l2src building with 2.6.38-rc1+ kernel headers.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 10044e7..8fbd120 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,7 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.27
+GST_PLUGINS_GOOD_VERSION = 0.10.28
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
-- 
1.7.3.4
