From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:53:39 +0100
Subject: [Buildroot] [git commit] configs/mx51evk: Bump U-Boot and kernel
	versions
Message-ID: <20170303225406.A34DD82288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=183e44fe642ce68ab5f30d1cdf5b7ebf296353aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2017.01 version and kernel to 4.9.13.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/mx51evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index db82a36..479eac3 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx51evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
