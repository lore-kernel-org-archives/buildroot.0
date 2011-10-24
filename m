From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Oct 2011 16:42:11 -0300
Subject: [Buildroot] [PATCH 3/6] qemu_mipsel_malta: update to kernel 3.1
In-Reply-To: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1319485334-15790-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-2.6.38.config => linux-3.1.config}      |    0
 configs/qemu_mipsel_malta_defconfig                |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/mipsel-malta/{linux-2.6.38.config => linux-3.1.config} (100%)

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
-- 
1.7.3.4
