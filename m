From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  7 Nov 2017 16:51:07 -0500
Subject: [Buildroot] [PATCH 1/1] libressl: bump to 2.6.3
Message-ID: <20171107215107.559-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 580701d6a7..42f3028ca4 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,2 +1,2 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256	e57f5e3d5842a81fe9351b6e817fcaf0a749ca4ef35a91465edba9e071dce7c4	libressl-2.5.5.tar.gz
+sha256	aead6598263171b96970da0d881e616d0813b69b35ebdc5991f87ff2ea7f5c98	libressl-2.6.3.tar.gz
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ccd236d293..0806ff6c22 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.5.5
+LIBRESSL_VERSION = 2.6.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.13.6
