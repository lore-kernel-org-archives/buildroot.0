From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 21:46:26 +0200
Subject: [Buildroot] [PATCH v1 02/10] gst1-plugins-base: bump version to
	1.12.2
In-Reply-To: <20170724194634.5565-1-ps.report@gmx.net>
References: <20170724194634.5565-1-ps.report@gmx.net>
Message-ID: <20170724194634.5565-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index d3dcb34d74..5998f0541b 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.1.tar.xz.sha256sum
-sha256 0cce9fadb574a840b3c9d31b69faf57aad6c5543c3b134a7b935de866c9e0465  gst-plugins-base-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.2.tar.xz.sha256sum
+sha256 5067dce3afe197a9536fea0107c77213fab536dff4a213b07fc60378d5510675 gst-plugins-base-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index e9b09f53a1..bd70fca13f 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.1
+GST1_PLUGINS_BASE_VERSION = 1.12.2
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.11.0
