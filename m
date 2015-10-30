From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Oct 2015 16:40:46 -0300
Subject: [Buildroot] [PATCH 3/6] gst1-plugins-good: bump to version 1.6.1
In-Reply-To: <1446234049-15155-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446234049-15155-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1446234049-15155-3-git-send-email-gustavo@zacarias.com.ar>
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
index bcc321a..41efd4a 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.6.0.tar.xz.sha256sum
-sha256	a0915639595305e48884656e22b16fda7c6892aa02cdb3eb43e23dab6e6b81fa  gst-plugins-good-1.6.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.6.1.tar.xz.sha256sum
+sha256	86d4b814099f7b7b16be19d4b94fa41002ac01fdf1525b07c5764d54c0605935  gst-plugins-good-1.6.1.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index fbc338a..f9de566 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.6.0
+GST1_PLUGINS_GOOD_VERSION = 1.6.1
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.4.10
