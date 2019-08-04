From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 09:09:38 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 1.3.4
Message-ID: <20190804071351.ACF448E035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06445ee36dee49555599bc9c963201bce237ab64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/nfs-utils.hash | 6 ++++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 2bd5121186..74503c65bb 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,2 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.3/sha256sums.asc
-sha256 700d689c5622c87953c34102e5befafc4d3c811e676852238f0dd79c9c0c084d  nfs-utils-1.3.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.4/sha256sums.asc
+sha256 b42a5bc0a8d80d04650030ceb9a11f08f4acfbcb1ee297f657fb94e339c45975  nfs-utils-1.3.4.tar.xz
+# Locally computed
+sha256 576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index b81891a912..dc20942f71 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 1.3.3
+NFS_UTILS_VERSION = 1.3.4
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
