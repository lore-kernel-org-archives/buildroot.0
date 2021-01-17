From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 12:49:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libressl: add LIBRESSL_CPE_ID_VENDOR
Message-ID: <20210117114910.313746-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:openbsd:libressl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenbsd%3Alibressl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libressl/libressl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 2f7644a8e8..654b8bda26 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -8,6 +8,7 @@ LIBRESSL_VERSION = 3.2.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
+LIBRESSL_CPE_ID_VENDOR = openbsd
 LIBRESSL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
-- 
2.29.2
