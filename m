From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 30 Dec 2016 20:17:15 -0200
Subject: [Buildroot] [PATCH 1/2] configs/warpboard: Bump kernel and U-Boot
	versions
Message-ID: <1483136236-4975-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel to version 4.9 and U-Boot to 2016.11.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warpboard_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 71d777f..5b0ed2c 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="warpboard"
@@ -18,7 +18,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/warpboard/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -37,7 +37,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # host utility
-- 
2.7.4
