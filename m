From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 20:36:08 +0100
Subject: [Buildroot] [PATCH] configs: orangepipc: bump u-boot to 2016.03,
	kernel to 4.5
Message-ID: <1458070568-27793-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepipc_defconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index eb149d9..69db410 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -1,18 +1,14 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-# Kernel is a pre-release of 4.5, so we do not yet have a _CUSTOM_4_5
-# option for the headers. Thus, we stick with the 4.4 headers for now.
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.4"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5-rc1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.7.0
