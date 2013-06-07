From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  7 Jun 2013 09:54:13 +0200
Subject: [Buildroot] [PATCH 4/4] Normalize separator size to 80
In-Reply-To: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1370591655-19855-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 boot/at91bootstrap/at91bootstrap.mk               |    4 ++--
 boot/at91bootstrap3/at91bootstrap3.mk             |    4 ++--
 boot/at91dataflashboot/at91dataflashboot.mk       |    4 ++--
 boot/barebox/barebox.mk                           |    4 ++--
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk |    4 ++--
 boot/grub/grub.mk                                 |    4 ++--
 boot/lpc32xxcdl/lpc32xxcdl.mk                     |    4 ++--
 boot/mxs-bootlets/mxs-bootlets.mk                 |    4 ++--
 boot/syslinux/syslinux.mk                         |    4 ++--
 boot/uboot/uboot.mk                               |    4 ++--
 boot/xloader/xloader.mk                           |    4 ++--
 fs/cloop/cloop.mk                                 |    4 ++--
 fs/cpio/cpio.mk                                   |    4 ++--
 fs/cramfs/cramfs.mk                               |    4 ++--
 fs/ext2/ext2.mk                                   |    4 ++--
 fs/initramfs/initramfs.mk                         |    4 ++--
 fs/iso9660/iso9660.mk                             |    4 ++--
 fs/jffs2/jffs2.mk                                 |    4 ++--
 fs/romfs/romfs.mk                                 |    4 ++--
 fs/squashfs/squashfs.mk                           |    4 ++--
 fs/tar/tar.mk                                     |    4 ++--
 fs/ubifs/ubi.mk                                   |    4 ++--
 fs/ubifs/ubifs.mk                                 |    4 ++--
 toolchain/elf2flt/elf2flt.mk                      |    4 ++--
 toolchain/kernel-headers/kernel-headers.mk        |    4 ++--
 toolchain/uClibc/uclibc.mk                        |    4 ++--
 26 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 9d5c125..c5fd099 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # at91bootstrap
 #
-#############################################################
+################################################################################
 
 AT91BOOTSTRAP_VERSION = 1.16
 AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 32486be..4f74b1d 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # at91bootstrap3
 #
-#############################################################
+################################################################################
 
 AT91BOOTSTRAP3_VERSION = 3.2
 AT91BOOTSTRAP3_SITE = \
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index d224a4f..2c2b4d9 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # at91dataflashboot
 #
-#############################################################
+################################################################################
 
 AT91DATAFLASHBOOT_VERSION = 1.05
 AT91DATAFLASHBOOT_SOURCE = DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).tar.bz2
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 113110e..9324c25 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # barebox
 #
-#############################################################
+################################################################################
 
 BAREBOX_VERSION    = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
 
diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 25c6bed..d9ddf48 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # boot-wrapper-aarch64
 #
-#############################################################
+################################################################################
 
 BOOT_WRAPPER_AARCH64_VERSION        = 26b62f586020fd998c6efd43db657eaafeec14da
 BOOT_WRAPPER_AARCH64_SITE           = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 4a094bc..fd27620 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # grub
 #
-#############################################################
+################################################################################
 
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index 6e49a42..04c1c7f 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lpc32xxcdl
 #
-#############################################################
+################################################################################
 
 LPC32XXCDL_VERSION = lpc32xx_cdl_v2.11
 LPC32XXCDL_SITE = http://git.lpcware.com/lpc3xxx_cdl.git
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index f93ff81..6b81030 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mxs-bootlets
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
 	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 046bdc3..1b0ef4e 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # syslinux to make target msdos/iso9660 filesystems bootable
 #
-#############################################################
+################################################################################
 
 SYSLINUX_VERSION = 4.06
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f8e4aa9..3e188ee 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # uboot
 #
-#############################################################
+################################################################################
 
 UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index dae2039..00c63b1 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # x-loader
 #
-#############################################################
+################################################################################
 
 XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
 XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index c918684..f783ade 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the compressed loop root filesystem image
 #
-#############################################################
+################################################################################
 
 ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 5bcec13..0df2378 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cpio to archive target filesystem
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 4f737dd..402d19f 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the cramfs root filesystem image
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CRAMFS_OPTS=-b
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index d74f31e..cad5b42 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the ext2 root filesystem image
 #
-#############################################################
+################################################################################
 
 EXT2_OPTS :=
 
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index f1eb8b6..fe426cc 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -1,9 +1,9 @@
-#############################################################
+################################################################################
 #
 # Build a kernel with an integrated initial ramdisk
 # filesystem based on cpio.
 #
-#############################################################
+################################################################################
 
 ROOTFS_INITRAMFS_DEPENDENCIES += rootfs-cpio
 
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 029c0dd..0a10512 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -1,11 +1,11 @@
-#############################################################
+################################################################################
 #
 # Build the iso96600 root filesystem image
 #
 # Cannot be converted to the ROOTFS_TARGET infrastructure, because of
 # the temporary construction in ISO9660_TARGET_DIR.
 #
-#############################################################
+################################################################################
 
 ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index b5423a8..0232199 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the jffs2 root filesystem image
 #
-#############################################################
+################################################################################
 
 JFFS2_OPTS := -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
 SUMTOOL_OPTS := $(JFFS2_OPTS)
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index 1a9f499..63eb994 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the romfs root filesystem image
 #
-#############################################################
+################################################################################
 
 ROMFS_TARGET=$(IMAGE).romfs
 
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index d4b56f4..ae5182a 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the squashfs root filesystem image
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4),y)
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 1d327fa..9fecf73 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tar to archive target filesystem
 #
-#############################################################
+################################################################################
 
 TAR_OPTS:=$(BR2_TARGET_ROOTFS_TAR_OPTIONS)
 
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index e9033e8..08c952c 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Embed the ubifs image into an ubi one
 #
-#############################################################
+################################################################################
 
 UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index dca2e04..f1e4126 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Build the ubifs root filesystem image
 #
-#############################################################
+################################################################################
 
 UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 
diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
index 52e199c..1462227 100644
--- a/toolchain/elf2flt/elf2flt.mk
+++ b/toolchain/elf2flt/elf2flt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # elf2flt
 #
-#############################################################
+################################################################################
 
 # we keep a local checkout of uClinux CVS
 ELF2FLT_SOURCE:=$(ELF2FLT_DIR)/elf2flt
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index b5ae322..a04395b 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -1,11 +1,11 @@
-#############################################################
+################################################################################
 #
 # Setup the kernel headers. I include a generic package of
 # kernel headers here, so you shouldn't need to include your
 # own. Be aware these kernel headers _will_ get blown away
 # by a 'make clean' so don't put anything sacred in here...
 #
-#############################################################
+################################################################################
 
 DEFAULT_KERNEL_HEADERS:=$(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index d4f1d4c..44079e7 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # uClibc (the C library)
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
-- 
1.7.9.5
