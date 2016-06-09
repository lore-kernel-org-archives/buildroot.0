From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jun 2016 18:49:17 -0300
Subject: [Buildroot] [PATCH 3/7] gst1-plugins-good: bump to version 1.8.2
In-Reply-To: <1465508961-19204-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465508961-19204-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465508961-19204-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 425fb92..404ee07 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.8.1.tar.xz.sha256sum
-sha256	2103e17921d67894e82eafdd64fb9b06518599952fd93e625bfbc83ffead0972  gst-plugins-good-1.8.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.8.2.tar.xz.sha256sum
+sha256	8d7549118a3b7a009ece6bb38a05b66709c551d32d2adfd89eded4d1d7a23944  gst-plugins-good-1.8.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 969caa9..6dc322b 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.8.1
+GST1_PLUGINS_GOOD_VERSION = 1.8.2
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.7.3
