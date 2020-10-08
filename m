From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:27:25 +0200
Subject: [Buildroot] [git commit] configs/warp7: bump Kernel and U-Boot
 version
Message-ID: <20201009075442.8841D8F12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4782c708ec8db0ec1ff4c1907f441707168be34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2020.10 and kernel to version 5.8.13

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/warp7_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 76d2801b7a..5f9d973663 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+# Linux headers same as kernel, a 5.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # wifi firmware for brcm43430
