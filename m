From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon, 15 Apr 2019 20:04:09 +0530
Subject: [Buildroot] [PATCH 2/2] configs: asus_tinker_rk3288: Bump to the
 linux kernel 5.0 and u-boot 2019.01
In-Reply-To: <20190415143409.24726-1-shyam.saini@amarulasolutions.com>
References: <20190415143409.24726-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190415143409.24726-2-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps to linux/linux-headers 5.0 and u-boot version 2019.01

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/asus_tinker_rk3288_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index b14cb0a2c2..e95a19a757 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.11.0
