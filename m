From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:13:19 +0200
Subject: [Buildroot] [git commit] boot/uboot/Config.in: sort uboot's format
 extensions alphabetically
Message-ID: <20201006190248.A75258EB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61484dd823a03e3e2d23a8c640e5c1fd6e916cb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's easier to locate given format when it's sorted.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 54 ++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a87a642581..63291c9a0f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -245,47 +245,31 @@ config BR2_TARGET_UBOOT_FORMAT_BIN
 config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 	bool "u-boot-dtb.bin"
 
-config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
-	bool "u-boot-dtb.img"
+config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
+	bool "u-boot-nand.bin"
 
-config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
-	bool "u-boot-dtb.imx"
+config BR2_TARGET_UBOOT_FORMAT_ELF
+	bool "u-boot.elf"
 
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
 
-config BR2_TARGET_UBOOT_FORMAT_ITB
-	bool "u-boot.itb"
+config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
+	bool "u-boot-dtb.img"
 
 config BR2_TARGET_UBOOT_FORMAT_IMX
 	bool "u-boot.imx"
 
-config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
-	bool "u-boot-nand.bin"
+config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
+	bool "u-boot-dtb.imx"
+
+config BR2_TARGET_UBOOT_FORMAT_ITB
+	bool "u-boot.itb"
 
 config BR2_TARGET_UBOOT_FORMAT_KWB
 	bool "u-boot.kwb (Marvell)"
 	depends on BR2_arm
 
-config BR2_TARGET_UBOOT_FORMAT_ELF
-	bool "u-boot.elf"
-
-config BR2_TARGET_UBOOT_FORMAT_SB
-	bool "u-boot.sb (Freescale i.MX28)"
-	depends on BR2_arm
-
-config BR2_TARGET_UBOOT_FORMAT_SD
-	bool "u-boot.sd (Freescale i.MX28)"
-	depends on BR2_arm
-	help
-	  This is Freescale i.MX28 SB format, with a header for booting
-	  from an SD card.
-
-	  U-Boot includes an mxsboot tool to generate this format,
-	  starting from 2011.12.
-
-	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
-
 config BR2_TARGET_UBOOT_FORMAT_NAND
 	bool "u-boot.nand (Freescale i.MX28)"
 	depends on BR2_arm
@@ -343,6 +327,22 @@ config BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
 
 endif
 
+config BR2_TARGET_UBOOT_FORMAT_SB
+	bool "u-boot.sb (Freescale i.MX28)"
+	depends on BR2_arm
+
+config BR2_TARGET_UBOOT_FORMAT_SD
+	bool "u-boot.sd (Freescale i.MX28)"
+	depends on BR2_arm
+	help
+	  This is Freescale i.MX28 SB format, with a header for booting
+	  from an SD card.
+
+	  U-Boot includes an mxsboot tool to generate this format,
+	  starting from 2011.12.
+
+	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
