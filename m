From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Jun 2016 07:11:43 -0300
Subject: [Buildroot] [PATCH] sshfs: bump to version 2.8
Message-ID: <1466676703-14991-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/sshfs.hash | 4 ++--
 package/sshfs/sshfs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 77f6a0f..09ae5d1 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256	ce5f9d390934fc88c287dd937a39d15c2b40cbea6967ba24ad93ed90e0027128	sshfs-2.7.tar.gz
+# Locally calculated after checking pgp signature
+sha256	7f689174d02e6b7e2631306fda4fb8e6b4483102d1bce82b3cdafba33369ad22	sshfs-2.8.tar.gz
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 716b362..de4c361 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 2.7
-SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
+SSHFS_VERSION = 2.8
+SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_$(SSHFS_VERSION)
 SSHFS_LICENSE = GPLv2
 SSHFS_LICENSE_FILES = COPYING
 SSHFS_DEPENDENCIES = \
-- 
2.7.3
