From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 6 Feb 2018 14:34:27 -0200
Subject: [Buildroot] [PATCH 1/2] configs/wandboard: Bump U-Boot and kernel
 versions
Message-ID: <1517934868-3692-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Bump U-Boot to 2018.01 version and kernel to 4.15.1.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index e6ba1d4..8f28b60 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1"
-- 
2.7.4
