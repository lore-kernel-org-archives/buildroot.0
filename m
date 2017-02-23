From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 15:55:25 -0300
Subject: [Buildroot] [PATCH master 5/9] gst1-plugins-ugly: security bump to
	version 1.10.4
In-Reply-To: <20170223185529.14129-1-gustavo@zacarias.com.ar>
References: <20170223185529.14129-1-gustavo@zacarias.com.ar>
Message-ID: <20170223185529.14129-6-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2017-5847 - The gst_asf_demux_process_ext_content_desc function in
gst/asfdemux/gstasfdemux.c in gst-plugins-ugly in GStreamer allows remote
attackers to cause a denial of service (out-of-bounds heap read) via vectors
involving extended content descriptors.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 6b4f0c7..9567d9c 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.10.3.tar.xz.sha256sum
-sha256 c91597d03abff9df435ad4892eae44df1ee14159c7cc7317ac9d2766ff446bd2  gst-plugins-ugly-1.10.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.10.4.tar.xz.sha256sum
+sha256 6386c77ca8459cba431ed0b63da780c7062c7cc48055d222024d8eaf198ffa59  gst-plugins-ugly-1.10.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 2f68145..d503555 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.10.3
+GST1_PLUGINS_UGLY_VERSION = 1.10.4
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.10.2
