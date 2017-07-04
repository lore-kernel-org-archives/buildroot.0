From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  4 Jul 2017 14:19:11 +0200
Subject: [Buildroot] [PATCH 05/10] gst1-plugins-base: bump version to 1.12.1
In-Reply-To: <20170704121916.28441-1-peter@korsgaard.com>
References: <20170704121916.28441-1-peter@korsgaard.com>
Message-ID: <20170704121916.28441-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index b0fc90a87f..d3dcb34d74 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.0.tar.xz.sha256sum
-sha256 345fc6877f54b8b6e97aacf2996be37a51a0e369f53fc2cf83108af9f764364d  gst-plugins-base-1.12.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.1.tar.xz.sha256sum
+sha256 0cce9fadb574a840b3c9d31b69faf57aad6c5543c3b134a7b935de866c9e0465  gst-plugins-base-1.12.1.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 9fb5b17cae..e9b09f53a1 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.0
+GST1_PLUGINS_BASE_VERSION = 1.12.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.11.0
