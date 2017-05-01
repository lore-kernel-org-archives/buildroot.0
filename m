From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:36 +0200
Subject: [Buildroot] [PATCH 1/9] ext2: add help text for
	BR2_TARGET_ROOTFS_EXT2_BLOCKS
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <78e1595a645865a4e5862b84abf8a66173f2ccf6.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: J Evans <g4@novadsp.com>

Signed-off-by: J Evans <g4@novadsp.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/ext2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 19ed140c88..a1e3647a14 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -48,6 +48,8 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "exact size in blocks"
 	default 61440
+	help
+	  Specify the file system size as a number of 1024-byte blocks.
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
-- 
2.11.0
