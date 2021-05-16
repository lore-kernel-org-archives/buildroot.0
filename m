From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 12:32:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/exempi: add EXEMPI_CPE_ID_VENDOR
Message-ID: <20210516103252.3771552-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:exempi_project:exempi is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexempi_project%3Aexempi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exempi/exempi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 3790b16b32..f481469d2c 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -13,5 +13,6 @@ EXEMPI_DEPENDENCIES = host-pkgconf expat zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 EXEMPI_LICENSE = BSD-3-Clause
 EXEMPI_LICENSE_FILES = COPYING
+EXEMPI_CPE_ID_VENDOR = exempi_project
 
 $(eval $(autotools-package))
-- 
2.30.2
