From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:15:13 +0200
Subject: [Buildroot] [git commit] ext2: add help text for
	BR2_TARGET_ROOTFS_EXT2_BLOCKS
Message-ID: <20170504151517.2402D8283B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=426fd787fa4f76d293e3b2e4f405c9a9b7d42666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J Evans <g4@novadsp.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 19ed140..a1e3647 100644
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
