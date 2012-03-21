From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 23:05:07 +0100
Subject: [Buildroot] [git commit] qemu/mips-malta: update to use kernel 3.3
Message-ID: <20120321223125.BAE7B96929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba51dccedf83f8ed072ffa2906e1a72419bf95ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.2.config => linux-3.3.config}         |    0
 configs/qemu_mips_malta_defconfig                  |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/mips-malta/linux-3.2.config b/board/qemu/mips-malta/linux-3.3.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.2.config
rename to board/qemu/mips-malta/linux-3.3.config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index db94790..2dc3f70 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
