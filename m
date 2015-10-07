From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  7 Oct 2015 23:30:04 +0200
Subject: [Buildroot] [PATCH v1 6/7] gst1-libav: bump version to 1.6.0
In-Reply-To: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
References: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444253405-3994-6-git-send-email-ps.report@gmx.net>
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
index c1a757b..9f6473b 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
-sha256	605c62624604f3bb5c870844cc1f2711779cc533b004c2aa1d8c0d58557afbbc  gst-libav-1.4.5.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.6.0.tar.xz.sha256sum
+sha256	6cca6cf73182a882768ef0c860af88c2fd2c77e2c81ce464a998ab4e6baa604c  gst-libav-1.6.0.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 8d71677..ffd13b5 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.4.5
+GST1_LIBAV_VERSION = 1.6.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
-- 
2.1.4
