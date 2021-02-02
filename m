From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Feb 2021 18:30:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: add
 SQLCIPHER_CPE_ID_VENDOR
Message-ID: <20210202173043.1517613-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:zetetic:sqlcipher is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azetetic%3Asqlcipher

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 5a9a77c1ee..393d50b201 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -8,6 +8,7 @@ SQLCIPHER_VERSION = 4.4.2
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
+SQLCIPHER_CPE_ID_VENDOR = zetetic
 SQLCIPHER_DEPENDENCIES = host-pkgconf openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
-- 
2.29.2
