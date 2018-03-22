From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 22 Mar 2018 13:32:15 -0400
Subject: [Buildroot] [PATCH v4 3/8] gst-omx: bump to 1.14.0
In-Reply-To: <20180322173220.31791-1-aduskett@gmail.com>
References: <20180322173220.31791-1-aduskett@gmail.com>
Message-ID: <20180322173220.31791-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - none

 package/gstreamer1/gst-omx/gst-omx.hash | 5 +++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index c4f8b10bce..4df0583b44 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.4.tar.xz.sha256sum
-sha256 a025fa24242ec868fe0ff1e66d806a1070bcbc7c14a987a89cdc3395d0d56d5f gst-omx-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.0.tar.xz.sha256sum
+sha256 4d43c354087cb77924982943e34e0d47294b5570304db11fd8b268b53bcff693 gst-omx-1.14.0.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 68cb7f6696..81192eeca6 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.4
+GST_OMX_VERSION = 1.14.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.14.3
