From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Jun 2018 20:32:00 -0300
Subject: [Buildroot] [PATCH] configs/mx51evk: Bump U-Boot and kernel
Message-ID: <1529451120-30038-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot to 2018.05 and kernel to 4.17.2 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx51evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index 368e9be..d9790ad 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx51evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
-- 
2.7.4
