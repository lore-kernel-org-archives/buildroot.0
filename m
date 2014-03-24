From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Mar 2014 15:17:46 +0100
Subject: [Buildroot] [git commit] ecryptfs-utils: bump to version 104
Message-ID: <20140324142757.058C79C044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e2b6d52b299c55ddd6dfbfcb1bf1b6675fd618e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
