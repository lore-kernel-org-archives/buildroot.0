From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:35:58 +0200
Subject: [Buildroot] [git commit] configs/warp7: bump the kernel version
Message-ID: <20190930213039.D3B3C84059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3f033282bbada2e85625583fbcf56db0031d19e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel to version 5.3.1.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/warp7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 1910478b35..cba48458d1 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
