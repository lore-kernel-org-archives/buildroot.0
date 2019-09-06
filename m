From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 12:12:03 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: fix typo AARCH64 -> ARM64
Message-ID: <20190906101203.7549-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no option BR2_TARGET_GRUB2_AARCH64_EFI but
BR2_TARGET_GRUB2_ARM64_EFI in grub2 package.

BR2_TARGET_GRUB2_ARM64_EFI was introduced by the commit [1].

[1] 273a27804a18c5e232907d5ef6bd01957cf090d7

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Erico Nunes <nunes.erico@gmail.com>
---
 configs/aarch64_efi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index e87193218e..2aab6e9699 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 
 # Bootloader
 BR2_TARGET_GRUB2=y
-BR2_TARGET_GRUB2_AARCH64_EFI=y
+BR2_TARGET_GRUB2_ARM64_EFI=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.21.0
