From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 00:18:48 +0100
Subject: [Buildroot] [PATCH-NEXT] configs/orangepi_r1: bump kernel and
 u-boot versions
Message-ID: <20191123231848.13535-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux to 5.3.12 and U-Boot to 2019.10.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_r1_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index 34a400e78c..b1d35f2998 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.12"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-r1"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_r1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.20.1
