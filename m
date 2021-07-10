From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 10 Jul 2021 20:21:37 +0200
Subject: [Buildroot] [PATCH] configs/imx7dpico: bump Kernel and U-Boot
 version
Message-ID: <20210710182137.3720-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2021.07 and kernel to version 5.13

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 configs/imx7dpico_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index a3c2af1641..c6ea04b683 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+# Linux headers same as kernel, a 5.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # wifi firmware for brcm43439
-- 
2.17.1
