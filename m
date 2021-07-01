From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  1 Jul 2021 10:14:54 -0700
Subject: [Buildroot] [PATCH 1/1] package/libressl: bump version to 3.3.3
Message-ID: <20210701171454.36440-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 9f216bf2f1..5f6b22aede 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  798a65fd61d385e09d559810cdfa46512f8def5919264cfef241a7b086ce7cfe  libressl-3.2.5.tar.gz
+sha256  a471565b36ccd1a70d0bd7d37c6e95c43a26a62829b487d9d2cdebfe58be3066  libressl-3.3.3.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index d09df8f40f..f1f5e1974d 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.2.5
+LIBRESSL_VERSION = 3.3.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.31.1
