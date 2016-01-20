From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 19:18:03 -0300
Subject: [Buildroot] [PATCH 5/6] gst1-plugins-ugly: bump to version 1.6.3
In-Reply-To: <1453328284-13549-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453328284-13549-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1453328284-13549-5-git-send-email-gustavo@zacarias.com.ar>
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
index 84d3c74..54880b7 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.6.2.tar.xz.sha256sum
-sha256	e7f1b6321c8667fabc0dedce3998a3c6e90ce9ce9dea7186d33dc4359f9e9845  gst-plugins-ugly-1.6.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.6.3.tar.xz.sha256sum
+sha256	2fecf7b7c7882f8f62f1900048f4013f98c214fb3d3303d8d812245bb41fd064  gst-plugins-ugly-1.6.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 64e7e92..b42efcb 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.6.2
+GST1_PLUGINS_UGLY_VERSION = 1.6.3
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.4.10
