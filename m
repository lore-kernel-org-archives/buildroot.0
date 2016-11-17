From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Nov 2016 17:09:05 +0000
Subject: [Buildroot] [PATCH next 9/9] gstreamer1/gst1-omx: bump version to
	1.10.1
In-Reply-To: <20161117170905.4691-1-Vincent.Riera@imgtec.com>
References: <20161117170905.4691-1-Vincent.Riera@imgtec.com>
Message-ID: <20161117170905.4691-9-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
  https://gstreamer.freedesktop.org/releases/gst-omx/1.10.1.html

Also fixed hash URL.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
 
-- 
2.10.1
