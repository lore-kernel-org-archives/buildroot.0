From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Oct 2015 16:40:45 -0300
Subject: [Buildroot] [PATCH 2/6] gst1-plugins-base: bump to version 1.6.1
In-Reply-To: <1446234049-15155-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446234049-15155-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1446234049-15155-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 46e2791..6f21ba9 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.6.0.tar.xz.sha256sum
-sha256	314fd1b707f65caf8eb6164d9422fc51e2b220a890ccd2de6ec03a2883d77231  gst-plugins-base-1.6.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.6.1.tar.xz.sha256sum
+sha256	9533dcfaa4ee32d435483d9fa88c06b1eba6e9bb234aacd7583f207199f44ba3  gst-plugins-base-1.6.1.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 2d646e0..3321274 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.6.0
+GST1_PLUGINS_BASE_VERSION = 1.6.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.4.10
