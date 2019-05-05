From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 23:31:52 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-validate: bump to
 version 1.16.0
Message-ID: <20190505212653.05B8A81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bdd9174fd79345c114ac9972b7f83bbef9cd366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 87bb294629..d3d1078d5f 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.4.tar.xz.sha256sum
-sha256 18dccca94bdc0bab3cddb07817bd280df7ab4abbec9a83b92620367a22d955c7 gst-validate-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.16.0.tar.xz.sha256sum
+sha256 9331ae48a173a048243539730cc7a88607777762dea4aebbc3ab55981e68d6c9 gst-validate-1.16.0.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 0f3d251782..121190ede9 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.14.4
+GST1_VALIDATE_VERSION = 1.16.0
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
