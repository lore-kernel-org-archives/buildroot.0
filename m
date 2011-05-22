From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 17:04:47 +0200
Subject: [Buildroot] [git commit] defconfigs: bump 2.6.38.x stable version
Message-ID: <20110522150630.A4C2F8357B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=572529a43c3b7e637adff025dabdf335bd100403
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_arm_versatile_defconfig |    2 +-
 configs/qemu_mipsel_malta_defconfig  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 6274b68..faf55e3 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-2.6.38.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 64ce976..3f54cef 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-2.6.38.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
1.7.3.4
