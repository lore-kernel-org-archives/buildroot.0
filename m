From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 22:12:18 +0100
Subject: [Buildroot] [PATCH 1/1] squashfs: bump to fix RHEL 5 compilation
	error
Message-ID: <20170203211218.20331-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Bump squashfs with one commit to fix a compilation error on the ancient RHEL
5 distribution.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/squashfs/squashfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 1a5f1ea..4f84872 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 9c1db6d13a51a2e009f0027ef336ce03624eac0d
+SQUASHFS_VERSION = 3de1687d7432ea9b302c2db9521996f506c140a3
 SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
 SQUASHFS_SITE_METHOD = git
 SQUASHFS_LICENSE = GPLv2+
-- 
2.10.2
