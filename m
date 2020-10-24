From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 23:00:56 +0200
Subject: [Buildroot] [git commit] package/fuse-overlayfs: bump version to
 1.2.0
Message-ID: <20201024204906.34CBB842D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3a8368da2facfcfdc5324a9dd22ae964ead3157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index 4f10be85a9..0c52e05cc9 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  1c0fa67f806c44d5c51f4bce02fdcb546137a2688a8de76d93d07b79defc9cac  fuse-overlayfs-1.1.2.tar.gz
+sha256  5df218732244059057686194b0e1fef66fb822d4087db48af88e1bc29bb1afde  fuse-overlayfs-1.2.0.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 1d19099eda..67bd9d1c7f 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.1.2
+FUSE_OVERLAYFS_VERSION = 1.2.0
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
