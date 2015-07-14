From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 16:06:24 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.1.2
Message-ID: <1436900784-25975-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 10118cc..799c878 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	b7f2698fd6629a1ece1422638e776d619f41d342db4d82c29dd05a57a27001b4	btrfs-progs-v4.1.1.tar.xz
+sha256	62db60c6a0868afb6302112cea54c756873bc30b826696b167ec03ecd61b2f12	btrfs-progs-v4.1.2.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index aac0257..2c3dc50 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.1.1
+BTRFS_PROGS_VERSION = 4.1.2
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
-- 
2.3.6
