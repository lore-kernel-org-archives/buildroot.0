From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Fri, 19 Apr 2019 15:27:18 +0530
Subject: [Buildroot] [PATCH 4/4] configs/bananapi_m64: Bump to the linux
 kernel 5.0 and u-boot 2019.01
In-Reply-To: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
References: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190419095718.8444-4-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps to linux/linux-headers 5.0 and u-boot version 2019.01

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/bananapi_m64_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 7d1ed18fbf..f7c01944cf 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m64/boot.cmd"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-bananapi-m64"
-- 
2.11.0
