From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:56:46 +0100
Subject: [Buildroot] [git commit] package/cairo: add CAIRO_CPE_ID_VENDOR
Message-ID: <20210116203845.BA74F81047@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95071b9363424d0d7ebdc7595fb2370a6d00cc8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cairographics:cairo is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acairographics%3Acairo

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
