From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  7 Oct 2015 23:30:05 +0200
Subject: [Buildroot] [PATCH v1 7/7] gst1-validate: bump version to 1.6.0
In-Reply-To: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
References: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444253405-3994-7-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index e2eb3ae..c50475c 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# Hash from http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.4.0.tar.xz.sha256sum
-sha256 ac30d1041a8cfe5d268439f5cedee7e9753ba49080fc67bff1266581198438d0 gst-validate-1.4.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.6.0.tar.xz.sha256sum
+sha256 3baef8c7b5363293c20314a30afd54629849fc597669991fdcf92303602dafee  gst-validate-1.6.0.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 9a9e796..b8b09da 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.4.0
+GST1_VALIDATE_VERSION = 1.6.0
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
-- 
2.1.4
