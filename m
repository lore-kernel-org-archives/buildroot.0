From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:47:52 +0200
Subject: [Buildroot] [git commit] qemu/x86: update to use kernel 3.5.4
Message-ID: <20120922194942.607E9996DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=345d290c64e22c33be50d2b78ca0fc5205656002
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x86/{linux-3.4.config => linux-3.5.config}     |    0
 configs/qemu_x86_defconfig                         |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/x86/linux-3.4.config b/board/qemu/x86/linux-3.5.config
similarity index 100%
rename from board/qemu/x86/linux-3.4.config
rename to board/qemu/x86/linux-3.5.config
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 1851cec..73c16a3 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.4 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_4=y
+# Lock to 3.5 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.5.config"
