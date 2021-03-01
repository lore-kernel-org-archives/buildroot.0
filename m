From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Mar 2021 17:48:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbsd: add LIBBSD_CPE_ID_VENDOR
Message-ID: <20210301164818.161629-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:freedesktop:libbsd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Alibbsd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbsd/libbsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 27bac6838a..256a75f15e 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -10,6 +10,7 @@ LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
 		MIT, ISC, Beerware
 LIBBSD_LICENSE_FILES = COPYING
+LIBBSD_CPE_ID_VENDOR = freedesktop
 LIBBSD_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.30.0
