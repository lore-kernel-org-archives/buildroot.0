From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 10:30:28 +0100
Subject: [Buildroot] [git commit] qemu/arm-versatile: update to use kernel
	version 3.2
Message-ID: <20120106093658.58CAF90017@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c0b0ab8993c380aa9fe479dba7497a1c28a9cb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.1.config => linux-3.2.config}         |    0
 configs/qemu_arm_versatile_defconfig               |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.1.config b/board/qemu/arm-versatile/linux-3.2.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.1.config
rename to board/qemu/arm-versatile/linux-3.2.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index b629ba9..17aa833 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
