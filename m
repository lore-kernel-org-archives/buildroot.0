From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 15:55:24 -0300
Subject: [Buildroot] [PATCH master 4/9] gst1-plugins-bad: security bump to
	version 1.10.4
In-Reply-To: <20170223185529.14129-1-gustavo@zacarias.com.ar>
References: <20170223185529.14129-1-gustavo@zacarias.com.ar>
Message-ID: <20170223185529.14129-5-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2017-5848 - The gst_ps_demux_parse_psm function in
gst/mpegdemux/gstmpegdemux.c in gst-plugins-bad in GStreamer allows
remote attackers to cause a denial of service (invalid memory read and
crash) via vectors involving PSM parsing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 2d0f913..441afa2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.10.3.tar.xz.sha256sum
-sha256 24099351fb6984c9e7560de06e072ff2e33d0b2db38b8fcc7afefb536e5094e7  gst-plugins-bad-1.10.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.10.4.tar.xz.sha256sum
+sha256 23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966  gst-plugins-bad-1.10.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index b96bfe9..00add02 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.10.3
+GST1_PLUGINS_BAD_VERSION = 1.10.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.10.2
