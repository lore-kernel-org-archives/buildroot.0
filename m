From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 23:11:05 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version
Message-ID: <20130831213337.D9ED79B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f62c9f2c1bd3859665b2a85e2b1720572b04931f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
index 4a9e234..d3aebda 100644
--- a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.0.9
+GST1_PLUGINS_BASE_VERSION = 1.0.10
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
