From: J Evans <g4@novadsp.com>
Date: Mon,  1 May 2017 13:07:43 +0100
Subject: [Buildroot] [PATCH 1/1] ext2: add help text for
	BR2_TARGET_ROOTFS_EXT2_BLOCKS
Message-ID: <1493640463-59836-1-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 fs/ext2/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 19ed140..e7cded5 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -48,6 +48,9 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "exact size in blocks"
 	default 61440
+    help
+      Determines the final size of your file system. The default
+      value of 61440 creates a 60MB filesystem. 
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
-- 
2.7.4
