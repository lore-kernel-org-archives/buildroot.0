From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Oct 2011 16:42:14 -0300
Subject: [Buildroot] [PATCH 6/6] qemu_ppc_g3beige: update to kernel 3.1
In-Reply-To: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1319485334-15790-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-2.6.36.config => linux-3.1.config}      |    0
 configs/qemu_ppc_g3beige_defconfig                 |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/powerpc-g3beige/{linux-2.6.36.config => linux-3.1.config} (100%)

diff --git a/board/qemu/powerpc-g3beige/linux-2.6.36.config b/board/qemu/powerpc-g3beige/linux-3.1.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-2.6.36.config
rename to board/qemu/powerpc-g3beige/linux-3.1.config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index db7ef74..cf875f0 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-2.6.36.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.1.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
1.7.3.4
