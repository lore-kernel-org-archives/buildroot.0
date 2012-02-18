From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Feb 2012 16:30:45 -0300
Subject: [Buildroot] [PATCH 5/8] qemu/mips-malta: update to use kernel 3.2.6
In-Reply-To: <1329593448-9309-1-git-send-email-gustavo@zacarias.com.ar>
References: <1329593448-9309-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1329593448-9309-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_mips_malta_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index d6ab841..db94790 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.2.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
1.7.3.4
