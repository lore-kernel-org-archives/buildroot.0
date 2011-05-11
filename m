From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 May 2011 09:39:44 -0300
Subject: [Buildroot] [PATCH 3/3] configs: bump 2.6.38 kernels to 2.6.38.6
In-Reply-To: <1305117584-22139-1-git-send-email-gustavo@zacarias.com.ar>
References: <1305117584-22139-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1305117584-22139-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel versions of qemu/mips-malta and qemu/arm-versatile sample
configuration files to 2.6.38.6

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_arm_versatile_defconfig |    2 +-
 configs/qemu_mipsel_malta_defconfig  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1a1a0ff..6274b68 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 0523a14..64ce976 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-2.6.38.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
1.7.3.4
