From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 08:18:15 +0200
Subject: [Buildroot] [git commit] qemu_mipsel_malta: update to kernel 3.1
Message-ID: <20111025062902.C07748F0DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34920fa79a2d4e2137c5769d6e82b2df700664af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-2.6.38.config => linux-3.1.config}      |    0
 configs/qemu_mipsel_malta_defconfig                |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/mipsel-malta/linux-2.6.38.config b/board/qemu/mipsel-malta/linux-3.1.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-2.6.38.config
rename to board/qemu/mipsel-malta/linux-3.1.config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index f95fe24..3f558fe 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-2.6.38.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.1.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
