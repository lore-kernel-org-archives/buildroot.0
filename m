From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:06:02 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump version to 1.14.3
Message-ID: <20180925211615.6EE1988E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbfba95d38f5a71a22386182361a35bfbc8b931f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 07aa036a21..f0bdba5d23 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.2.tar.xz.sha256sum
-sha256 ea9e423e5470ef85ef8a0aea1714e7abfc49deb2ed282057367484cdeba6f19f gst-validate-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.3.tar.xz.sha256sum
+sha256 0910f75de9028edb9f1ba0571470482365ff0c9e5373506780ea38ba0cc9f703 gst-validate-1.14.3.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index cca3417894..74ed663998 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.14.2
+GST1_VALIDATE_VERSION = 1.14.3
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
