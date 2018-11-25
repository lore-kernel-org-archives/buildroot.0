From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Nov 2018 06:36:19 -0200
Subject: [Buildroot] [PATCH v2] package/wolfssl: bump to version 3.15.5
Message-ID: <20181125083619.17033-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v1 -> v2:
  - Enable ARMv8 HW acceleration in a separate patch.
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 76c7db25a844..2fdaa5762b6a 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 4ab543c869a65a77dc5d0bc934b9d4852aa3d5834bd2f707a74a936602bd3687  v3.14.0-stable.tar.gz
+sha256 4e15f494604e41725499f8b708798f8ddc2fcaa8f39b4369bcd000b3cab482d8  v3.15.5-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index c246b085131d..68b638c3e2a8 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 3.14.0
+WOLFSSL_VERSION = 3.15.5
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
 WOLFSSL_INSTALL_STAGING = YES
-- 
2.17.1
