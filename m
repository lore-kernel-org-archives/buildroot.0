From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jan 2017 13:45:08 -0300
Subject: [Buildroot] [PATCH 7/9] gst1-validate: bump to version 1.10.3
In-Reply-To: <20170130164510.17184-1-gustavo@zacarias.com.ar>
References: <20170130164510.17184-1-gustavo@zacarias.com.ar>
Message-ID: <20170130164510.17184-7-gustavo@zacarias.com.ar>
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
index 70b868f..164ee2d 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.2.tar.xz.sha256sum
-sha256 be274418d78694cecb1be6c860f3f499baa4313eece60a654507ab14d6989ed7  gst-validate-1.10.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.3.tar.xz.sha256sum
+sha256 be6b48569324c541266310e7e6d1098b1a2ec7cd06b9e95b6701c96bc4562c02  gst-validate-1.10.3.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 69a78bd..695e53e 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.10.2
+GST1_VALIDATE_VERSION = 1.10.3
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
-- 
2.10.2
