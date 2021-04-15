From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:04:19 +0200
Subject: [Buildroot] [git commit] package/postgis: add POSTGIS_CPE_ID_VENDOR
Message-ID: <20210415185143.4FA94804AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0efb6e0caeb1829ee9ef3f43c8b6dff236eb1acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:postgis:postgis is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apostgis%3Apostgis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/postgis/postgis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index c6c1b8ff50..2980da22e0 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -10,6 +10,7 @@ POSTGIS_SITE = https://download.osgeo.org/postgis/source
 POSTGIS_MAKE = $(MAKE1)
 POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
 POSTGIS_LICENSE_FILES = LICENSE.TXT
+POSTGIS_CPE_ID_VENDOR = postgis
 # configure.ac is patched so need to run autoreconf
 POSTGIS_AUTORECONF = YES
 
