From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Oct 2017 23:17:08 +0200
Subject: [Buildroot] [PATCH 1/4] configs/qemu_aarch64_virt_defconfig: bump
	kernel to 4.13.6
Message-ID: <20171012211711.17575-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-virt/{linux-4.11.config => linux-4.13.config} | 0
 configs/qemu_aarch64_virt_defconfig                              | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/aarch64-virt/{linux-4.11.config => linux-4.13.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-4.11.config b/board/qemu/aarch64-virt/linux-4.13.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.11.config
rename to board/qemu/aarch64-virt/linux-4.13.config
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 1ef4405ac4..84078ac892 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.13.config"
-- 
2.11.0
