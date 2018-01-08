From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:44:04 +0100
Subject: [Buildroot] [git commit] fs/ext2: add option for lz4 compression
Message-ID: <20180108224423.681DA83C35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09525797542336bbed0cff0ac80c8bcae3e6b287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 3884b08..27ad69f 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -108,6 +108,11 @@ config BR2_TARGET_ROOTFS_EXT2_BZIP2
 	help
 	  Do compress the ext2/3/4 filesystem with bzip2.
 
+config BR2_TARGET_ROOTFS_EXT2_LZ4
+	bool "lz4"
+	help
+	  Do compress the ext2 filesystem with lz4.
+
 config BR2_TARGET_ROOTFS_EXT2_LZMA
 	bool "lzma"
 	help
