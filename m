From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 15 Dec 2016 23:49:56 +0300
Subject: [Buildroot] [PATCH 1/1] configs/orangepi: bump kernel and u-boot
	versions
Message-ID: <20161215204956.21066-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update kernel to 4.9 and U-Boot to 2016.09.01.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_one_defconfig | 2 +-
 configs/orangepi_pc_defconfig  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index a486d0e..925ba9c 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index dd21d5f..a3a5700 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -1,14 +1,14 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.10.2
