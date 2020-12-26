From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:30:43 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx8mmevk: bump BSP
 components to 5.4.47_2.2.0
Message-ID: <20201226171348.87F6C816CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccfb6b862935dee678bfc607818d4492b9446b1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
[Build-tested only]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_imx8mmevk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index 38cd470634..353b327ab8 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk freescale/imx8mm-evk-revb"
@@ -21,14 +21,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.47_2.2.0"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
