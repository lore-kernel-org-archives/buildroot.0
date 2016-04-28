From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2016 17:29:43 -0300
Subject: [Buildroot] [PATCH] sshfs: bump to version 2.7
Message-ID: <1461875383-28504-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/sshfs.hash | 2 +-
 package/sshfs/sshfs.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 16253e0..77f6a0f 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d208949e00a3a46c6e63e	sshfs-fuse-2.5.tar.gz
+sha256	ce5f9d390934fc88c287dd937a39d15c2b40cbea6967ba24ad93ed90e0027128	sshfs-2.7.tar.gz
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index f59f7ea..716b362 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 2.5
-SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_$(subst .,_,$(SSHFS_VERSION))
-SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
+SSHFS_VERSION = 2.7
+SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPLv2
 SSHFS_LICENSE_FILES = COPYING
 SSHFS_DEPENDENCIES = \
-- 
2.7.3
