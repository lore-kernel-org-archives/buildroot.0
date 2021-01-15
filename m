From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Jan 2021 23:54:02 +0100
Subject: [Buildroot] [PATCH v1 07/12] package/gst1-libav: bump version to
 1.18.3
In-Reply-To: <20210115225407.2350-1-ps.report@gmx.net>
References: <20210115225407.2350-1-ps.report@gmx.net>
Message-ID: <20210115225407.2350-7-ps.report@gmx.net>
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
index 8db0ec6bf5..dcb99fb632 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.2.tar.xz.sha256sum
-sha256  36969ad44c5f0756a8a90215410710d6c39713d58f6cee13d663be9774557f49  gst-libav-1.18.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.3.tar.xz.sha256sum
+sha256  ad20546bcd78ac1e7cf194666d73c4f33efeb62647d2b6af22993b540699e91c  gst-libav-1.18.3.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 74bda64d34..6ec4f3cd65 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.18.2
+GST1_LIBAV_VERSION = 1.18.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.0+
-- 
2.29.2
