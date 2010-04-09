From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:22 +0200
Subject: [Buildroot] [PATCH 44/44] fs/*/Config.in: remove useless
	configuration comments
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0b79c5022d32b15180a18087a0fba5a2f1af5cc7.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on gzip, bzip2 and lzma are properly handled
automatically. No need to tell the user about this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/cpio/Config.in  |    6 ------
 fs/ext2/Config.in  |    6 ------
 fs/tar/Config.in   |    6 ------
 fs/ubifs/Config.in |    9 ---------
 4 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 02fd00d..374cfe0 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -19,22 +19,16 @@ config BR2_TARGET_ROOTFS_CPIO_GZIP
         bool "gzip"
         help
          Do compress the cpio filesystem with gzip.
-         Note that you either have to have gzip installed on your host
-         or select to build a gzip for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_CPIO_BZIP2
         bool "bzip2"
         help
          Do compress the cpio filesystem with bzip2.
-         Note that you either have to have bzip2 installed on your host
-         or select to build a bzip2 for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_CPIO_LZMA
         bool "lzma"
         help
          Do compress the cpio filesystem with lzma.
-         Note that you either have to have lzma installed on your host
-         or select to build a lzma for your host. See the packages submenu.
 
 endchoice
 
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 02ec18f..5c041d9 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -40,22 +40,16 @@ config BR2_TARGET_ROOTFS_EXT2_GZIP
 	bool "gzip"
 	help
 	  Do compress the ext2 filesystem with gzip.
-	  Note that you either have to have gzip installed on your host
-	  or select to build a gzip for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_EXT2_BZIP2
 	bool "bzip2"
 	help
 	  Do compress the ext2 filesystem with bzip2.
-	  Note that you either have to have bzip2 installed on your host
-	  or select to build a bzip2 for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_EXT2_LZMA
 	bool "lzma"
 	help
 	  Do compress the ext2 filesystem with lzma.
-	  Note that you either have to have lzma installed on your host
-	  or select to build a lzma for your host. See the packages submenu.
 
 endchoice
 
diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 0adca79..5aaf9bd 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -19,22 +19,16 @@ config BR2_TARGET_ROOTFS_TAR_GZIP
 	bool "gzip"
 	help
 	 Do compress the tarball with gzip.
-	 Note that you either have to have gzip installed on your host
-	 or select to build a gzip for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_TAR_BZIP2
 	bool "bzip2"
 	help
 	 Do compress the tarball with bzip2.
-	 Note that you either have to have bzip2 installed on your host
-	 or select to build a bzip2 for your host. See the packages submenu.
 
 config BR2_TARGET_ROOTFS_TAR_LZMA
 	bool "lzma"
 	help
 	 Do compress the tarball with lzma.
-	 Note that you either have to have lzma installed on your host
-	 or select to build a lzma for your host. See the packages submenu.
 
 endchoice
 
diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index 9fa510e..bcf409c 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -64,25 +64,16 @@ config BR2_TARGET_ROOTFS_UBIFS_GZIP
 	bool "gzip"
 	help
 	  Do compress the ubifs filesystem with gzip.
-	  Note that you either have to have gzip installed on your
-	  host or select to build a gzip for your host. See the
-	  packages submenu.
 
 config BR2_TARGET_ROOTFS_UBIFS_BZIP2
 	bool "bzip2"
 	help
 	  Do compress the ubifs filesystem with bzip2.
-	  Note that you either have to have bzip2 installed on your
-	  host or select to build a bzip2 for your host. See the
-	  packages submenu.
 
 config BR2_TARGET_ROOTFS_UBIFS_LZMA
 	bool "lzma"
 	help
 	  Do compress the ubifs filesystem with lzma.
-	  Note that you either have to have lzma installed on your
-	  host or select to build a lzma for your host. See the
-	  packages submenu.
 
 endchoice
 
-- 
1.6.3.3
