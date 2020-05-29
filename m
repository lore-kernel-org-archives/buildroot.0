From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 22:42:34 +0200
Subject: [Buildroot] [git commit branch/next] configs/imx7dpico: bump kernel
 and U-Boot version
Message-ID: <20200529202837.44E4A91DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7286012e5d0ddf5b05df49b79938029f74aba6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump U-Boot to 2020.04 and kernel to version 5.6.3

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx7dpico_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index 190e77fbfe..b4a539b8e1 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # wifi firmware for brcm43439
