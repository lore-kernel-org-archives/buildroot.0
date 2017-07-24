From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 22:26:42 +0200
Subject: [Buildroot] [PATCH v2 06/10] gst1-validate: bump version to 1.12.2
In-Reply-To: <20170724202646.28628-1-ps.report@gmx.net>
References: <20170724202646.28628-1-ps.report@gmx.net>
Message-ID: <20170724202646.28628-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add missing SOB line
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index 4148e532b3..d2fc2c2a4a 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.1.tar.xz.sha256sum
-sha256 150044e6aafb31447d0171f56d621671de0579328ee8f7122a671fad6e1e7182  gst-validate-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.2.tar.xz.sha256sum
+sha256 6b7a25d1fd2a08ffe08e4809587f16b4c4e01dfd9e77cfa222b7f2558666fedd gst-validate-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 459996b935..c5e3ec6fc9 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.1
+GST1_VALIDATE_VERSION = 1.12.2
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
-- 
2.11.0
