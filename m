From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:40:41 +0200
Subject: [Buildroot] [git commit] fs/*/*.mk: fix code style
Message-ID: <20180401064048.270AF80F79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65e37439450808f0a18c4f45dafe4b915c23aa63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The header of the initramfs.mk file fits in one line, so rearrange it.
Remove consecutive empty line.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/initramfs/initramfs.mk | 3 +--
 fs/iso9660/iso9660.mk     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index b8dee18ec5..c751093214 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -1,7 +1,6 @@
 ################################################################################
 #
-# Build a kernel with an integrated initial ramdisk
-# filesystem based on cpio.
+# Build a kernel with an integrated initial ramdisk filesystem based on cpio.
 #
 ################################################################################
 
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b33cf4cd8a..a129655ce3 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -128,7 +128,6 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
-
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
