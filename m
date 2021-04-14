From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Apr 2021 23:00:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgis: add POSTGIS_CPE_ID_VENDOR
Message-ID: <20210414210047.1370726-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:postgis:postgis is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apostgis%3Apostgis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgis/postgis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 1661f48ff2..4bfcc2ee84 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -10,6 +10,7 @@ POSTGIS_SITE = https://download.osgeo.org/postgis/source
 POSTGIS_MAKE = $(MAKE1)
 POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
 POSTGIS_LICENSE_FILES = LICENSE.TXT
+POSTGIS_CPE_ID_VENDOR = postgis
 # configure.ac is patched so need to run autoreconf
 POSTGIS_AUTORECONF = YES
 
-- 
2.30.2
