From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 23:54:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/qpdf: add QPDF_CPE_ID_VENDOR
Message-ID: <20210515215406.3669467-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:qpdf_project:qpdf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aqpdf_project%3Aqpdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpdf/qpdf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index fd31140b0c..ec3d3f89a3 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -9,6 +9,7 @@ QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
+QPDF_CPE_ID_VENDOR = qpdf_project
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --with-random=/dev/urandom
-- 
2.30.2
