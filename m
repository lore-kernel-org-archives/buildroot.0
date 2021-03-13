From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Mar 2021 23:26:31 +0100
Subject: [Buildroot] [PATCH v1] package/btrfs-progs: bump version to 5.11
Message-ID: <20210313222631.25633-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://btrfs.wiki.kernel.org/index.php/Changelog#btrfs-progs_v5.11_.28Mar_2021.29

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 9008513630..aac144963e 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 5c2f048b8c814852614b0b262ab2d468ea02774ef01124ebc0ab708df262de5c  btrfs-progs-v5.7.tar.xz
+sha256 d41961b0a92160c80f894ad9a1882822889c2e1d084cbf3e08b8c214a5cf0137  btrfs-progs-v5.11.tar.xz
 # Locally computed
 sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 22e1e330c5..96456d1238 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 5.7
+BTRFS_PROGS_VERSION = 5.11
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.30.1
