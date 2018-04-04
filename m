From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  4 Apr 2018 12:34:28 -0300
Subject: [Buildroot] [PATCH 4/4] configs/wandboard: Bump to kernel 4.16
In-Reply-To: <1522856068-17209-1-git-send-email-festevam@gmail.com>
References: <1522856068-17209-1-git-send-email-festevam@gmail.com>
Message-ID: <1522856068-17209-4-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index b43c0c0e13..1d249c4cb2 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
@@ -19,7 +19,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard imx6q-wandboard-revb1 imx6dl-wandboard-revb1 imx6q-wandboard-revd1 imx6dl-wandboard-revd1 imx6qp-wandboard-revd1"
-- 
2.14.1
