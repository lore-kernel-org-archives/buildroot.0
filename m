From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 22 Mar 2018 13:32:19 -0400
Subject: [Buildroot] [PATCH v4 7/8] gst1-validate: bump to 1.14.0
In-Reply-To: <20180322173220.31791-1-aduskett@gmail.com>
References: <20180322173220.31791-1-aduskett@gmail.com>
Message-ID: <20180322173220.31791-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - none

 package/gstreamer1/gst1-validate/gst1-validate.hash | 5 +++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 50bddd0a9f..370809730a 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.4.tar.xz.sha256sum
-sha256 f9da9dfe6e5d6f5ba3b38c5752b42d3f927715904942b405c2924d3cb77afba1 gst-validate-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.0.tar.xz.sha256sum
+sha256 33df08bf77f2895d64b7e8a957de3b930b4da0a8edabfbefcff2eab027eeffdf gst-validate-1.14.0.tar.xz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index d276490160..e1bd8839ee 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.4
+GST1_VALIDATE_VERSION = 1.14.0
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
-- 
2.14.3
