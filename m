From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  4 Jul 2017 14:19:15 +0200
Subject: [Buildroot] [PATCH 09/10] gst1-validate: bump version to 1.12.1
In-Reply-To: <20170704121916.28441-1-peter@korsgaard.com>
References: <20170704121916.28441-1-peter@korsgaard.com>
Message-ID: <20170704121916.28441-9-peter@korsgaard.com>
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
index edb5ccd342..4148e532b3 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.0.tar.xz.sha256sum
-sha256 73efaf123638b97159c1ff6575dd05ea0cf7dc6d71b07806b5a5f25188a67fbb  gst-validate-1.12.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.1.tar.xz.sha256sum
+sha256 150044e6aafb31447d0171f56d621671de0579328ee8f7122a671fad6e1e7182  gst-validate-1.12.1.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index d6a5a55190..459996b935 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.0
+GST1_VALIDATE_VERSION = 1.12.1
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
-- 
2.11.0
