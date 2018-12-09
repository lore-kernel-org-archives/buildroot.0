From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:24:24 +0100
Subject: [Buildroot] [git commit] configs/aarch64_efi: needs
 host-{dosfstools, mtools}
Message-ID: <20181209202047.B2C248388A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6dbe291382037236d5ec104b4919c159edd228ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    https://gitlab.com/ymorin/buildroot/-/jobs/131924126

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/aarch64_efi_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index ecc050fc5e..e87193218e 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -32,3 +32,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Host tools for genimage
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
