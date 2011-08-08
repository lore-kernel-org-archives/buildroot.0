From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Aug 2011 18:56:47 +0200
Subject: [Buildroot] [git commit] qemu_mipsel_malta_defconfig: use 2.6.38.8
Message-ID: <20110808170325.51BC68B856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c578d2cc2bb2ef7feb21e461116b5597da2f225c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_mipsel_malta_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 3f54cef..f95fe24 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-2.6.38.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
1.7.3.4
