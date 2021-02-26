From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2021 08:48:19 +0100
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.5.3
Message-ID: <20210308072136.23C938896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f50c212218a8521bc66be22cc14581f5449ff84e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 6268552ca1..25c11cb686 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.2/sha256sums.asc
-sha256  d493b81c9d3ffce5d10af701a63ed2b8a21768c23da4a2eceb4d708aea65d9de  nfs-utils-2.5.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.3/sha256sums.asc
+sha256  b54d6d8ea2ee62d64111278301ba4631b7bb19174e7f717a724fe5d463900c80  nfs-utils-2.5.3.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index df581b381f..c384e939d8 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.5.2
+NFS_UTILS_VERSION = 2.5.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
