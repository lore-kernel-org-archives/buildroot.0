From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:08:39 +0100
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: enable gstreamer
 videotestsrc plugin
Message-ID: <20191221215949.E94F98D3B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afa2eea134b1f312bb6d7649f14919471d7ce8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The videotestsrc Gstreamer plugin is very useful for testing.

Enable it by default.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
