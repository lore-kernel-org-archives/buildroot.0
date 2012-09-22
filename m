From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:47:59 +0200
Subject: [Buildroot] [git commit] qemu/mips-malta: update to use kernel 3.5.4
Message-ID: <20120922194943.640DC996DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=651a95a77f5d9aeea52539b9af7195b0ec8f171b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.4.config => linux-3.5.config}         |    0
 configs/qemu_mips_malta_defconfig                  |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/mips-malta/linux-3.4.config b/board/qemu/mips-malta/linux-3.5.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.4.config
rename to board/qemu/mips-malta/linux-3.5.config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index f9ec326..3bb2a72 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.4 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_4=y
+# Lock to 3.5 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
