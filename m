From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Tue,  9 Apr 2019 21:15:01 +0530
Subject: [Buildroot] [V2 5/7] configs: nanopi_m1: Bump to the linux 5.0 and
 u-boot 2019.01
In-Reply-To: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
References: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190409154503.7598-6-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps to linux/linux-headers 5.0 and u-boot version 2019.01

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/nanopi_m1_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 323015ee68..cf9521a3ad 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1"
@@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
-- 
2.11.0
