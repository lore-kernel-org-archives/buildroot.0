From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:47:24 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx8mqevk: bump packages
 to imx_4.14.62_1.0.0_beta
Message-ID: <20181213204349.11C968CA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=769ee2fc312d75204b6dded96cd62d90cfd106a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel, U-Boot and ATF packages to the NXP imx_4.14.62_1.0.0_beta
release.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx8mqevk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index a6e9b940b5..895713b1c1 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.62_1.0.0_beta"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mq-evk"
@@ -20,14 +20,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_ga"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.62_1.0.0_beta"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.62_1.0.0_beta"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
