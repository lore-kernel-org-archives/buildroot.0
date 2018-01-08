From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:44:00 +0100
Subject: [Buildroot] [git commit] fs/cpio: add option for lz4 compression
Message-ID: <20180108224423.606AF7FDBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c7c71825f3ebc26e36ee6c42421bcaa66048eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/cpio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 206baca..679959d 100644
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
