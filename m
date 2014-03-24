From: Marcin Bis <marcin@bis.org.pl>
Date: Mon, 24 Mar 2014 11:39:45 +0100
Subject: [Buildroot] [PATCH] ecryptfs-utils: bump to version 104
Message-ID: <1395657585-25416-1-git-send-email-marcin@bis.org.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
---
 package/ecryptfs-utils/ecryptfs-utils.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index f3f46e1..b1ca797 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ECRYPTFS_UTILS_VERSION         = 103
+ECRYPTFS_UTILS_VERSION         = 104
 ECRYPTFS_UTILS_SOURCE          = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 ECRYPTFS_UTILS_SITE            = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
 ECRYPTFS_UTILS_LICENSE         = GPLv2+
-- 
1.7.9.5
