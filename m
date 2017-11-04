From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  4 Nov 2017 22:40:47 +0300
Subject: [Buildroot] [PATCH 3/5] orange-pi-zero: bump kernel version
In-Reply-To: <20171104194049.24550-1-geomatsi@gmail.com>
References: <20171104194049.24550-1-geomatsi@gmail.com>
Message-ID: <20171104194049.24550-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel and kernel headers to 4.13.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 03e1d9c34e..6eccfda96f 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -3,14 +3,14 @@ BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-zero/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-zero/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
-- 
2.11.0
