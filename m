From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2019 10:54:35 -0300
Subject: [Buildroot] [PATCH] configs/warp7: Bump the kernel version
Message-ID: <20190731135435.9484-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the kernel to version 5.2.4.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 9b10085b65..1910478b35 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+# Linux headers same as kernel, a 5.2 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
-- 
2.17.1
