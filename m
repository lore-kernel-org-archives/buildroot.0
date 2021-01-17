From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 19:18:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: add PHP_CPE_ID_VENDOR
Message-ID: <20210117181849.368318-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:php:php is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aphp%3Aphp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/php.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index fa518c3012..7a5b7bae04 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -13,6 +13,7 @@ PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_DEPENDENCIES = host-pkgconf pcre2
 PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
+PHP_CPE_ID_VENDOR = php
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
-- 
2.29.2
