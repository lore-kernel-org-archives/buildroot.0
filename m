From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2020 21:59:23 +0200
Subject: [Buildroot] [git commit] configs/warp7: Bump Kernel version
Message-ID: <20200607200416.78538818E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46c6a4325c18eb912fba6a401e6189ddc1bfb6bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 5.7.1

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warp7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 0f5c7a3d88..41511c1b55 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+# Linux headers same as kernel, a 5.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
