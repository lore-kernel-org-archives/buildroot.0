From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 22:32:23 +0200
Subject: [Buildroot] [git commit] gst1-validate: bump to 1.12.3
Message-ID: <20171010202508.42E117FA46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9670402b7c452a7dfcc2a19eea66d9c3646e7e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index d2fc2c2..75e43b1 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.2.tar.xz.sha256sum
-sha256 6b7a25d1fd2a08ffe08e4809587f16b4c4e01dfd9e77cfa222b7f2558666fedd gst-validate-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.3.tar.xz.sha256sum
+sha256 5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e gst-validate-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 31b01ef..33fec08 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.2
+GST1_VALIDATE_VERSION = 1.12.3
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
