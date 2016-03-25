From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 09:50:14 -0300
Subject: [Buildroot] [PATCH 10/10] gst1-validate: bump to version 1.8.0
In-Reply-To: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458910214-10963-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index c50475c..28e78de 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.6.0.tar.xz.sha256sum
-sha256 3baef8c7b5363293c20314a30afd54629849fc597669991fdcf92303602dafee  gst-validate-1.6.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.8.0.tar.xz.sha256sum
+sha256 7666b777bd4b05efe4520ef92669169d8879f69a68606578ec667ae7dc4d9edd  gst-validate-1.8.0.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index a7d66be..e7f1f51 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.6.0
+GST1_VALIDATE_VERSION = 1.8.0
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
-- 
2.7.3
