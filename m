From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 08:07:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: add CAIRO_CPE_ID_VENDOR
Message-ID: <20210115070715.2075327-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cairographics:cairo is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acairographics%3Acairo

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairo/cairo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 3d2fdbd5de..98f270442a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -8,6 +8,7 @@ CAIRO_VERSION = 1.16.0
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
+CAIRO_CPE_ID_VENDOR = cairographics
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
-- 
2.29.2
