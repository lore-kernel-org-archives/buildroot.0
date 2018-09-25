From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:06:01 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version to 1.14.3
Message-ID: <20180925211615.4C5AF88E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4527471251a9c4c36781a4241a391c7320b5defa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 6e13f97a9f..a98abdf38b 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.2.tar.xz.sha256sum
-sha256 a4b7e80ba869f599307449b17c9e00b5d1e94d3ba1d8a1a386b8770b2ef01c7c gst-plugins-base-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.3.tar.xz.sha256sum
+sha256 f0b319c36be0ffc2a00380c77ba269cdf04e2b39bbc49d30b641fc35aa0b7952 gst-plugins-base-1.14.3.tar.xz
 sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 10b1fec439..862ae5e6e8 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.14.2
+GST1_PLUGINS_BASE_VERSION = 1.14.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
