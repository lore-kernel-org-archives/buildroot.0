From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:58:50 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump to version 1.8.2
Message-ID: <20160609215904.9F33E8027D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b81a4c131336cc256c54f5c5fe2abd8128c2f2eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 07f8ced..2394f8a 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.1.tar.xz.sha256sum
-sha256 a9b208c014cca2dc515599f01fd3a7a294133fd936366e74f439b9bc96a1ccbf  gst-validate-1.8.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.2.tar.xz.sha256sum
+sha256 33c5b585c5ca1659fe6c09fdf02e45d8132c0d386b405bf527b14ab481a0bafe  gst-validate-1.8.2.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 37eb567..ee76817 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.8.1
+GST1_VALIDATE_VERSION = 1.8.2
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
