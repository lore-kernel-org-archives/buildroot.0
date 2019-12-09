From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2019 22:44:29 +0100
Subject: [Buildroot] [git commit] gst1-validate: bump version to 1.16.2
Message-ID: <20191209213716.9582388FFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dfb1116a98b7110959ed33dd986c018e93afd93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 45603dd9c1..9a0fbf66a0 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.16.1.tar.xz.sha256sum
-sha256 7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2df0cac5b77562899 gst-validate-1.16.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.16.2.tar.xz.sha256sum
+sha256 4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca gst-validate-1.16.2.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index e9522e1568..ff96d844ba 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.16.1
+GST1_VALIDATE_VERSION = 1.16.2
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
