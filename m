From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  3 Oct 2019 16:48:38 +0200
Subject: [Buildroot] [PATCH v1 11/11] gst-omx: bump version to 1.16.1
In-Reply-To: <20191003144838.22437-1-ps.report@gmx.net>
References: <20191003144838.22437-1-ps.report@gmx.net>
Message-ID: <20191003144838.22437-11-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 2d28c9587b..a9675b7ad2 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.0.tar.xz.sha256sum
-sha256 fef77cddc02784608451c46b9def880b63230a246decf8900f2da2ed54a8af4a gst-omx-1.16.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.1.tar.xz.sha256sum
+sha256 cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2 gst-omx-1.16.1.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index b9e1899201..596305aa9c 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GST_OMX_VERSION = 1.16.0
+GST_OMX_VERSION = 1.16.1
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx

--
2.23.0
