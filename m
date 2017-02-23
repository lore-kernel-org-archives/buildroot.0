From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 15:55:26 -0300
Subject: [Buildroot] [PATCH master 6/9] gst1-libav: security bump to version
	1.10.4
In-Reply-To: <20170223185529.14129-1-gustavo@zacarias.com.ar>
References: <20170223185529.14129-1-gustavo@zacarias.com.ar>
Message-ID: <20170223185529.14129-7-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It updates to the ffmpeg 3.2.4 codebase, fixing several security bugs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 9c84630..cc83429 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.3.tar.xz.sha256sum
-sha256 9a6bc165b1862b18b98d9f1755c43806e4839a80f69ec7ea9a2dab61b65752a9  gst-libav-1.10.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.4.tar.xz.sha256sum
+sha256 6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b  gst-libav-1.10.4.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index ec84b77..5726bb5 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.10.3
+GST1_LIBAV_VERSION = 1.10.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.10.2
