From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 22 Jan 2021 16:29:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/fuse-overlayfs: bump to version
 1.4.0
Message-ID: <20210122142936.2026366-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index 0c52e05cc9..9770ee0d3f 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5df218732244059057686194b0e1fef66fb822d4087db48af88e1bc29bb1afde  fuse-overlayfs-1.2.0.tar.gz
+sha256  7e5666aef4f2047e6a5202d6438b08c2d314dba5b40e431014e7dbb8168d9018  fuse-overlayfs-1.4.0.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 67bd9d1c7f..707cacce03 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.2.0
+FUSE_OVERLAYFS_VERSION = 1.4.0
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
-- 
2.27.0
