From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 22:39:51 +0200
Subject: [Buildroot] [git commit] sshfs: bump to version 2.7
Message-ID: <20160428204526.DBD2081ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82d6c702610cf783a2e46f6230a1182016fdc1da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
