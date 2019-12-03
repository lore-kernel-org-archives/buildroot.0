From: Fabio Estevam <festevam@gmail.com>
Date: Tue,  3 Dec 2019 11:05:25 -0300
Subject: [Buildroot] [PATCH] configs/wandboard: Bump the kernel version
Message-ID: <20191203140525.19428-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the kernel version to 5.4.1.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index c3e04af53e..1f42707ef0 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
-- 
2.17.1
