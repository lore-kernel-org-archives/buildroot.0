From: Fabio Estevam <festevam@gmail.com>
Date: Tue,  3 Apr 2018 19:12:04 -0300
Subject: [Buildroot] [PATCH] configs/warp7: Bump kernel version
Message-ID: <1522793524-7917-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel version to 4.15.15.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 7de4bb5..344c443 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.15"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
-- 
2.7.4
