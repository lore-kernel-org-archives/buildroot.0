From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:44:08 +0100
Subject: [Buildroot] [git commit] fs/tar: add option for lz4 compression
Message-ID: <20180108224423.7069E83C34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7652635fafbdb18a3a0255c0e62b29870768b75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/tar/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 63663ec..2116edf 100644
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
