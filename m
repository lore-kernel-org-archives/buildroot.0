From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 08:27:40 +0200
Subject: [Buildroot] [git commit] qemu_ppc_g3beige: update to kernel 3.1
Message-ID: <20111025062903.1B92B8F0DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b48629f484a84f29853fe6d587e3c1c2327dc8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-2.6.36.config => linux-3.1.config}      |    0
 configs/qemu_ppc_g3beige_defconfig                 |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

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
