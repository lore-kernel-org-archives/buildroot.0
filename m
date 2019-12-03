From: Julien Olivain <juju@cotds.org>
Date: Tue,  3 Dec 2019 21:38:05 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mqevk: bump BSP
 components to 4.14.98_2.0.0
Message-ID: <20191203203805.408448-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Kernel, U-Boot and ATF to NXP BSP version rel_imx_4.14.98_2.0.0_ga

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 configs/freescale_imx8mqevk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index 7e96ee7fc0..7989b60570 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mq-evk"
@@ -20,14 +20,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.23.0
