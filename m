From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 16:56:52 +0200
Subject: [Buildroot] [git commit] gst-plugins-ugly: bump version
Message-ID: <20110929190334.137FC8DAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fd3be048d98f2bd1a9fe45734ec413a1852aeb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index ab557a3..c3a3d8b 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -3,7 +3,7 @@
 # gst-plugins-ugly
 #
 #############################################################
-GST_PLUGINS_UGLY_VERSION = 0.10.17
+GST_PLUGINS_UGLY_VERSION = 0.10.18
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 
