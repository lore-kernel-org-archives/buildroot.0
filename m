From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 21:17:09 +0100
Subject: [Buildroot] [git commit] qemu/arm-versatile: update to use kernel
	3.2.6
Message-ID: <20120226202430.4F4DD90B91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2befc3a380c5fd41441a4370ea22a7bfd4c109d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_arm_versatile_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 17aa833..fdc2e72 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
