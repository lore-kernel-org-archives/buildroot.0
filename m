From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:55:28 +0200
Subject: [Buildroot] [git commit] gstreamer1: switch URLs to https
Message-ID: <20160906195532.ED5A981916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76f2bd4a2139dc617306fe9d38692a7aaca90b7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to avoid pointless redirects since they're 301.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst-omx/gst-omx.mk                     | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk               | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
 package/gstreamer1/gst1-validate/gst1-validate.mk         | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk               | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index f008767..4ca4416 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -6,7 +6,7 @@
 
 GST_OMX_VERSION = 1.2.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
-GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx
+GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
 GST_OMX_LICENSE = LGPLv2.1
 GST_OMX_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index c535952..5706c64 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -6,7 +6,7 @@
 
 GST1_LIBAV_VERSION = 1.8.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
-GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
+GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
 GST1_LIBAV_DEPENDENCIES = \
 	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ca2dbfa..eb935bc 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -6,7 +6,7 @@
 
 GST1_PLUGINS_BAD_VERSION = 1.8.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
-GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 3416e94..5a35897 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -6,7 +6,7 @@
 
 GST1_PLUGINS_BASE_VERSION = 1.8.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
-GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
+GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
 GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPLv2.1+
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 05f2650..b4bc2e4 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -6,7 +6,7 @@
 
 GST1_PLUGINS_GOOD_VERSION = 1.8.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
-GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
+GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPLv2.1+
 
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 2e9891e..4a67a73 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -6,7 +6,7 @@
 
 GST1_PLUGINS_UGLY_VERSION = 1.8.3
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
-GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
 # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
 GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 72daa45..372e5d6 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -6,7 +6,7 @@
 
 GST1_VALIDATE_VERSION = 1.8.3
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
-GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
+GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
 GST1_VALIDATE_LICENSE_FILES = COPYING
 
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 4036825..d69c3e8 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -6,7 +6,7 @@
 
 GSTREAMER1_VERSION = 1.8.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
-GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
+GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPLv2+, LGPLv2.1+
