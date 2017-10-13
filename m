From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Oct 2017 21:16:54 +0200
Subject: [Buildroot] [PATCH 3/4] fs/ext2: add option for lz4 compression
In-Reply-To: <20171013191655.30427-1-peter@korsgaard.com>
References: <20171013191655.30427-1-peter@korsgaard.com>
Message-ID: <20171013191655.30427-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ext2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 3884b08b76..27ad69fde9 100644
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
-- 
2.11.0
