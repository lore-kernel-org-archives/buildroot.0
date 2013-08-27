From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 21:12:09 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version
Message-ID: <20130831213337.7FEEA9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b7b56d2a15768f05828575d6b47ed99f594fb0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
index 1e32867..4a9e234 100644
--- a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.0.8
+GST1_PLUGINS_BASE_VERSION = 1.0.9
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
