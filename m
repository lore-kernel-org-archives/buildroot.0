From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Feb 2017 10:43:50 -0500
Subject: [Buildroot] [PATCH 38/38] nfs-utils: bump to version 2.1.1
Message-ID: <20170220154350.22780-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 2bd5121..766f6c7 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/1.3.3/sha256sums.asc
-sha256 700d689c5622c87953c34102e5befafc4d3c811e676852238f0dd79c9c0c084d  nfs-utils-1.3.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.1.1/sha256sums.asc
+sha256 0faeb54c70b84e6bd3b9b6901544b1f6add8d246f35c1683e402daf4e0c719ef  nfs-utils-2.1.1.tar.xz
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 179009d..b79f303 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 1.3.3
+NFS_UTILS_VERSION = 2.1.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPLv2+
-- 
2.9.3
