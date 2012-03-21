From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 23:04:56 +0100
Subject: [Buildroot] [git commit] qemu/mipsel-malta: update to use kernel 3.3
Message-ID: <20120321223125.AE6E596928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97b46132e6d149759988562acb0cc6a74c6890b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.2.config => linux-3.3.config}         |    0
 configs/qemu_mipsel_malta_defconfig                |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/mipsel-malta/linux-3.2.config b/board/qemu/mipsel-malta/linux-3.3.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.2.config
rename to board/qemu/mipsel-malta/linux-3.3.config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 0ccd4e6..99d9cba 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
