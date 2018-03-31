From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:32 -0300
Subject: [Buildroot] [PATCH 07/36] fs/*/*.mk: fix code style
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The header of the initramfs.mk file fits in one line, so rearrange it.
Remove consecutive empty line.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
index 207c6aa39f..348be9950d 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -128,7 +128,6 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
 endif # ROOTFS_ISO9660_USE_INITRD
 
-
 define ROOTFS_ISO9660_CMD
 	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
-- 
2.14.1
