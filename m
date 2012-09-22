From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:47:47 +0200
Subject: [Buildroot] [git commit] qemu/arm-versatile: update to use kernel
	3.5.4
Message-ID: <20120922194941.DF0AD996DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24f659f51ceec0c21861437fbbcfd9453e0805b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.3.config => linux-3.5.config}         |    0
 configs/qemu_arm_versatile_defconfig               |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.3.config b/board/qemu/arm-versatile/linux-3.5.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.3.config
rename to board/qemu/arm-versatile/linux-3.5.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 5385f28..2037565 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.5 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.5.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
