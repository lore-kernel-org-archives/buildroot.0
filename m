From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 09:50:09 -0300
Subject: [Buildroot] [PATCH 05/10] gst1-plugins-bad: bump to version 1.8.0
In-Reply-To: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458910214-10963-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index b1a80f5..d2acaa7 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.6.3.tar.xz.sha256sum
-sha256	971b29101d6a9c5e3fe94d99d977a227f58f0b2d29b6ca2c7f292052542b3a61  gst-plugins-bad-1.6.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.8.0.tar.xz.sha256sum
+sha256	116376dd1085082422e0b21b0ecd3d1cb345c469c58e32463167d4675f4ca90e  gst-plugins-bad-1.8.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 3a097e8..55b4d6f 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.6.3
+GST1_PLUGINS_BAD_VERSION = 1.8.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.7.3
