From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Oct 2020 23:16:19 +0300
Subject: [Buildroot] [PATCH v2 1/3] configs/mx6udoo_defconfig: bump kernel
 and U-Boot versions
In-Reply-To: <20201013201621.910051-1-geomatsi@gmail.com>
References: <20201013201621.910051-1-geomatsi@gmail.com>
Message-ID: <20201013201621.910051-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux kernel to 5.8.13 and U-Boot to 2020.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/mx6udoo_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 86ad13bbf3..d208f5846e 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,8 +3,8 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 5.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/mx6qdl/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.28.0
