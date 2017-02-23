From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:53:35 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: security bump to
	version 1.10.4
Message-ID: <20170223215424.5179B82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1060ff1c7055a499b5f7ebf97c88268542b68bf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2017-5847 - The gst_asf_demux_process_ext_content_desc function in
gst/asfdemux/gstasfdemux.c in gst-plugins-ugly in GStreamer allows remote
attackers to cause a denial of service (out-of-bounds heap read) via vectors
involving extended content descriptors.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
