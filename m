From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:53:45 +0100
Subject: [Buildroot] [git commit] gst1-validate: bump to version 1.10.4
Message-ID: <20170223215424.7C1A382257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28f11b4852ef21da1a979fa35a999ed687ee0d14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 164ee2d..10c6667 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.3.tar.xz.sha256sum
-sha256 be6b48569324c541266310e7e6d1098b1a2ec7cd06b9e95b6701c96bc4562c02  gst-validate-1.10.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.4.tar.xz.sha256sum
+sha256 e59c00bf64cca9c477cdb44eb8dd0b3aac5499b17d77bf28ee054fd211e8d73c  gst-validate-1.10.4.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 695e53e..cf7a8af 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.10.3
+GST1_VALIDATE_VERSION = 1.10.4
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
