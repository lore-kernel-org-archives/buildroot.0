From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Mar 2018 21:32:40 +0100
Subject: [Buildroot] [git commit] mx25pdk: Bump U-Boot and kernel versions
Message-ID: <20180305222055.7FC28821CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2046ecee910c9b27869168b56c8f92d1a9a2b56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to version 2018.01 and kernel to 4.15.7.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/mx25pdk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
index a88fb2aeb7..f86ce7af02 100644
--- a/configs/mx25pdk_defconfig
+++ b/configs/mx25pdk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx25pdk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx25-pdk"
