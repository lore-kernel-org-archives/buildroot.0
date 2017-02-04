From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 09:18:55 +0100
Subject: [Buildroot] [git commit] squashfs: bump to fix RHEL 5 compilation
	error
Message-ID: <20170204083947.2D2CE802EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee90313c648b7e0eb28ffad3a458f3e18bab23d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump squashfs with one commit to fix a compilation error on the ancient RHEL
5 distribution.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
