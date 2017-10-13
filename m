From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Oct 2017 21:16:53 +0200
Subject: [Buildroot] [PATCH 2/4] fs/cpio: add option for lz4 compression
In-Reply-To: <20171013191655.30427-1-peter@korsgaard.com>
References: <20171013191655.30427-1-peter@korsgaard.com>
Message-ID: <20171013191655.30427-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/cpio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 206baca677..679959d222 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -31,6 +31,11 @@ config BR2_TARGET_ROOTFS_CPIO_BZIP2
 	help
 	  Do compress the cpio filesystem with bzip2.
 
+config BR2_TARGET_ROOTFS_CPIO_LZ4
+	bool "lz4"
+	help
+	  Do compress the cpio filesystem with lz4.
+
 config BR2_TARGET_ROOTFS_CPIO_LZMA
 	bool "lzma"
 	help
-- 
2.11.0
