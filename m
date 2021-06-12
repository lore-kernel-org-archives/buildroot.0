From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 17:20:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mupdf: add MUPDF_CPE_ID_VENDOR
Message-ID: <20210612152003.543086-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:artifex:mupdf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aartifex%3Amupdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mupdf/mupdf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 5a905f7903..78dacd214c 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -10,6 +10,7 @@ MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.gz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
 MUPDF_LICENSE_FILES = COPYING
+MUPDF_CPE_ID_VENDOR = artifex
 MUPDF_INSTALL_STAGING = YES
 MUPDF_DEPENDENCIES = \
 	freetype \
-- 
2.30.2
