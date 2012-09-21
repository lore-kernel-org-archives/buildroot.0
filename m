From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 11:54:30 -0300
Subject: [Buildroot] [PATCH 10/11] qemu/microblaze: update to use kernel
	3.5.4
In-Reply-To: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348239271-17456-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{kernel-3.4.config => kernel-3.5.config}       |    0
 .../{kernel-3.4.config => kernel-3.5.config}       |    0
 configs/qemu_microblazebe_mmu_defconfig            |    4 ++--
 configs/qemu_microblazeel_mmu_defconfig            |    4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename board/qemu/microblazebe-mmu/{kernel-3.4.config => kernel-3.5.config} (100%)
 rename board/qemu/microblazeel-mmu/{kernel-3.4.config => kernel-3.5.config} (100%)

diff --git a/board/qemu/microblazebe-mmu/kernel-3.4.config b/board/qemu/microblazebe-mmu/kernel-3.5.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/kernel-3.4.config
rename to board/qemu/microblazebe-mmu/kernel-3.5.config
diff --git a/board/qemu/microblazeel-mmu/kernel-3.4.config b/board/qemu/microblazeel-mmu/kernel-3.5.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/kernel-3.4.config
rename to board/qemu/microblazeel-mmu/kernel-3.5.config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 11c6f95..1d7be07 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/kernel-3.5.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 1ce9ac8..941bc30 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/kernel-3.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/kernel-3.5.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
-- 
1.7.8.6
