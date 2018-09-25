From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Sep 2018 22:36:11 +0200
Subject: [Buildroot] [PATCH v2 07/14] gst1-libav: bump version to 1.14.3
In-Reply-To: <20180925203618.23192-1-ps.report@gmx.net>
References: <20180925203618.23192-1-ps.report@gmx.net>
Message-ID: <20180925203618.23192-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add Signed-off-by
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 944f63d78e..005856969e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.2.tar.xz.sha256sum
-sha256 8a351c39c5cfc2bbd31ca434ec4a290a730a26efbdea962fdd8306dce5c576de gst-libav-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.3.tar.xz.sha256sum
+sha256 9b03529bb45785ad1b6b1f4856c52a832ad5fc472285ce49174439e8015ab677 gst-libav-1.14.3.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 071da40a6e..2f323b938d 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.14.2
+GST1_LIBAV_VERSION = 1.14.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.19.0
