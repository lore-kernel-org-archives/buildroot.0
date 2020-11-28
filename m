From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 10:53:53 +0100
Subject: [Buildroot] [git commit branch/next] configs/aarch64_efi: bump
 kernel version
Message-ID: <20201128093947.726D9817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa900caf19abab8614f1232df59170552d0b3673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump Linux kernel version to 5.9.11.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/aarch64_efi_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 2aab6e9699..99600575ed 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -23,13 +23,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 5.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
