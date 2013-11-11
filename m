From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 11:28:04 +0100
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version
Message-ID: <20131111110425.E1A5B9B9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df3c6ee6245de10b6f60add7c8581bc46244e287
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 223af2f..3c1d826 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.2.0
+GST1_PLUGINS_BASE_VERSION = 1.2.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
