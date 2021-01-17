From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 14:49:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/libzip: add LIBZIP_CPE_ID_VENDOR
Message-ID: <20210117134950.343899-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libzip:libzip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibzip%3Alibzip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzip/libzip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 9d64db32fa..4a028f970a 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -9,6 +9,7 @@ LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
 LIBZIP_LICENSE_FILES = LICENSE
+LIBZIP_CPE_ID_VENDOR = libzip
 LIBZIP_INSTALL_STAGING = YES
 LIBZIP_DEPENDENCIES = zlib
 HOST_LIBZIP_DEPENDENCIES = host-zlib
-- 
2.29.2
