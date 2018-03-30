From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Mar 2018 08:44:42 +0300
Subject: [Buildroot] [PATCH] libsigsegv: bump to version 2.12
Message-ID: <e08489c37b39780eb20a2fb5ad0bb530cd8a1ac2.1522388682.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsigsegv/libsigsegv.hash | 5 ++++-
 package/libsigsegv/libsigsegv.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
index e937259ece83..47ba3568217d 100644
--- a/package/libsigsegv/libsigsegv.hash
+++ b/package/libsigsegv/libsigsegv.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	dd7c2eb2ef6c47189406d562c1dc0f96f2fc808036834d596075d58377e37a18	libsigsegv-2.11.tar.gz
+# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.12.tar.gz.sig
+sha256	3ae1af359eebaa4ffc5896a1aee3568c052c99879316a1ab57f8fe1789c390b6	libsigsegv-2.12.tar.gz
+# Locally calculated
+sha256	8f2983e9a940367f48999881c14775db725ee643bce1e2f1ba195eb629a33cde	COPYING
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index d2524977a4dd..6fa0929bba03 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGSEGV_VERSION = 2.11
+LIBSIGSEGV_VERSION = 2.12
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
-- 
2.16.2
