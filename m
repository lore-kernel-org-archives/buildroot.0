From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 21:46:34 +0200
Subject: [Buildroot] [PATCH v1 10/10] gst-omx: bump version to 1.12.2
In-Reply-To: <20170724194634.5565-1-ps.report@gmx.net>
References: <20170724194634.5565-1-ps.report@gmx.net>
Message-ID: <20170724194634.5565-10-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 43c112c726..17ebf1d0a3 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.1.tar.xz.sha256sum
-sha256 13faf0eb679c37a01f64c47f23018c2d894fa0ff1c3b98d4b1d1c69a7b3ca183  gst-omx-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.2.tar.xz.sha256sum
+sha256 1b22398f45a027e977d2b5309625ec91cdcaf0da8751cbc7f596d639a45ba298 gst-omx-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 66cb20b328..2805c9a93f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.1
+GST_OMX_VERSION = 1.12.2
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.11.0
