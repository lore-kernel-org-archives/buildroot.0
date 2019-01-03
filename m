From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jan 2019 22:52:53 +0100
Subject: [Buildroot] [git commit] configs/bananapro: bump Linux and U-Boot
 version
Message-ID: <20190103214814.238B9890FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bb99902789f0da1c53a93934f0606e7248ed722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux to version 4.14.91 and U-Boot to version 2018.11.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/bananapro_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index b4141e3608..136a166d72 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.91"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
@@ -39,7 +39,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
