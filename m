From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 21:17:10 +0100
Subject: [Buildroot] [git commit] qemu/mipsel-malta: update to use kernel
	3.2.6
Message-ID: <20120226202430.8B74790B91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=717ce1a949fa7b2c050c0feb45941329147753cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_mipsel_malta_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index a46f886..0ccd4e6 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
