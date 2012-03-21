From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 23:45:09 -0300
Subject: [Buildroot] [PATCH 4/8] qemu/mips-malta: update to use kernel 3.3
In-Reply-To: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332297913-7699-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-3.2.config => linux-3.3.config}         |    0
 configs/qemu_mips_malta_defconfig                  |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/mips-malta/{linux-3.2.config => linux-3.3.config} (100%)

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
-- 
1.7.3.4
