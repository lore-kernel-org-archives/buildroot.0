From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:56:00 +0200
Subject: [Buildroot] [git commit branch/next] package/ecryptfs-utils: bump
	version to 111
Message-ID: <20170528130534.81B61800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=422bb9fa62afbcf6ee001612481c4520fb1b22a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ecryptfs-utils/ecryptfs-utils.hash | 6 ++++--
 package/ecryptfs-utils/ecryptfs-utils.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.hash b/package/ecryptfs-utils/ecryptfs-utils.hash
index 40cc17c..1e08661 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.hash
+++ b/package/ecryptfs-utils/ecryptfs-utils.hash
@@ -1,2 +1,4 @@
-# From https://launchpad.net/ecryptfs/trunk/109/+download/ecryptfs-utils_109.orig.tar.gz/+md5
-md5	8e33f096c8cb8288f9c29a9936cd0d28	ecryptfs-utils_109.orig.tar.gz
+# From https://launchpad.net/ecryptfs/trunk/111/+download/ecryptfs-utils_111.orig.tar.gz/+md5
+md5 83513228984f671930752c3518cac6fd  ecryptfs-utils_111.orig.tar.gz
+# Locally computed
+sha256 112cb3e37e81a1ecd8e39516725dec0ce55c5f3df6284e0f4cc0f118750a987f  ecryptfs-utils_111.orig.tar.gz
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 334e115..eb3194b 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ECRYPTFS_UTILS_VERSION = 109
+ECRYPTFS_UTILS_VERSION = 111
 ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
 ECRYPTFS_UTILS_LICENSE = GPL-2.0+
