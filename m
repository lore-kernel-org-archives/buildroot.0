From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:35 -0300
Subject: [Buildroot] [PATCH 09/14] gst1-plugins-ugly: bump to version 1.10.0
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 1c6aa7d..5784525 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.8.3.tar.xz.sha256sum
-sha256	6fa2599fdd072d31fbaf50c34af406e2be944a010b1f4eab67a5fe32a0310693  gst-plugins-ugly-1.8.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.10.0.tar.xz.sha256sum
+sha256	97de8d1903abb54305732e6b8781c8c42f5cc5a2a548a8f31b38c189e81a55e0  gst-plugins-ugly-1.10.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 4a67a73..40234a1 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.8.3
+GST1_PLUGINS_UGLY_VERSION = 1.10.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.7.3
