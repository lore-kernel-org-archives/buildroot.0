From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jun 2019 14:42:53 -0300
Subject: [Buildroot] [PATCH] configs/mx51evk: Bump kernel version
Message-ID: <20190619174253.24352-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the kernel version to 5.1.10.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx51evk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index 3c2d56132d..0cb8f476cd 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+# Linux headers same as kernel, a 5.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.10"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
-- 
2.17.1
