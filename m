From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 11:48:41 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/gst-omx: bump
 version to 1.16.3
Message-ID: <20210122103053.A77A6818BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f3a71001401464c4b05afdc23568b6b9cfe778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 85487f3491..b9de59a828 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.2.tar.xz.sha256sum
-sha256 11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439 gst-omx-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.3.tar.xz.sha256sum
+sha256 60603b7889528ef8539d36cb3284b648c46aa0cf980a28cba4d3fe3a44988ff9 gst-omx-1.16.3.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 5ed9e3ce2c..2196c138c0 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.16.2
+GST_OMX_VERSION = 1.16.3
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
