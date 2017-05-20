From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 20 May 2017 20:06:41 +0300
Subject: [Buildroot] [PATCH 1/3] configs/linksprite_pcduino_defconfig:
	update bsp versions
In-Reply-To: <20170520170643.19786-1-geomatsi@gmail.com>
References: <20170520170643.19786-1-geomatsi@gmail.com>
Message-ID: <20170520170643.19786-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump u-boot version to 2017.03 and kernel version to 4.11.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/linksprite_pcduino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index fb82714e9..e736e4806 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -17,13 +17,13 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/linksprite/pcduino/post-image.sh"
 # For kernel modules autoloading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
@@ -37,7 +37,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.03"
 BR2_TARGET_UBOOT_USE_DEFCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.11.0
