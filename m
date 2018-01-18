From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 18 Jan 2018 10:58:54 -0200
Subject: [Buildroot] [PATCH] configs/mx6udoo: Bump kernel and U-Boot versions
Message-ID: <1516280334-25506-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2018.01 and kernel to 4.14.13 version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/mx6udoo_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index ad88129..86ad13b 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/mx6qdl/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
