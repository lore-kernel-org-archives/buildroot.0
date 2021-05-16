From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 10:50:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libidn2: add LIBIDN2_CPE_ID_VENDOR
Message-ID: <20210516085022.3763231-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:libidn2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alibidn2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 3f87b9bb8c..4db302dbf4 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -8,6 +8,7 @@ LIBIDN2_VERSION = 2.3.0
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
+LIBIDN2_CPE_ID_VENDOR = gnu
 LIBIDN2_DEPENDENCIES = \
 	host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
-- 
2.30.2
