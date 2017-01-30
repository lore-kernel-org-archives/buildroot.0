From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:12:59 +0100
Subject: [Buildroot] [git commit] gst1-validate: bump to version 1.10.3
Message-ID: <20170130201643.097FF7FA5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3ccfb63cb4760e1800dab61c5e637e270955236
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
