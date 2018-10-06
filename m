From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:14:56 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump version to 1.14.4
Message-ID: <20181006131815.14FD98D1CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3761682f9bc5f3d0a854620f89a6253b8c028600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index f0bdba5d23..87bb294629 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.3.tar.xz.sha256sum
-sha256 0910f75de9028edb9f1ba0571470482365ff0c9e5373506780ea38ba0cc9f703 gst-validate-1.14.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.4.tar.xz.sha256sum
+sha256 18dccca94bdc0bab3cddb07817bd280df7ab4abbec9a83b92620367a22d955c7 gst-validate-1.14.4.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 74ed663998..0f3d251782 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.14.3
+GST1_VALIDATE_VERSION = 1.14.4
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
