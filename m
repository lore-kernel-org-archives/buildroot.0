From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:46:13 +0200
Subject: [Buildroot] [git commit] fs/ext2: fix typo
Message-ID: <20170728224459.9576082153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef47a481376b0b209a2003e4f8e23209b25800a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/ext2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 05c9e48..3884b08 100644
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
 
