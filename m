From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:10:29 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 3.18.2
Message-ID: <20150127221916.8A55B80E26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c60ccf7b7c20139997bd41e739fe7cd444d476b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.hash |    2 +-
 package/btrfs-progs/btrfs-progs.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 2ee2463..655ef5f 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	55509a3fa8e57deb4f41bb8a25cad850235b1285892c179bfcc914fec4abdd09	btrfs-progs-v3.18.1.tar.xz
+sha256	dd8ddb4d201e5ffd32a15ed0e1f33fbc2c8fb16383f1519a9fae136698c2dfec	btrfs-progs-v3.18.2.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index e8d3dcc..c6c36cf 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.18.1
+BTRFS_PROGS_VERSION = 3.18.2
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
-BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1
+BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1 DISABLE_BACKTRACE=1
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
 
