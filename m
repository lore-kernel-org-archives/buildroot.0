From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Jun 2021 17:44:18 +0300
Subject: [Buildroot] [PATCH 1/1] wpebackend-fdo: bump to version 1.10.0
Message-ID: <20210611144418.450231-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version change does not include functional changes over 1.9.92, but
it is slated as stable (hence the even second version number). Release
notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.10.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 28d6c36938..f280024b28 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.9.92.tar.xz.sums
-md5  5c2f7fab6623e0964bc0d1b4a01719f0  wpebackend-fdo-1.9.92.tar.xz
-sha1  d07fdfec0df53c57e3ed36a1efffecf30d1b418c  wpebackend-fdo-1.9.92.tar.xz
-sha256  fc5b388a91d6f2c22803e1a21a6759a314b4539e5169c6e272bfc953a05fbb85  wpebackend-fdo-1.9.92.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.10.0.tar.xz.sums
+md5  306adbb0c66dc753e1794c83b7a2682b  wpebackend-fdo-1.10.0.tar.xz
+sha1  bf71718a213c6511dea278ade5ce90967d181995  wpebackend-fdo-1.10.0.tar.xz
+sha256  b89dfd3500a4dec711132cd7bff72599e67d56a419d000730e14bb99547509cc  wpebackend-fdo-1.10.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 4979dad8f9..72f0ad9019 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.9.92
+WPEBACKEND_FDO_VERSION = 1.10.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.32.0
