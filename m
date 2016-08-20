From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Aug 2016 21:56:32 -0300
Subject: [Buildroot] [PATCH 6/6] gst1-validate: bump to version 1.8.3
In-Reply-To: <1471654592-16644-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471654592-16644-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1471654592-16644-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 2394f8a..09061f4 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.2.tar.xz.sha256sum
-sha256 33c5b585c5ca1659fe6c09fdf02e45d8132c0d386b405bf527b14ab481a0bafe  gst-validate-1.8.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.3.tar.xz.sha256sum
+sha256 4525a4fb5b85b8a49674e00d652bee9ac62c56241c148abbff23efa50a224e34  gst-validate-1.8.3.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index ee76817..72daa45 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.8.2
+GST1_VALIDATE_VERSION = 1.8.3
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
-- 
2.7.3
