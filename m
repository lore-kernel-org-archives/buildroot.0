From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 16:58:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/ecryptfs-utils: bump version to 109
Message-ID: <1453651107-26352-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ecryptfs-utils/ecryptfs-utils.hash | 4 ++--
 package/ecryptfs-utils/ecryptfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.hash b/package/ecryptfs-utils/ecryptfs-utils.hash
index 9dc6b99..40cc17c 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.hash
+++ b/package/ecryptfs-utils/ecryptfs-utils.hash
@@ -1,2 +1,2 @@
-# From https://launchpad.net/ecryptfs/trunk/104/+download/ecryptfs-utils_104.orig.tar.gz/+md5
-md5	6ae93822bcf0d15470516c30a3deee32	ecryptfs-utils_104.orig.tar.gz
+# From https://launchpad.net/ecryptfs/trunk/109/+download/ecryptfs-utils_109.orig.tar.gz/+md5
+md5	8e33f096c8cb8288f9c29a9936cd0d28	ecryptfs-utils_109.orig.tar.gz
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 88ca55e..81a4b4b 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ECRYPTFS_UTILS_VERSION = 104
+ECRYPTFS_UTILS_VERSION = 109
 ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
 ECRYPTFS_UTILS_LICENSE = GPLv2+
-- 
2.7.0.rc3
