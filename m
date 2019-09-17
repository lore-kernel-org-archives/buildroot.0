From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:26:33 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] configs/aarch64_efi: fix
 typo AARCH64 -> ARM64
Message-ID: <20190917202229.3A7B38E9D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c9e7db1edc1838a1e4fb61e63a90a8683489f20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

There is no option BR2_TARGET_GRUB2_AARCH64_EFI but
BR2_TARGET_GRUB2_ARM64_EFI in grub2 package.

BR2_TARGET_GRUB2_ARM64_EFI was introduced by the commit [1].

[1] 273a27804a18c5e232907d5ef6bd01957cf090d7

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0525ca471160b0da8c1159c3ffbbdaeded93682f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
