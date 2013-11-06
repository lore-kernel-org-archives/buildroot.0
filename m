From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:31 +0100
Subject: [Buildroot] [PATCH 3/7] rootfs-cpio: whitespace cleanup in Config.in
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
- Initial revision. This patch was introduced to enable the U-Boot image
  of the cpio rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/cpio/Config.in | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 87dde64..fd85d29 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -6,34 +6,34 @@ config BR2_TARGET_ROOTFS_CPIO
 	  by the bootloader.
 
 choice
-        prompt "Compression method"
-        default BR2_TARGET_ROOTFS_CPIO_NONE
-        depends on BR2_TARGET_ROOTFS_CPIO
-        help
-          Select compressor for cpio filesystem of the root filesystem.
-          If you use the cpio archive as an initial RAM filesystem, make
-          sure the kernel contains the decompression algorithm selected
-          here.
+	prompt "Compression method"
+	default BR2_TARGET_ROOTFS_CPIO_NONE
+	depends on BR2_TARGET_ROOTFS_CPIO
+	help
+	  Select compressor for cpio filesystem of the root filesystem.
+	  If you use the cpio archive as an initial RAM filesystem, make
+	  sure the kernel contains the decompression algorithm selected
+	  here.
 
 config BR2_TARGET_ROOTFS_CPIO_NONE
-        bool "no compression"
-        help
-          Do not compress the cpio filesystem.
+	bool "no compression"
+	help
+	  Do not compress the cpio filesystem.
 
 config BR2_TARGET_ROOTFS_CPIO_GZIP
-        bool "gzip"
-        help
-          Do compress the cpio filesystem with gzip.
+	bool "gzip"
+	help
+	  Do compress the cpio filesystem with gzip.
 
 config BR2_TARGET_ROOTFS_CPIO_BZIP2
-        bool "bzip2"
-        help
-          Do compress the cpio filesystem with bzip2.
+	bool "bzip2"
+	help
+	  Do compress the cpio filesystem with bzip2.
 
 config BR2_TARGET_ROOTFS_CPIO_LZMA
-        bool "lzma"
-        help
-          Do compress the cpio filesystem with lzma.
+	bool "lzma"
+	help
+	  Do compress the cpio filesystem with lzma.
 
 config BR2_TARGET_ROOTFS_CPIO_LZO
 	bool "lzo"
-- 
1.8.4.rc3
