From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 16:53:46 +0200
Subject: [Buildroot] [git commit] gst-omx: bump version to 1.12.2
Message-ID: <20170725145001.B858B82150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31c52e206d6130a8b7e990afa88279ee606c4378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 43c112c..17ebf1d 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.1.tar.xz.sha256sum
-sha256 13faf0eb679c37a01f64c47f23018c2d894fa0ff1c3b98d4b1d1c69a7b3ca183  gst-omx-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.2.tar.xz.sha256sum
+sha256 1b22398f45a027e977d2b5309625ec91cdcaf0da8751cbc7f596d639a45ba298 gst-omx-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 66cb20b..2805c9a 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.1
+GST_OMX_VERSION = 1.12.2
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
