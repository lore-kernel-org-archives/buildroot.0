From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  1 Jan 2018 11:17:14 -0500
Subject: [Buildroot] [PATCH 02/10] gst1-plugins-base: bump to 1.12.4
In-Reply-To: <20180101161722.12637-1-Adamduskett@outlook.com>
References: <20180101161722.12637-1-Adamduskett@outlook.com>
Message-ID: <20180101161722.12637-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 2f4d57d790..b935f2f6dc 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz.sha256sum
-sha256 d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5 gst-plugins-base-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.4.tar.xz.sha256sum
+sha256 4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282 gst-plugins-base-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 19172ab63e..10361ee3c6 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.3
+GST1_PLUGINS_BASE_VERSION = 1.12.4
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.14.3
