From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 15:14:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libexif: set LIBEXIF_CPE_ID_VALID
Message-ID: <20210117141439.345753-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libexif_project:libexif is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibexif_project%3Alibexif

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libexif/libexif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 594e8855c5..9d29cbf590 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -12,6 +12,7 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
+LIBEXIF_CPE_ID_VALID = YES
 # 0001-fixed-another-unsigned-integer-overflow.patch
 LIBEXIF_IGNORE_CVES += CVE-2020-0198
 # 0002-fixed-a-incorrect-overflow-check.patch
-- 
2.29.2
