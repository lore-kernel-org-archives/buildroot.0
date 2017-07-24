From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 22:26:43 +0200
Subject: [Buildroot] [PATCH v2 07/10] gst1-libav: bump version to 1.12.2
In-Reply-To: <20170724202646.28628-1-ps.report@gmx.net>
References: <20170724202646.28628-1-ps.report@gmx.net>
Message-ID: <20170724202646.28628-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add missing SOB line
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index bd094440d8..6f176a59ed 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.1.tar.xz.sha256sum
-sha256 55d7823fdf63195de991adfef32db4b8a8bef3cafa46115a951e590dc18a5077  gst-libav-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.2.tar.xz.sha256sum
+sha256 5bb735b9bb218b652ae4071ea6f6be8eaae55e9d3233aec2f36b882a27542db3 gst-libav-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 375f5f0972..3365c3e400 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.1
+GST1_LIBAV_VERSION = 1.12.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.11.0
