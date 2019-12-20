From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Dec 2019 22:34:42 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabresd_qt5: Select videotestsrc
 plugin
Message-ID: <20191220013442.8231-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The videotestsrc Gstreamer plugin is very useful for testing.

Enable it by default.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 795f770e4f..d5369b34fc 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -93,6 +93,7 @@ BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE=y
 BR2_PACKAGE_GST1_PLUGINS_BAD=y
 BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
 BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
 
 # For automatic kernel module loading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-- 
2.17.1
