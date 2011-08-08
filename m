From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Aug 2011 18:56:47 +0200
Subject: [Buildroot] [git commit] qemu_arm_versatile_defconfig: use 2.6.38.8
Message-ID: <20110808170325.2213F8B856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=720335154e6c28db18c9fed8642f23c35ece1799
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_arm_versatile_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index faf55e3..e4a7024 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
