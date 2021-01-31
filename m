From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Jan 2021 13:54:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/leptonica: add
 LEPTONICA_CPE_ID_VENDOR
Message-ID: <20210131125457.3810589-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:leptonica:leptonica is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aleptonica%3Aleptonica

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leptonica/leptonica.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 06eda6acca..fd122fb15b 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -8,6 +8,7 @@ LEPTONICA_VERSION = 1.80.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
+LEPTONICA_CPE_ID_VENDOR = leptonica
 LEPTONICA_INSTALL_STAGING = YES
 LEPTONICA_DEPENDENCIES = host-pkgconf
 
-- 
2.29.2
