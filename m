From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  4 Oct 2018 23:09:21 +0200
Subject: [Buildroot] [PATCH v1 07/11] gst1-libav: bump version to 1.14.4
In-Reply-To: <20181004210925.25597-1-ps.report@gmx.net>
References: <20181004210925.25597-1-ps.report@gmx.net>
Message-ID: <20181004210925.25597-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 005856969e..741c582319 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.3.tar.xz.sha256sum
-sha256 9b03529bb45785ad1b6b1f4856c52a832ad5fc472285ce49174439e8015ab677 gst-libav-1.14.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.4.tar.xz.sha256sum
+sha256 dfd78591901df7853eab7e56a86c34a1b03635da0d3d56b89aa577f1897865da gst-libav-1.14.4.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 2f323b938d..7ed90a9416 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.14.3
+GST1_LIBAV_VERSION = 1.14.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.19.0
