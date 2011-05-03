From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 May 2011 13:22:25 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/mipsel-malta: switch to kernel 2.6.38.5
In-Reply-To: <1304439745-4308-1-git-send-email-gustavo@zacarias.com.ar>
References: <1304439745-4308-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1304439745-4308-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-2.6.36.config => linux-2.6.38.config}   |    0
 configs/qemu_mipsel_malta_defconfig                |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/mipsel-malta/{linux-2.6.36.config => linux-2.6.38.config} (100%)

diff --git a/board/qemu/mipsel-malta/linux-2.6.36.config b/board/qemu/mipsel-malta/linux-2.6.38.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-2.6.36.config
rename to board/qemu/mipsel-malta/linux-2.6.38.config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index ea3ba88..0523a14 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-2.6.36.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-2.6.38.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
1.7.3.4
