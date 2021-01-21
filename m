From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2021 16:48:24 +0100
Subject: [Buildroot] [PATCH-2020.02.x 06/11] package/gst1-validate: bump
 version to 1.16.3
In-Reply-To: <20210121154829.9353-1-peter@korsgaard.com>
References: <20210121154829.9353-1-peter@korsgaard.com>
Message-ID: <20210121154829.9353-6-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 9a0fbf66a0..1df7bf94f6 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.16.2.tar.xz.sha256sum
-sha256 4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca gst-validate-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.16.3.tar.xz.sha256sum
+sha256 c2064e887324af6aa476ca669234936711f253b29042f617f1d9f2597c4bf92b gst-validate-1.16.3.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 38b50b6736..fa8299494c 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.16.2
+GST1_VALIDATE_VERSION = 1.16.3
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
-- 
2.20.1
