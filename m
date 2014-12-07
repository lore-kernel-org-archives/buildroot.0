From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:32:42 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 3.17.3
Message-ID: <20141207203246.C24E08011D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd5543200da6e8432f4b3f8e87a02ca76bbcedaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/btrfs-progs/btrfs-progs.hash |    2 +-
 package/btrfs-progs/btrfs-progs.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f030c17..4ef14a3 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	50ecc724a41a6ec9e37a0fbb134d336bdafd7fa24ec69de0c591c211da4456c6	btrfs-progs-v3.17.2.tar.xz
+sha256	e7bd9ff8d95b515973d3a1255c17fd481bcd75e4420f00c6c9c99489d1ddac2c	btrfs-progs-v3.17.3.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index b13f227..ec54746 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.17.2
+BTRFS_PROGS_VERSION = 3.17.3
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
