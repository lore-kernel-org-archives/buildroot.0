From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  3 Oct 2019 16:48:29 +0200
Subject: [Buildroot] [PATCH v1 02/11] gst1-plugins-base: bump version to
 1.16.1
In-Reply-To: <20191003144838.22437-1-ps.report@gmx.net>
References: <20191003144838.22437-1-ps.report@gmx.net>
Message-ID: <20191003144838.22437-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index b1fc68d93b..d7e16e7d61 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.0.tar.xz.sha256sum
-sha256 4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae gst-plugins-base-1.16.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.1.tar.xz.sha256sum
+sha256 5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b gst-plugins-base-1.16.1.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 90d2478bbc..91b5637316 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GST1_PLUGINS_BASE_VERSION = 1.16.0
+GST1_PLUGINS_BASE_VERSION = 1.16.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
--
2.23.0
