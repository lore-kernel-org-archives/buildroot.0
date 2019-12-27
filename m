From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 15:35:48 +0100
Subject: [Buildroot] [PATCH] package/ecryptfs-utils: fix typo in Config.in
 comment
Message-ID: <20191227143548.83674-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ecryptfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 68a659d33d..0c39f48d08 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
+comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-- 
2.20.1
