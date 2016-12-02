From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Dec 2016 17:17:30 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.8.5
Message-ID: <20161202161747.38B5A802F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2332aa1f0f4316fff7343d6976c656763c834eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 6d262a1..8cc3769 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 bf26ead666c337a62a74bc9ec7f8dd9ee200e60e5fe5289967d53328eff261c5  btrfs-progs-v4.8.4.tar.xz
+sha256 d247b1c022aca5def3415bfa51e00c566cce36660a3ee517d4b6a1af911a08ef  btrfs-progs-v4.8.5.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index e780903..bf37d57 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.8.4
+BTRFS_PROGS_VERSION = 4.8.5
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
