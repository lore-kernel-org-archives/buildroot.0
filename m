From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:30:44 +0100
Subject: [Buildroot] [git commit] rootfs-cpio: whitespace cleanup in
	Config.in
Message-ID: <20131110233747.64A8A9BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb7ad1c44ea62e7b7ac0111dc728078eba6b6fc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/cpio/Config.in |   40 ++++++++++++++++++++--------------------
 1 files changed, 20 insertions(+), 20 deletions(-)

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
