From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 11:08:38 +0200
Subject: [Buildroot] [PATCH] configs/qemu_arm_versatile: bump kernel to
	4.13.3
Message-ID: <20170922090838.30524-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/arm-versatile/{linux-4.11.config => linux-4.13.config} | 0
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/arm-versatile/{linux-4.11.config => linux-4.13.config} (100%)

diff --git a/board/qemu/arm-versatile/linux-4.11.config b/board/qemu/arm-versatile/linux-4.13.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.11.config
rename to board/qemu/arm-versatile/linux-4.13.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 9845ec6464..0423dc06c5 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.13.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
-- 
2.11.0
