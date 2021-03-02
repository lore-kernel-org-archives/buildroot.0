From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 14:41:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: add CPE variables
Message-ID: <20210302134126.362566-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libtiff:libtiff is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtiff%3Alibtiff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/tiff.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 7810275204..b8b2b99c43 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -8,6 +8,8 @@ TIFF_VERSION = 4.2.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
+TIFF_CPE_ID_VENDOR = libtiff
+TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-cxx \
-- 
2.30.0
