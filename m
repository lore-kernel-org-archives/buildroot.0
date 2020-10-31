From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Oct 2020 01:09:57 +0100
Subject: [Buildroot] [PATCH v1 02/11] package/gst1-plugins-base: bump
 version to 1.18.1
In-Reply-To: <20201031001006.21829-1-ps.report@gmx.net>
References: <20201031001006.21829-1-ps.report@gmx.net>
Message-ID: <20201031001006.21829-2-ps.report@gmx.net>
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
index 74438e0a3c..87f0d4e580 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.0.tar.xz.sha256sum
-sha256  762abdd1a950809a1cea62fff7f86b5f7d6bd5f6841e3e585c700b823cdb7897  gst-plugins-base-1.18.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.1.tar.xz.sha256sum
+sha256  1ba654d7de30f7284b4c7071b32f881b609733ce02ab6d9d9ea29386a036c641  gst-plugins-base-1.18.1.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 965e56942d..f5b0e0a4e2 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.18.0
+GST1_PLUGINS_BASE_VERSION = 1.18.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.29.0
