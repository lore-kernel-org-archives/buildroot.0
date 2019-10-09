From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  9 Oct 2019 15:46:46 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Bump U-Boot and kernel
 versions
Message-ID: <20191009184646.4492-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2019.10 and kernel to 5.3.4 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabreauto_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index d9a08bbe70..ae5598fe37 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto imx6dl-sabreauto imx6qp-sabreauto"
-- 
2.17.1
