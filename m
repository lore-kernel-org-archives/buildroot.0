From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:41:56 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.5.2
Message-ID: <20201024202950.2A9E483FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=057cd929b30212fcdbecfc73953b83d0cfbe0654
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2.5.2 and add missing whitespace in .hash file for
COPYING.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/nfs-utils.hash | 6 +++---
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 266752071a..6268552ca1 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.1/sha256sums.asc
-sha256 0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4  nfs-utils-2.5.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.2/sha256sums.asc
+sha256  d493b81c9d3ffce5d10af701a63ed2b8a21768c23da4a2eceb4d708aea65d9de  nfs-utils-2.5.2.tar.xz
 # Locally computed
-sha256 576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
+sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index da85cb178f..d60b5055a0 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.5.1
+NFS_UTILS_VERSION = 2.5.2
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
