From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Oct 2017 21:16:55 +0200
Subject: [Buildroot] [PATCH 4/4] fs/tar: add option for lz4 compression
In-Reply-To: <20171013191655.30427-1-peter@korsgaard.com>
References: <20171013191655.30427-1-peter@korsgaard.com>
Message-ID: <20171013191655.30427-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/tar/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 63663ecd6f..2116edf143 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -26,6 +26,11 @@ config BR2_TARGET_ROOTFS_TAR_BZIP2
 	help
 	  Do compress the tarball with bzip2.
 
+config BR2_TARGET_ROOTFS_TAR_LZ4
+	bool "lz4"
+	help
+	  Do compress the tarball with lz4.
+
 config BR2_TARGET_ROOTFS_TAR_LZMA
 	bool "lzma"
 	help
-- 
2.11.0
