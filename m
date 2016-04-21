From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:02:54 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump to version 1.8.1
Message-ID: <20160421200306.3BA5F7FE1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79131bef59f68a8d81bff9ec413f2e6f15ab609c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 28e78de..07f8ced 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.0.tar.xz.sha256sum
-sha256 7666b777bd4b05efe4520ef92669169d8879f69a68606578ec667ae7dc4d9edd  gst-validate-1.8.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.1.tar.xz.sha256sum
+sha256 a9b208c014cca2dc515599f01fd3a7a294133fd936366e74f439b9bc96a1ccbf  gst-validate-1.8.1.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index e7f1f51..37eb567 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.8.0
+GST1_VALIDATE_VERSION = 1.8.1
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
