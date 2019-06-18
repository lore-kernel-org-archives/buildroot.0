From: Alistair Francis <alistair.francis@wdc.com>
Date: Tue, 18 Jun 2019 16:53:57 -0700
Subject: [Buildroot] [PATCH 1/2] configs/qemu_riscv64_virt: Update to 5.1
 kernel
Message-ID: <20190618235358.10613-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the 64-bit defconfig to use the latest kernel.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 configs/qemu_riscv64_virt_defconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 12afac44fb..e2932778ec 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -10,13 +10,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.20 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
-
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
-- 
2.22.0
