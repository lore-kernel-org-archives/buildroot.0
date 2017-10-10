From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:28:58 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump to 1.12.3
Message-ID: <20171010202507.E6E5D81181@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=003bcd4c6118db6514696a2c0076f18e69ca9595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 5998f05..7b02be0 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.2.tar.xz.sha256sum
-sha256 5067dce3afe197a9536fea0107c77213fab536dff4a213b07fc60378d5510675 gst-plugins-base-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz.sha256sum
+sha256 d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5 gst-plugins-base-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index bd70fca..19172ab 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.2
+GST1_PLUGINS_BASE_VERSION = 1.12.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
