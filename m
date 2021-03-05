From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:48:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/imlib2: add IMLIB2_CPE_ID_VENDOR
Message-ID: <20210305094824.1832469-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:enlightenment:imlib2 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aenlightenment%3Aimlib2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imlib2/imlib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index a684ec5b51..a88558575d 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -9,6 +9,7 @@ IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
 IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
+IMLIB2_CPE_ID_VENDOR = enlightenment
 
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
-- 
2.30.0
