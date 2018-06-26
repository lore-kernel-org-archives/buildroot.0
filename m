From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:17:16 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump to 1.14.1
Message-ID: <20180626211527.6D71F82DDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e34f0d1274dd9180d77d0c00cf3d38838f2ac936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Update to 1.14.1]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 5 +++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 50bddd0a9f..cb1046b9f7 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.4.tar.xz.sha256sum
-sha256 f9da9dfe6e5d6f5ba3b38c5752b42d3f927715904942b405c2924d3cb77afba1 gst-validate-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.1.tar.xz.sha256sum
+sha256 68e3f38f66e0d04837b60090fe5d9ca1127f5df124669f34ca82e241209171e4 gst-validate-1.14.1.tar.xz
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index d276490160..104cc0150d 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.4
+GST1_VALIDATE_VERSION = 1.14.1
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
