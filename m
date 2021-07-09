From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Fri,  9 Jul 2021 22:04:32 +0200
Subject: [Buildroot] [PATCH] configs/warp7: bump Kernel and U-Boot version
Message-ID: <20210709200432.18989-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2021.07 and kernel to version 5.13

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 configs/warp7_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 5f9d973663..23ae4c2257 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+# Linux headers same as kernel, a 5.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # wifi firmware for brcm43430
-- 
2.17.1
