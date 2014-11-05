From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  5 Nov 2014 08:10:54 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.17.1
Message-ID: <1415185854-9663-1-git-send-email-gustavo@zacarias.com.ar>
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
index 497f142..0f207b2 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	ecafbf71e729c7e907dac488c2e0c94983dd38420f56dce85e2a4310a06bf0a0	btrfs-progs-v3.17.tar.xz
+sha256	6c01579c7b858c175aaed6b3b087dadaa38efb8e590a6928f1afe86bb8faaaab	btrfs-progs-v3.17.1.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 67d2e37..d16fa0d 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.17
+BTRFS_PROGS_VERSION = 3.17.1
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
-- 
2.0.4
