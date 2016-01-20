From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 19:18:01 -0300
Subject: [Buildroot] [PATCH 3/6] gst1-plugins-good: bump to version 1.6.3
In-Reply-To: <1453328284-13549-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453328284-13549-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1453328284-13549-3-git-send-email-gustavo@zacarias.com.ar>
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
index c21f391..3d8f943 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.6.2.tar.xz.sha256sum
-sha256	876e54dfce93274b98e024f353258d35fa4d49d1f9010069e676c530f6eb6a92  gst-plugins-good-1.6.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.6.3.tar.xz.sha256sum
+sha256	24b19db70b2a83461ebddfe20033db432dadfdb5d4b54ffb1dfa0d830134a177  gst-plugins-good-1.6.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index c2c69f1..92ce029 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.6.2
+GST1_PLUGINS_GOOD_VERSION = 1.6.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.4.10
