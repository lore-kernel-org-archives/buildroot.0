From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  1 Apr 2019 19:13:01 +0530
Subject: [Buildroot] [PATCH 1/3] configs: engicam_imx6qdl_icore_rqs: Bump to
 the linux kernel 5.0
Message-ID: <20190401134303.9177-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps to linux/linux-headers 5.0

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/engicam_imx6qdl_icore_rqs_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_imx6qdl_icore_rqs_defconfig
index 4cea880b5f..7ebe981c65 100644
--- a/configs/engicam_imx6qdl_icore_rqs_defconfig
+++ b/configs/engicam_imx6qdl_icore_rqs_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-- 
2.11.0
