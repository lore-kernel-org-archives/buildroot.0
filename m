From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:30 +0100
Subject: [Buildroot] [git commit] qemu/ppc-virtex-ml507: update to use
	kernel 3.7.1
Message-ID: <20121230113339.7FE1A9A557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99a8940dc4f8014acc12234a5600062dc2385256
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/powerpc-virtex-ml507/readme.txt |    2 +-
 configs/qemu_ppc_virtex_ml507_defconfig    |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index 0500a95..a225985 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 6b4ea74..59812c9 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.6 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_6=y
+# Lock to 3.7 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_7=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
