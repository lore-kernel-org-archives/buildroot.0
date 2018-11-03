From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:49:57 +0100
Subject: [Buildroot] [git commit] fs/f2fs/Config.in: remove consecutive
 empty lines
Message-ID: <20181103145208.DA6B0812B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9617ce5cf9cb03f78c53bbb364b88db77f440b17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following check-package warning:

fs/f2fs/Config.in:51: consecutive empty lines

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index 8a66645325..32d86d8ce3 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -48,5 +48,4 @@ config BR2_TARGET_ROOTFS_F2FS_FEATURES
 	  List of features that the F2FS filesystem should support
 	  (e.g "encrypt")
 
-
 endif # BR2_TARGET_ROOTFS_F2FS
