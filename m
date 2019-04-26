From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:14:26 +0200
Subject: [Buildroot] [git commit] configs/warp7: bump to Linux 5.0.9 and
 U-Boot 2019.01
Message-ID: <20190426070938.F0CA7807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45537f832d0f29c9ee80e80ef42b696b86f5f285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps Linux & Linux-headers to 5.0 and U-Boot to version 2019.01

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Pierre-Jean Texier <a class="moz-txt-link-rfc2396E" href="mailto:pjtexier@koncepto.io">&lt;pjtexier at koncepto.io&gt;</a>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/warp7_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 95e538fb7e..8acd73047e 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.16 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.9"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # wifi firmware for brcm43430
