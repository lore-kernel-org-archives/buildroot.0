From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 22:14:22 +0200
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.1
Message-ID: <20150622201513.786EB806B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8523dc6aae0ae0a2607e6bdb0852c43c0564696b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.hash |    2 +-
 package/btrfs-progs/btrfs-progs.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 1ffb662..0f07f69 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	2c2e10e79edd16a92effe8619c527fd130bc272fbca67896e1705bb2ec0293cb	btrfs-progs-v4.0.1.tar.xz
+sha256	abc6ff9dbbf948e7358edd34db32103cba8b86c5cb9e3ed7eb3b5630e2feb7e8	btrfs-progs-v4.1.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index d111352..0190baa 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.0.1
+BTRFS_PROGS_VERSION = 4.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf acl attr e2fsprogs lzo util-linux zlib
