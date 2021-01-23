From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:45:35 +0100
Subject: [Buildroot] [git commit] configs/wandboard: bump U-Boot and kernel
 versions
Message-ID: <20210123222631.63B5B7F9EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c168b885204f856b6c17c881eaa676ac639f54fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to U-Boot 2021.01 and kernel 5.10.8 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/wandboard_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 4882042a1a..8f9e30a1a9 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
