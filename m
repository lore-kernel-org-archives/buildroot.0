From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 08:32:28 +0200
Subject: [Buildroot] [git commit] libsigsegv: bump to version 2.12
Message-ID: <20180330063308.803BF7FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be824409c4bc83cf0b61816bdf2c4edf8cd15da3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigsegv/libsigsegv.hash | 5 ++++-
 package/libsigsegv/libsigsegv.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
index e937259ece..47ba356821 100644
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
index d2524977a4..6fa0929bba 100644
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
