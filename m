From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  9 Jul 2017 04:35:51 +0300
Subject: [Buildroot] [PATCH] libssh2: bump to version 1.8.0
Message-ID: <95317f900d64d7027802e5805e79d21f60944e8a.1499564151.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh2/libssh2.hash | 3 ++-
 package/libssh2/libssh2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 8f6268f3d35f..6b1ccedd3238 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584	libssh2-1.7.0.tar.gz
+# https://www.libssh2.org/download/libssh2-1.8.0.tar.gz.asc
+sha256	39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4	libssh2-1.8.0.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 847c2f1b8e53..ab721ac2dc87 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.7.0
+LIBSSH2_VERSION = 1.8.0
 LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
-- 
2.13.2
