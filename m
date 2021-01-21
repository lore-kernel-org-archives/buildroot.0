From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2021 16:48:20 +0100
Subject: [Buildroot] [PATCH-2020.02.x 02/11] package/gst1-plugins-base: bump
 version to 1.16.3
In-Reply-To: <20210121154829.9353-1-peter@korsgaard.com>
References: <20210121154829.9353-1-peter@korsgaard.com>
Message-ID: <20210121154829.9353-2-peter@korsgaard.com>
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
index 2074c0272b..2d514a74bb 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.2.tar.xz.sha256sum
-sha256 b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a gst-plugins-base-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.3.tar.xz.sha256sum
+sha256 9f02678b0bbbcc9eff107d3bd89d83ce92fec2154cd607c7c8bd34dc7fee491c gst-plugins-base-1.16.3.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 42fe09bf57..59a136f737 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.16.2
+GST1_PLUGINS_BASE_VERSION = 1.16.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.20.1
