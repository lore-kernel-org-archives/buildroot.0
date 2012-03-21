From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 23:45:10 -0300
Subject: [Buildroot] [PATCH 5/8] qemu/ppc-g3beige: update to use kernel 3.3
In-Reply-To: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332297913-7699-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332297913-7699-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-3.2.config => linux-3.3.config}         |    0
 configs/qemu_ppc_g3beige_defconfig                 |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename board/qemu/powerpc-g3beige/{linux-3.2.config => linux-3.3.config} (100%)

diff --git a/board/qemu/powerpc-g3beige/linux-3.2.config b/board/qemu/powerpc-g3beige/linux-3.3.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.2.config
rename to board/qemu/powerpc-g3beige/linux-3.3.config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 432a746..a20d3e4 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,9 +9,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
-- 
1.7.3.4
