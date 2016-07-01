From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 14:59:07 +0200
Subject: [Buildroot] [git commit] configs/qemu_mipsel_malta_defconfig:
	rename to qemu_mips32r2el_malta_defconfig
Message-ID: <20160701130003.66FA8817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e0f466a2743b50c71de0355c61f5798bab4a161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/{mipsel-malta => mips32r2el-malta}/linux-4.6.config          | 0
 board/qemu/{mipsel-malta => mips32r2el-malta}/readme.txt                | 0
 .../{qemu_mipsel_malta_defconfig => qemu_mips32r2el_malta_defconfig}    | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/mipsel-malta/linux-4.6.config b/board/qemu/mips32r2el-malta/linux-4.6.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-4.6.config
rename to board/qemu/mips32r2el-malta/linux-4.6.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
similarity index 100%
rename from board/qemu/mipsel-malta/readme.txt
rename to board/qemu/mips32r2el-malta/readme.txt
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
similarity index 85%
rename from configs/qemu_mipsel_malta_defconfig
rename to configs/qemu_mips32r2el_malta_defconfig
index 4e4f838..c103d9a 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
