From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Fri, 28 Jul 2017 01:02:26 +0200
Subject: [Buildroot] [PATCH 1/2] fs/ext2: fix typo
Message-ID: <20170727230227.1097-1-m.hoffmann@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
---
 fs/ext2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 05c9e4809..3884b08b7 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -64,7 +64,7 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	default 5
 	help
 	  The number of blocks on the filesystem (as a percentage of the
-	  total number of blocksi), that are reserved for use by root.
+	  total number of blocks), that are reserved for use by root.
 	  Traditionally, this has been 5%, and all ext-related tools still
 	  default to reserving 5% when creating a new ext filesystem.
 
-- 
2.11.0
