From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 5 Oct 2014 18:17:00 +0200
Subject: [Buildroot] [PATCH 2/2] qemu-aarch64: Update to latest kernel.
Message-ID: <20141005161659.GA1971@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to Linux 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 configs/qemu_aarch64_virt_defconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 8ce28a8..6849587 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.16 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.16"
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.16.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
1.7.10.4
