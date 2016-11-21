From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:12:56 +0100
Subject: [Buildroot] [git commit branch/next] gstreamer1/gst1-omx: bump
	version to 1.10.1
Message-ID: <20161121221640.9A3F580102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98e254b46c2dc31990cd89b7e132b0991db9bc7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
  https://gstreamer.freedesktop.org/releases/gst-omx/1.10.1.html

Also fixed hash URL.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 653c93c..bf10f0a 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/
-sha256  89f7da36abcf278200f561fa9d8d7042ad1459aa211cdc81c4c1a3d2162e9e7f  gst-omx-1.10.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.10.1.tar.xz.sha256sum
+sha256 1b07b9ceb4552c0911af1e3b97987e3314c601eacfbc09f1cca8632e98581231  gst-omx-1.10.1.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index f0b39c9..c934317 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.10.0
+GST_OMX_VERSION = 1.10.1
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
