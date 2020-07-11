From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 16:07:41 +0200
Subject: [Buildroot] [git commit] configs/freescale_imx8qxpmek: bump BSP
 components to version 5.4.24_2.1.0
Message-ID: <20200711140417.477BB815C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee10b70ead6f526866502e3f4a923b8b7eca04af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx8qxpmek_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index 03ecd22ee6..2c35055565 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -1,17 +1,17 @@
 BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qxp-mek.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8qxp-mek"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qxp-mek"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y
@@ -24,14 +24,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qx"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qxp_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
