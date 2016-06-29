From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 29 Jun 2016 12:04:28 +0100
Subject: [Buildroot] [PATCH 1/8] qemu_mips_malta_defconfig: move to
	qemu_mips_32r2_malta_defconfig
In-Reply-To: <1467198275-46657-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467198275-46657-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467198275-46657-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 board/qemu/{mips-malta => mips-32r2-malta}/linux-4.6.config           | 0
 board/qemu/{mips-malta => mips-32r2-malta}/readme.txt                 | 0
 configs/{qemu_mips_malta_defconfig => qemu_mips_32r2_malta_defconfig} | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename board/qemu/{mips-malta => mips-32r2-malta}/linux-4.6.config (100%)
 rename board/qemu/{mips-malta => mips-32r2-malta}/readme.txt (100%)
 rename configs/{qemu_mips_malta_defconfig => qemu_mips_32r2_malta_defconfig} (85%)

diff --git a/board/qemu/mips-malta/linux-4.6.config b/board/qemu/mips-32r2-malta/linux-4.6.config
similarity index 100%
rename from board/qemu/mips-malta/linux-4.6.config
rename to board/qemu/mips-32r2-malta/linux-4.6.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-32r2-malta/readme.txt
similarity index 100%
rename from board/qemu/mips-malta/readme.txt
rename to board/qemu/mips-32r2-malta/readme.txt
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_32r2_malta_defconfig
similarity index 85%
rename from configs/qemu_mips_malta_defconfig
rename to configs/qemu_mips_32r2_malta_defconfig
index 66b67a5..4febb64 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_32r2_malta_defconfig
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-32r2-malta/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
2.7.3
