From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 13:53:24 +0100
Subject: [Buildroot] [git commit] gstreamer1/gst-omx: bump version to 1.10.2
Message-ID: <20161201222141.766FA8026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae36ee017402e4eeba381366524dae26baa65bc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index bf10f0a..d52b61f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.1.tar.xz.sha256sum
-sha256 1b07b9ceb4552c0911af1e3b97987e3314c601eacfbc09f1cca8632e98581231  gst-omx-1.10.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.2.tar.xz.sha256sum
+sha256 c069a9cf775c92f889ca8f3b2fc718e428cd0579b7b805851a960c850a7aa497  gst-omx-1.10.2.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index c934317..fcc7058 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.10.1
+GST_OMX_VERSION = 1.10.2
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
