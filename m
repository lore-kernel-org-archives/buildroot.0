From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  1 Jan 2018 11:17:22 -0500
Subject: [Buildroot] [PATCH 10/10] gst1-validate: bump to 1.12.4
In-Reply-To: <20180101161722.12637-1-Adamduskett@outlook.com>
References: <20180101161722.12637-1-Adamduskett@outlook.com>
Message-ID: <20180101161722.12637-10-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index c726c17252..50bddd0a9f 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.3.tar.xz.sha256sum
-sha256 5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e gst-validate-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.4.tar.xz.sha256sum
+sha256 f9da9dfe6e5d6f5ba3b38c5752b42d3f927715904942b405c2924d3cb77afba1 gst-validate-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 33fec08d12..d276490160 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.3
+GST1_VALIDATE_VERSION = 1.12.4
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
-- 
2.14.3
