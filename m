From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2011 14:16:55 -0300
Subject: [Buildroot] [PATCH 3/4] qemu/arm-versatile: use 2.6.38.4 kernel to
	match headers
In-Reply-To: <1303924616-4951-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303924616-4951-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303924616-4951-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_arm_versatile_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 6b3d954..ba32327 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
