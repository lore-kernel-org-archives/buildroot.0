From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Aug 2016 21:56:29 -0300
Subject: [Buildroot] [PATCH 3/6] gst1-plugins-good: bump to version 1.8.3
In-Reply-To: <1471654592-16644-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471654592-16644-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1471654592-16644-3-git-send-email-gustavo@zacarias.com.ar>
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
index 404ee07..2e3db3d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.8.2.tar.xz.sha256sum
-sha256	8d7549118a3b7a009ece6bb38a05b66709c551d32d2adfd89eded4d1d7a23944  gst-plugins-good-1.8.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.8.3.tar.xz.sha256sum
+sha256	a1d6579ba203a7734927c24b90bf6590d846c5a5fcec01a48201018c8ad2827a  gst-plugins-good-1.8.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 8d7ff29..05f2650 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.8.2
+GST1_PLUGINS_GOOD_VERSION = 1.8.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.7.3
